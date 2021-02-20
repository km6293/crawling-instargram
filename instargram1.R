#인스타그램 좋아요, 팔로우, 댓글달기 자동화
#findElement 가 바뀌수도 있으니 주의

library(RSelenium)

remDr <- remoteDriver(remoteServerAddr="localhost" , port="포트번호" , browserName="chrome")
remDr$open()
remDr$navigate("https://www.instagram.com/")
Sys.sleep(3)
#ID 
id <- remDr$findElement(using="css" , "#loginForm > div > div:nth-child(1) > div > label > input")
id$clickElement()
id$sendKeysToElement(list("아이디"))

#PW
pw <- remDr$findElement(using="css" , "#loginForm > div > div:nth-child(2) > div > label > input")
pw$clickElement()
pw$sendKeysToElement(list("비밀번호",key="enter"))
Sys.sleep(5)

#로그인 정보를 저장하시겠어요? -> 나중에 하기
late <- remDr$findElement(using="css" , "#react-root > section > main > div > div > div > div > button")
late$clickElement()

#알림 설정 -> 나중에 하기
notice <- remDr$findElement(using="css" , "body > div.RnEpo.Yx5HN > div > div > div > div.mt3GC > button.aOOlW.HoLwm")
notice$clickElement()

#해쉬태그 글
search <- remDr$findElement(using="css" , "#react-root > section > nav > div._8MQSO.Cx7Bp > div > div > div.LWmhU._0aCwM > input")
search$sendKeysToElement(list("좋아요반사",key="enter"))


#해쉬태그 검색
click <- remDr$findElement(using="css" , "#react-root > section > nav > div._8MQSO.Cx7Bp > div > div > div.LWmhU._0aCwM > div.drKGC > div > a:nth-child(1) > div > div > div.uyeeR > span")
click$clickElement()




#-------------------------------------------------

# 선팔 & 좋아요 & 댓글  창 옆으로

post_click <- remDr$findElement(using="css" , "#react-root > section > main > article > div:nth-child(3) > div > div:nth-child(1) > div:nth-child(1) > a > div > div._9AhH0")
post_click$clickElement()

#1~10 까지 반복
for(i in c(1:10)){
  Sys.sleep(6)
  
  #좋아요
  like <- remDr$findElements(using="css" , ".fr66n")
  if(length(like) == 0){
    comment_click <- remDr$findElement(using="css" , "body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow")
    comment_click$clickElement()
  }else{
    like <- remDr$findElement(using="css" , ".fr66n")
    like$clickElement()
    
    Sys.sleep(2)
    
    #팔로우
    follow <- remDr$findElement(using="css" , "body > div._2dDPU.CkGkG > div.zZYga > div > article > header > div.o-MQd.z8cbW > div.PQo_0.RqtMr > div.bY2yH > button")
    follow$clickElement()
    unfollow <- remDr$findElements(using="css" , "button.aOOlW.HoLwm")
    if(length(unfollow) == 1){
      cancel_unfollow <- remDr$findElement(using="css" , "body > div.RnEpo.Yx5HN > div > div > div > div.mt3GC > button.aOOlW.HoLwm")
      cancel_unfollow$clickElement()
      
      Sys.sleep(3)
      
      comment_click <- remDr$findElement(using="css" , "body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow")
      comment_click$clickElement()
      
    }else{
      
      Sys.sleep(6)
      
      #댓글
      
      comment <- remDr$findElements(using="css" , "form > textarea")
      if(length(comment) == 0){
        comment_click <- remDr$findElement(using="css" , "body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow")
        comment_click$clickElement()
      }else{
        comment <- remDr$findElement(using="css" , "form > textarea")
        comment$clickElement()
        
        comment2 <- remDr$findElement(using="css" , ".Ypffh")
        comment2$sendKeysToElement(list("좋아요 꾹 누르고 갑니다~"))
        
        Sys.sleep(3)
        
        #댓글 달기
        comment_click <- remDr$findElement(using="css" , "section.sH9wk._JgwE > div > form > button")
        comment_click$clickElement()
        
        Sys.sleep(5)
      }
      comment_click <- remDr$findElement(using="css" , "body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow")
      comment_click$clickElement()
      
      Sys.sleep(1)
      
    }
  }
}

