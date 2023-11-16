package com.future.my.fastival.web;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

@Controller
public class FestivalController {

    @GetMapping("/festivals")
    public String getFestivals(Model model) {
        // 공공데이터 API 요청 URL
        String apiUrl = "http://api.kcisa.kr/openapi/service/rest/meta4/getKCPG0504?serviceKey=YOUR_API_KEY";

        // RestTemplate을 사용하여 API 호출
        RestTemplate restTemplate = new RestTemplate();
        String xmlResponse = restTemplate.getForObject(apiUrl, String.class);

        // XML 파싱 및 데이터 추출 (위에서 설명한 방법 사용)

        // 데이터를 모델에 추가
        model.addAttribute("festivals", festivals); // festivals는 위에서 추출한 데이터 리스트

        // Thymeleaf 템플릿을 사용하여 HTML 페이지를 반환
        return "festivals";
    }
}
