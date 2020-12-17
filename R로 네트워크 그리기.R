############ 기본1. 패키지 설치 ( 한번만 설치하면됨) ######################

install.packages("igraph")


############ 기본2. 패키지 불러오기 ( 사용할때 마다 불러와야함) ############


library(igraph)

################### igraph 설명  ######################

## ("a", "c") 는 a에서 나와서 c로 간다는 의미
## ("a","c","a","e")는 a에서 나와서 c로, a에서 나와서 e로 간다는 의미
## isolates 는 고립된 노드 들의 이름
g3 <- graph( c("a", "c", "a", "e", "b", "a", "f", "a", "a","d", "d","j", "d","m", "k","d"
               , "l","d", "i","m"),
             isolates = c("h","g"))
g3

## plot 함수 내부에서 여러가지를 정할 수 있음 
## edge는 간선, vertex는 노드 

plot(g3, edge.arrow.size=0.5, vertex.color="gold", vertex.size=15, edge.width=5, 
     
     vertex.frame.color="gray", vertex.label.color="black", 
     
     vertex.label.cex=0.8, vertex.label.dist=3) 

##간선과 노드 확인
##현재 노드간 연결 상태, 현재 노드 상태 확인 가능

E(g3)
V(g3)

## 그래프 g3의 행렬 상태 확인
g3[]

##현재 노드의 설정된 이름
V(g3)$name
V(g3)$name <-c("전남대","전북대","원광대","광주대","목포대","서울대","연세","고려","성균관","한양","건국","경기대","파주대")

V(g3)$jiyeok<- c("gwangju","gwangju","gwangju","gwangju","gwangju","seoul","seoul","seoul","seoul","seoul","seoul","busan","hanam")

## 좌표 지정하기
vertex_attr(g3, name='x') <-c(-2,-3,-1,-2,-2,2,2,2,1,3,3,0,0)
vertex_attr(g3, name='y') <-c(0,0,0,1,-1,0,1,-1,0,0,-3,-3,3)

## 각 노드의 이름에 x와 y 좌표 지정해줌

par(mfrow=1:2)

##현재까지 출력
plot(g3, edge.arrow.size=0.5, vertex.color="gold", vertex.size=15, edge.width=5,
     
     vertex.frame.color="gray", vertex.label.color="black", 
     
     vertex.label.cex=0.8, vertex.label.dist=2) 

## 좌표가 지정된 네트워크 출력 , 이전 출력과는 다르게 원하는 위치에 출력됨

V(g3)$color = V(g3)$jiyeok

## color 속성 만들어줌 , 지역 속성과 요소가 같은것( 같은 개수를 갖도록 하기 위해서)

V(g3)$jiyeok

## 지역에 따라서 다른 색을 color 속성 안에 넣어줌

V(g3)$color=gsub("gwangju","Skyblue",V(g3)$color) 
V(g3)$color=gsub("seoul","blue",V(g3)$color) 
V(g3)$color=gsub("hanam","green",V(g3)$color) 
V(g3)$color=gsub("busan","red",V(g3)$color) 


## 출력, 대신 위의 출력관느 다르게 vertex.color가 빠짐

plot(g3,edge.arrow.size=0.5, vertex.size=15, edge.width=5,
     
     vertex.frame.color="black", vertex.label.color="black", 
     
     vertex.label.cex=0.8, vertex.label.dist=3) 



## 중심성에 따라서 노드 사이즈를 다르게 하기, 여기서 
## 중심성 수치는 원하는걸 지정하면 됨
## 1. 연결중심성
## 2. 고유벡터 중심성
## 3. 페이지랭크
## 4. 근접중심성
## 5. 매개중심성
## 3번 페이지 랭크가 현재 가장 발전된 네트워크 이론

deg <- igraph::degree(g3, V(g3), mode="all")
V(g3)$size <- deg*3

## 위의 출력과는 다르게 vertex.size 가 빠짐
## 중심성이 큰 a,d는 크고 중심성이 작은 g,h는 작게 표현

plot(g3,edge.arrow.size=0.5, edge.width=5,
     
     vertex.frame.color="black", vertex.label.color="black", 
     
     vertex.label.cex=0.8, vertex.label.dist=3) 


## 간선 가중치 지정
## 임의로 각 간선의 가중치를 지정함
E(g3)
E(g3)$weight <- c(3,1,3,1,1,2,1,3,2,2)

## 간선의 가중치만큼 간선의 두께를 지정
E(g3)$width = E(g3)$weight/2
E(g3)$weight
E(g3)$width

## 출력
## 아래와 같이 간선의 두께를 하나하나 직접 지정해도 됨
plot(g3,edge.arrow.size=0.5, edge.width=c(3,1,3,1,1,2,1,3,2,2),

     vertex.frame.color="black", vertex.label.color="black", 

     vertex.label.cex=0.8, vertex.label.dist=3) 

