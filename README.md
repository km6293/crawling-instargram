# 학원에서 배운 크롤링으로 실생활에서 사용해보기

R - 크롤링을 통한 인스타그램 계정 관리 자동화 구현(팔로우, 좋아요, 댓글, 언팔로우 코드)

instargram1.R -> follow, like, commant

instargram2.R -> unfollow



<h3>참고</h3>

인스타그램 제한

350개 이상의 좋아요 버튼을 누를 시 제한 (시간당)

160명 이상의 팔로우 버튼을 누를 시 제한 (시간당)

스팸을 막기 위해 많은 follwing 수를 제한




instargram 페이지 자체에서 findElement의 css selector OR name 가 바뀌수도 있으니 주의

1. 개인 id, pw 입력 

2. 로그인 정보 저장, 알림 설정 -> 나중에 하기 버튼을 누르게 해둠

3. 자동화 하려는 해쉬태그 글, 댓글 입력해도 됨

4 
 - 시간 제어 - Sys.sleep 
 - 작업 수 제어 - for


