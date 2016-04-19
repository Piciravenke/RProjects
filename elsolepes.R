5+5
6-3
b = c(2,3,4,5.5,7)
print(b)
b
"b"
7:20
20:7
c(TRUE,FALSE,TRUE,TRUE)
as.character(33:24)
as.numeric(as.character(33:24)) #típuskonverzió
factor(c("cat","dog","dog"))
factor(c("mouse","cat","dog","dog","mouse"))
v = 1:10
v
ls() #létrehozott objektumok listázása vektorban
rm("v") #törli az adott objektumot
ls()
rm(list = ls()) # törli az összes objektumot a memóriában
v = c(5,6,2,2,3,0,-1,2,5,6) #numerikus vektor és pár fgv
mean(v)
min(v)
max(v)
range(v)
length(v)
unique(v)
l = c(TRUE, FALSE, FALSE, TRUE) #logikai vektor és pár fgv
any(l)
all(l)
sum(l)
which(l)
x=1:5
x >= 3 #logikai vektort ad vissza
1 %in% 1:10 #benne van-e
paste("There are", "5", "books.") #paste fgv alkalmazásai karakterláncra
paste("Image", 1:5)
x = 80
paste("There are", x, "books.")
seq(from = 100, to = 150, by = 10)
seq(from = 100, to = 150, length.out = 5)
seq(from = 100, to = 150, along.with = v)

vector(mode = "numeric", length = 2) #default vektorok
vector(mode = "character", length = 10)
vector(mode = "logical", length = 3)
rep(x = 22, times = 10) #rep vektorok(használható több tagú vektoron)
x = "Subsetting strings" 
substr(x, start = 1, stop = 14) #substring

x = c(5,6,1,2,3,7,2,5,3,12,20,43) #subset/részvektor létrehozása
x[3]
x[length(x)]
x[3] = 8
x[1:2]
x[c(3,1)]
x[length(x):1] #megfordítja az elemek sorrendjét a vektorban! FONTOSNAK TŰNIK!
x[3:8] = c(15,16) #recycle itt is érvényes
x

x = c(2,5,1,0)
x[2] = NA
x
is.na(x)
!is.na(x)
x[!is.na(x)] # csak létező elemek kiíratása
mean(x[!is.na(x)])
mean(x, na.rm = TRUE)
