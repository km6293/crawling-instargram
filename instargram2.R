#인스타그램 언팔로우 자동화
#findElement 가 바뀌수도 있으니 주의

library(RSelenium)


remDr <- remoteDriver(remoteServerAddr="localhost" , port="포트번호" , browserName="chrome")
remDr$open()
remDr$navigate("https://www.instagram.com/")

Sys.sleep(2)
#ID 
id <- remDr$findElement(using="css" , "#loginForm > div > div:nth-child(1) > div > label > input")
id$clickElement()
id$sendKeysToElement(list("아이디"))

#PW
pw <- remDr$findElement(using="css" , "#loginForm > div > div:nth-child(2) > div > label > input")
pw$clickElement()
pw$sendKeysToElement(list("",key="enter"))

Sys.sleep(2)
#있는지 없는 체크해야됨
#로그인 정보를 저장하시겠어요? -> 나중에 하기
late <- remDr$findElement(using="css" , "#react-root > section > main > div > div > div > div > button")
late$clickElement()

Sys.sleep(2)
#있는지 없는 체크해야됨
#알림 설정 -> 나중에 하기
notice <- remDr$findElement(using="css" , "body > div.RnEpo.Yx5HN > div > div > div > div.mt3GC > button.aOOlW.HoLwm")
notice$clickElement()

#프로필
profile <- remDr$findElement(using="css" , "div:nth-child(5) > span > img")
profile$clickElement()

profile_click <- remDr$findElement(using="css" , "._01UL2 > a:nth-child(1) > div")
profile_click$clickElement()

Sys.sleep(1)
# follow-------------------------------------------------------------------------------

#follow 수 저장
follow_value <- remDr$findElement(using="css" , "#react-root > section > main > div > header > section > ul > li:nth-child(2) > a > span")
follow_value <- follow_value$getElementText()
follow_value <- as.numeric(follow_value)

#follow 창 열기
follow <- remDr$findElement(using="css" , "a > span")
follow$clickElement()
Sys.sleep(1)

# 팔로우 저장
all_follow <- c() 

#follow 조회
all_follow_value <- follow_value %/% 12
i <- 12
i2 <- 0
while(i2 < all_follow_value){
  find_follow <- paste("body > div.RnEpo.Yx5HN > div > div > div.isgrP > ul > div > li:nth-child(",i,")")
  find_follow_2 <- remDr$findElement(using="css" , find_follow)
  find_follow_2$clickElement()
  i <- i+12
  i2 <- i2+1
}

#팔로우 리스트 저장
fe1 <- remDr$findElements(using="css" , "div > div > span > a")
repl <- sapply(fe1 , function(x){ x$getElementText()})
all_follow <- c(all_follow , unlist(repl))

#엑스박스
xbox <- remDr$findElement(using="css" , "div:nth-child(1) > div > div:nth-child(3) > button > div > svg")
xbox$clickElement()

Sys.sleep(1)
# following-------------------------------------------------------------------------------

#following 숫자
following_value <- remDr$findElement(using="css" , "#react-root > section > main > div > header > section > ul > li:nth-child(3) > a > span")
following_value <- following_value$getElementText()
following_value <- as.numeric(following_value)

#following 창 열기
following <- remDr$findElement(using="css" , "li:nth-child(3) > a > span")
following$clickElement()
Sys.sleep(1)
#following 조회

all_following_value <- following_value %/% 12

ii <- 12
ii2 <- 0
while(ii2 < all_following_value){
  find_following <- paste("body > div.RnEpo.Yx5HN > div > div > div.isgrP > ul > div > li:nth-child(",ii,")")
  find_following_2 <- remDr$findElement(using="css" , find_following)
  find_following_2$clickElement()
  ii <- ii+12
  ii2 <- ii2+1
  (Sys.sleep(1))
}

# 팔로윙 저장
all_following <- c() 

#팔로윙 리스트 저장
fe2 <- remDr$findElements(using="css" , "div > div > span > a")
repl2 <- sapply(fe2 , function(x){ x$getElementText()})
all_following <- c(all_following , unlist(repl2))

Sys.sleep(1)
# 비교-------------------------------------------------------------------------------

all_follow
all_following

real_follow <- intersect(all_follow,all_following)
real_unfollow <- setdiff(all_following,all_follow)

#맞팔, 언팔 사람들
real_follow
real_unfollow

#맞팔, 언팔 숫자
length(real_follow)
length(real_unfollow)

# 언팔하기---------------------------------------------------------------------------


unfollow_check <- all_following %in% all_follow
length(all_following)

iii <- 1
iii2 <- 1
while(iii2 < length(all_following)){
  if(unfollow_check[iii] == FALSE){
    pageNumCss <- paste("body > div.RnEpo.Yx5HN > div > div > div.isgrP > ul > div > li:nth-child(",iii,") > div > div.Pkbci > button")
    unfollow_button <- remDr$findElement(using="css" , pageNumCss)
    unfollow_button$clickElement()
    Sys.sleep(0.5)
    unfollow_button_yes <- remDr$findElement(using="css" , "button.aOOlW.-Cab_")
    unfollow_button_yes$clickElement()
    Sys.sleep(1)
    iii <- iii+1
  }else{
    iii <- iii+1
  }
  iii2 <- iii2+1
}

