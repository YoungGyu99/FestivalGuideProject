// 채팅 메시지를 표시할 DOM
const chatMessages = document.querySelector('#chat-messages');
// 사용자 입력 필드
const userInput = document.querySelector('#user-input input');
// 전송 버튼
const sendButton = document.querySelector('#user-input button');
// 발급받은 OpenAI API 키를 변수로 저장
const apiKey = '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';
// OpenAI API 엔드포인트 주소를 변수로 저장
const apiEndpoint = 'https://api.openai.com/v1/chat/completions';

// 기본 내용을 변수로 저장
const basicPlan = `
// 1. 기본 계획
(1). 기획배경
(2). 행사목적
(3). 행사 개요
- 행사명
- 주제
- 행사일시
- 행사장소
- 주최
- 후원
- 협찬
- 축제 조직

// 2. 행사 계획
(1) 행사 구성 예) 협찬사 / 후원사 섭외 계획 / 역할 분담 / 홍보물, 포스터 제작(제작 업체사이트) / 행사 파트별진행 / 부스 및 행사 진행 (사진첨부)

(2) 행사 세부 계획
일시/시간/장소/취지/섭외/심사기준(해당시에만 작성)/부스설치(해당시에만 작성)/부스운영(해당시에만 작성)/예 산/그 외 프로그램 (해당시에만 작성)

// 3. 진행 계획
(1) 축제 구성
(2) 진행 세부 계획

// 4. 홍보 계획
(1) 축제 홍보계획
- 일시:
- 홍보 수단:
- 홍보내용:
- 홍보단구성(해당시에만 작성):
- 홍보예산 (예 : 버스나 라디오 홍보시 필요한 예산)

// 5. 안전계획
(1) 안전요원
- 구성 원수
- 구성
(2) 인원배치
- 안전요원 배치 위치
(3) 축제 안전수칙

// 6. 환경관리
(1) 행사장 쓰레기
- 쓰레기통 배치위치
(2) 청소인원

// 7. 예산
- 축제 준비비용
- 콘서트 설치비(해당시에만 작성)
- 인건비
- 식비
- 홍보비
- 부스 설치비(해당시에만 작성)
- 축제 진행비
- 기념품제작비(해당시에만 작성)
- 보험비(해당시에만 작성)

관련업체 페이지
행사용품
음향 | 무대
조명 | 특수효과
영상제작 | 행사중계
에어바운스 | 오락 | 경품
MC | 공연 | 전문인력
체험부스
현수막 | 인쇄물 | 디자인
도시락
배상책임보험
`;

// CSS 스타일을 적용할 클래스를 생성
const chatMessageClass = 'message';

// CSS 스타일을 생성하고 스타일을 적용할 클래스에 적용
const chatMessageStyle = `
  font-size: 16px; /* 글꼴 크기를 조절합니다. */
  line-height: 1.5; /* 간격을 조절합니다. */
  /* 다른 스타일을 추가하려면 여기에 추가하세요. */
`;

// 스타일을 적용할 클래스를 선택하고 스타일을 적용
const chatMessageElements = document.querySelectorAll(`.${chatMessageClass}`);
chatMessageElements.forEach((element) => {
  element.style.cssText = chatMessageStyle;
});

function addMessage(sender, message) {
    // 새로운 div 생성
    const messageElement = document.createElement('div');
    // 생성된 요소에 클래스 추가
    messageElement.className = 'message';
    // 채팅 메시지 목록에 새로운 메시지 추가
    messageElement.textContent = `${sender}: ${message}`;
    chatMessages.prepend(messageElement);
}

// 사용자 입력을 처리하는 함수
async function handleUserInput(userInput) {
    // "축제 기획서를 만들어줘 내용"을 입력으로 받았을 때 처리
    if (userInput.includes("축제 기획서를 만들어줘 내용")) {
        // 사용자 입력에서 지역 이름 추출
        const location = extractLocation(userInput);

        if (location) {
            // 지역 이름을 기반으로 축제 컨텐츠 생성
            const festivalContent = generateFestivalContent(location);
            return festivalContent;
        } else {
            return "지역 이름을 찾을 수 없어요.";
        }
    } else {
        // 다른 입력에 대한 처리
        const aiResponse = await fetchAIResponse(userInput);
        return aiResponse;
    }
}

// 사용자 입력에서 지역 이름 추출하는 함수 (간단한 예제)
function extractLocation(userInput) {
    // 입력에서 "축제 기획서를 만들어줘 내용" 다음에 오는 단어를 지역 이름으로 추출
    const startIndex = userInput.indexOf("축제 기획서를 만들어줘 내용");
    if (startIndex !== -1) {
        const location = userInput.slice(startIndex + 18).trim();
        return location;
    }
    return null;
}

// ChatGPT API 요청
async function fetchAIResponse(prompt) {
    // API 요청에 사용할 옵션을 정의
    const requestOptions = {
        method: 'POST',
        // API 요청의 헤더를 설정
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${apiKey}`
        },
        body: JSON.stringify({
            model: "gpt-3.5-turbo",  // 사용할 AI 모델
            messages: [{
                role: "user", // 메시지 역할을 user로 설정
                content: `축제 기획서를 만들어줘 내용 ${prompt}` // 사용자가 입력한 메시지에 "축제 기획서를 만들어줘 내용"을 추가
            }, ],
            temperature: 0.8, // 모델의 출력 다양성
            max_tokens: 2000, // 응답받을 메시지 최대 토큰(단어) 수 설정
            top_p: 1, // 토큰 샘플링 확률을 설정
            frequency_penalty: 1, // 일반적으로 나오지 않는 단어를 억제하는 정도
            presence_penalty: 1, // 동일한 단어나 구문이 반복되는 것을 억제하는 정도
            stop: ["Human"], // 생성된 텍스트에서 종료 구문을 설정
        }),
    };
    // API 요청후 응답 처리
    try {
        const response = await fetch(apiEndpoint, requestOptions);
        const data = await response.json();
        const aiResponse = data.choices[0].message.content;
        return aiResponse;
    } catch (error) {
        console.error('OpenAI API 호출 중 오류 발생:', error);
        return 'OpenAI API 호출 중 오류 발생';
    }
}

// 전송 버튼 클릭 이벤트 처리
sendButton.addEventListener('click', async () => {
    // 사용자가 입력한 메시지
    const message = userInput.value.trim();
    // 메시지가 비어있으면 리턴
    if (message.length === 0) return;
    // 사용자 메시지 화면에 추가
    addMessage('Q', message);
    userInput.value = '';
    // ChatGPT API 요청후 답변을 화면에 추가
    const aiResponse = await handleUserInput(message);
    addMessage('A', aiResponse);
});

// 사용자 입력 필드에서 Enter 키 이벤트를 처리
userInput.addEventListener('keydown', (event) => {
    if (event.key === 'Enter') {
        sendButton.click();
    }
});
