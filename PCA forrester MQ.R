library(ggplot2)
library(devtools)
install_github("ggbiplot", "vqv")
library(ggbiplot)

Forrester_MQ <- read.csv("E:/R_proyectos/Herramientas_Explotacion/Forrester_MQ.csv", sep=";")
View(Forrester_MQ)
data("iris")
head(iris)
library(RWeka)
library(reshape2)
ft <- melt(Forrester_MQ)
t(Forrester_MQ)
Forrester_MQ[c(1:15),c(1:15)]
ft[c(1:15),c(1:15)]
n <- Forrester_MQ$Variable
p <- as.data.frame(t(Forrester_MQ[,-15]))
p <- as.data.frame(t(Forrester_MQ[,-1]))
colnames(p)
colnames(p) <- n
View(p)
View(p)
tabla_gartner <- p
library(caret)
trans = preProcess(tabla_gartner[,2:15],
method=c("BoxCox", "center",
"scale", "pca"))
install.packages("e1071")
library(e1071)
trans = preProcess(tabla_gartner[,2:15],
method=c("BoxCox", "center",
"scale", "pca"))
PC = predict(trans, tabla_gartner[,2:15])
head(PC, 3)
trans$rotation
plot(pc)
plot(PC)
plot(trans)
plot(trans$rotation)
text(trans$rotation)
plot(trans$rotation)
plot(trans$rotation[,1])
head(USArrests)
a <- princomp(tabla_gartner)
biplot(PC)
biplot(trans$rotation)
log.ir <- log(tabla_gartner[,2:15])
ir.species <- tabla_gartner[,1]
ir.pca <- prcomp(log.ir,
center = TRUE,
scale. = TRUE)
plot(ir.pca, type = "l")
predict(ir.pca,
newdata=tail(log.ir, 2))
library(devtools)
install_github("ggbiplot", "vqv")
library(ggbiplot)
g <- ggbiplot(ir.pca, obs.scale = 1, var.scale = 1,
groups = ir.species, ellipse = TRUE,
circle = TRUE)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal',
legend.position = 'top')
print(g)
g <- ggbiplot(ir.pca, obs.scale = 1, var.scale = 1,
               groups = ir.species, ellipse = TRUE,
              circle = TRUE)


g <- ggbiplot(ir.pca, obs.scale = 1, var.scale = 1,
groups = ir.species, ellipse = TRUE,
circle = TRUE)
g
biplot(ir.pca)
g <- g + theme(legend.direction = 'horizontal',
legend.position = 'top')

pr.forrester <- prcomp(tabla_gartner,scale. = TRUE)

gv2 <- ggbiplot(pr.forrester, obs.scale = 1, var.scale = 0.02,
                labels = rownames(tabla_gartner),ellipse = TRUE, circle = TRUE) +
  scale_color_discrete(name = '') +
  theme(legend.direction = 'horizontal', legend.position = 'top')

gv2
pr.gartner <- prcomp(Gartner.Scores[,-1],scale. = TRUE)

g_gartner <- ggbiplot(pr.gartner, obs.scale = 1, var.scale = 1,
                      labels = Gartner.Scores[,1],ellipse = TRUE, circle = TRUE) +
  theme(legend.direction = 'horizontal', legend.position = 'top')
g_gartner

variables <- critical_capabilities$Critical.Capability
transpuesta <- as.data.frame(t(critical_capabilities[,-1]))
colnames(transpuesta)
colnames(transpuesta) <- variables

critical_cap_gartner <- transpuesta

pr.gartner_critical <- prcomp(critical_cap_gartner,scale. = TRUE)

gv2 <- ggbiplot(pr.gartner_critical, obs.scale = 1, var.scale = 0.02,
                labels = rownames(critical_cap_gartner),ellipse = TRUE, circle = TRUE) +
  scale_color_discrete(name = '') +
  theme(legend.direction = 'horizontal', legend.position = 'top')

gv2

MSTR_v_TAB_QLW_PowerBI <- as.data.frame(filter(critical_cap_gartner,rownames(critical_cap_gartner) %in% c('Microstrategy','Tableau','Microsoft','Qlik')))

MSTR_v_TAB_QLW_PowerBI <- cbind(rownames(critical_cap_gartner)[which(rownames(critical_cap_gartner)%in% c('Microstrategy','Tableau','Microsoft','Qlik'))], as.data.frame(filter(critical_cap_gartner,rownames(critical_cap_gartner) %in% c('Microstrategy','Tableau','Microsoft','Qlik'))))
