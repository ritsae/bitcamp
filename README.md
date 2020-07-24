# bitcamp
bitcamp 152 java project repo :space_invader:
Tool : IntelliJ, STS, VSCode, Eclipse EE, AWS RDS/EC2, docker


:notebook_with_decorative_cover: cafein24 - Team mini project
  - part : 기능명세서/스토리보드 작성, ppt, 
           로그인/로그아웃, 지도/매장검색 페이지, 전체 HTML(JSP)/CSS 작성(테마사용X), Bootstrap, JS
  - 사용기술 : Spring, JSP, MY-SQL, Mybatis
  - 서류 등 정리 : https://www.notion.so/2st-project-80874aeb571243abbff810bf1c754e69
  - :pushpin: PPT : https://bit.ly/2Bqf1b8
  - :clapper: 시연 동영상 : https://bit.ly/3fXGika
 
 
:notebook_with_decorative_cover: PMService - Team final project
  - part : DashBoard part 서류/페이지 작성, HTML/CSS(테마 커스텀 배포), thymeleaf layout 작성
  - 사용기술 : Spring Boot, thymeleaf, Oracle(docker사용/MAC OS), Mybatis, HTML/CSS/Bootstrap, JS
  - 서류 등 정리 : https://www.notion.so/Final-Project-c0e2d57663634547b9477003372e2864
  - :pushpin: PPT : https://bit.ly/2WQPsHG
  - :clapper: 시연 동영상 : https://youtu.be/JBT9Lc4gzEo
  
  :heavy_plus_sign: 07/09 : Oracle -> AWS RDS로 변경, EC2로 배포(dashboard외 다른 파트 미구현)<br>
  http://15.164.81.143/<br>
  :white_check_mark: TEST ID / PW -> 'PM / 1234' or 'user001 / 1234'<br><br>
  
  :x: EC2 구현 중 발생한 문제<br>
      1. RDS DB 커넥션 문제 -> EC2의 보안그룹을 RDS보안그룹 인바운드 추가로 해결<br>
      2. google chart api 외 프로젝트 링크 에러 -> 절대경로 사용이 문제, 절대경로 삭제/수정으로 해결<br>
      3. 파일 업로드/다운로드가 안 되는 문제 -> EC2로 옮기면서 파일을 찾지 못하는 문제(js코드로 다운로드 해놓은 상태), 미해결<br>
    
