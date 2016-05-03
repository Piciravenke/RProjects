#install.packages("sp", lib="/data/Rpackages/")
library(reshape2)
library(plyr)
library(raster)
library(ggmap)
library(sp)
library(rgdal)
library(rgeos)
library(ggplot2)

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

num = 1:4
lower = c("a","b","c","d")
upper = c("A","B","C","D")
df = data.frame(num, lower, upper, stringsAsFactors = FALSE)
df
#word = c("One","Two","Three","Four")
df = cbind(df, word, stringsAsFactors = FALSE)
df
dim(df)
rownames(df)
colnames(df)
colnames(df) = toupper(colnames(df))
colnames(df)
str(df)
df[2,3]
df[ ,3, drop = FALSE]
df[df$LOWER %in% c("a","d"), c("LOWER","UPPER")]
df$word[df$num == 2] = "Two"
write.csv(df, "/home/miki/RProjects/df.csv")

x = 3
if(x > 2) print("x is large!") else print("x is small!")
x = 1
if(x > 2) {print("x is large!")} else {print("x is small!")}

x = c(-1,-8,2,5,-3,5,-9)
ifelse(x < 0, -x, x)

for(i in 1:5) {print(i)}

iris=iris[sample(1:nrow(iris),6),]
x = tapply(iris$Petal.Width, iris$Species, mean)
x
x["setosa"]
as.numeric(x)

apply(iris[, 1:4], 1, mean)
apply(iris[, 1:4], 2, mean)

iris[3,2] = NA
iris
apply(iris[, 1:4], 2, mean)
apply(iris[, 1:4], 2, mean, na.rm = TRUE)

iris_melt = melt(iris, id.vars = "Species")
ddply(iris,.(Species),summarize,sepal_area = mean(Sepal.Length * Sepal.Width),petal_area = mean(Petal.Length * Petal.Width))


x = matrix(7:12, ncol = 3)
length(x)
nrow(x)
ncol(x)
dim(x)

m = matrix(NA, ncol = 3, nrow = 3)
m[2:3, 1:2] = matrix(1:4, nrow = 2)
m

y = array(1:24, c(2,2,3))
y

r1 = raster(x)
r1

addresses = c("2200 Sunport Blvd, Albuquerque, NM 87106, USA","7401 Paseo Del Volcan Northwest Albuquerque, NM 87121, USA","121 Aviation Dr, Santa Fe, NM 87507, USA")
airports = geocode(addresses)
airports 
airports$name = c("Albuquerque International","Double Eagle II","Santa Fe Municipal")
airports
coordinates(airports) = ~ lon + lat
class(airports)
print(airports)
proj4string(airports) = CRS("+proj=longlat +datum=WGS84")
writeOGR(airports, "D:\\R Project\\RProjects", "airports", "ESRI Shapefile")
airports = readOGR("D:\\R Project\\RProjects","airports",stringsAsFactors = FALSE)

summary(airports)
proj4string(airports)
length(airports)
row.names(airports)
dimensions(airports)          
airports@data
str(airports)

airports_sp = as(airports, "SpatialPoints")
airports_sp@data
as(airports_sp, "SpatialPointsDataFrame")@data
plot(airports)
coordinates(airports)

