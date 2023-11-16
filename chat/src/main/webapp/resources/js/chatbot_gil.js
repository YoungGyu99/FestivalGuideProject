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
    // "축제컨텐츠 만들어줘"를 입력으로 받았을 때 처리
    if (userInput.includes("지역개발형 축제컨텐츠 만들어줘")) {
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
    // 입력에서 "축제컨텐츠 만들어줘" 다음에 오는 단어를 지역 이름으로 추출
    const startIndex = userInput.indexOf("지역개발형 축제컨텐츠 만들어줘");
    if (startIndex !== -1) {
        const location = userInput.slice(startIndex + 10).trim();
        return location;
    }
    return null;
}

// 지역 이름을 기반으로 축제 컨텐츠 생성하는 함수 (더미 데이터 사용)
function generateFestivalContent(location) {
    // 실제로는 데이터베이스 또는 API를 사용하여 실제 데이터를 가져와야 합니다.
    // 이 예제에서는 간단한 더미 데이터를 사용합니다.
    const festivalData = {
        서울: "서울 축제 컨텐츠 예시입니다.",
        부산: "부산 축제 컨텐츠 예시입니다.",
        인천: "인천 축제 컨텐츠 예시입니다.",
        // 다른 지역에 대한 더미 데이터 추가
    };

    const content = festivalData[location];
    if (content) {
        return content;
    } else {
        return "죄송해요, 해당 지역의 축제 정보를 찾을 수 없어요.";
    }
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
                content: `지역개발형 축제컨텐츠 만들어줘 ${prompt}` // 사용자가 입력한 메시지에 "축제컨텐츠 만들어줘"를 추가
            }, ],
            temperature: 0.8, // 모델의 출력 다양성
            max_tokens: 500, // 응답받을 메시지 최대 토큰(단어) 수 설정
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
