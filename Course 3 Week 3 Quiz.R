getwd()
a = read.csv("hid.csv")
library(dplyr)
library(tidyr)
a = tbl_df(a)
a
agricultureLogical = a %>% drop_na(ACR, AGS)  %>% mutate(LOGICAL = ACR == 3 & AGS == 6)
agricultureLogical$LOGICAL

which(agricultureLogical$LOGICAL == TRUE)
?drop_na



df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
df %>% drop_na()
df %>% drop_na(x)

install.packages("jpeg")
library(jpeg)
b = readJPEG("jeff.jpg", native = TRUE)
str(b)
b
quantile(b, probs = 0.8)


c = read.csv("gdp.csv", skip = 3, nrows = 191)
d = read.csv("edstats.csv", nrows = 227)
c = tbl_df(c)
d = tbl_df(d)

names(c)
colnames(c)[1] = "CountryCode"
c = c %>% select(-("X.1"))
c = select(c, -(X.2:X.6))
colnames(c)[4] = "money"
c = c %>% drop_na(money)
c
i = c[-1, ]
View(i)
View(d)
names(i)


names(d)

?match

e = which(i$CountryCode %in% d$CountryCode == TRUE)
f = c$CountryCode %in% d$CountryCode

g = arrange(i, money )
View(g)

j = merge(i,d,by = "CountryCode")
View(j)
names(j)

colnames(j)[2] = "rank"
names(j)

k = arrange(j, desc(rank))
View(k)


groupedDF <- group_by(mergedDF, Income.Group)
avgRankings<- dplyr::summarize(groupedDF, agvGDP = mean(Ranking))
filter(avgRankings, Income.Group %in% c('High income: nonOECD', 'High income: OECD'))


suppressMessages(library(Hmisc))
#using cut2(), need not mention quantile boundaries explicitly, set g=no_of_quantile_groups
cutGDP <- cut2(sortedDF$Ranking, g=5 )
table(cutGDP, sortedDF$Income.Group )



mergedDT[`Income Group` == "High income: OECD"
         , lapply(.SD, mean)
         , .SDcols = c("Rank")
         , by = "Income Group"]


mergedDT[`Income Group` == "High income: nonOECD"
         , lapply(.SD, mean)
         , .SDcols = c("Rank")
         , by = "Income Group"]


# install.packages('dplyr')
library('dplyr')

breaks <- quantile(mergedDT[, Rank], probs = seq(0, 1, 0.2), na.rm = TRUE)
mergedDT$quantileGDP <- cut(mergedDT[, Rank], breaks = breaks)
mergedDT[`Income Group` == "Lower middle income", .N, by = c("Income Group", "quantileGDP")]

##rowwise() is my go-to function. It's like group_by() but it treats each row as an individual group.

##df %>% rowwise() %>% mutate(Sum = sum(c(var1, var2, var3), na.rm = TRUE))






























