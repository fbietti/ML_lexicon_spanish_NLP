
test <- read.csv2('./test.csv', sep=',')
test$Date <- as.POSIXct(test$created, format = "%Y-%m-%d %H:%M:%S")


##Corpus 
corp_test <- corpus(test, text_field = "text")
docid <- test$screenName
docnames(corp_test) <- docid
print(corp_test)

# tokenize corpus
toks_test <- tokens(corp_test, remove_punct = TRUE)


### dictionary 
lengths(sentiments_dico_esp)

toks_test_timm <- tokens_lookup(toks_test, dictionary = sentiments_dico_esp)

summary(toks_test_timm)


# create a document document-feature matrix and group it by day
dfmat_test_timm <- dfm(toks_test_timm) %>% 
  dfm_group(groups = id)



#Visualisation 
matplot(dfmat_test_timm, type = "l", lty = 1, col = 1:2,ylab = "Frequency", xlab = "")
grid()
legend("topright", col = 1:2, legend = colnames(dfmat_test_timm), lty = 1, bg = "white")


plot(dfmat_test_timm[,"positive"] - dfmat_test_timm[,"negative"],type = "l", ylab = "Sentiment", xlab = "", ylim = c(-10,10))
grid()
abline(h = 0, lty = 2)


dat_smooth <- ksmooth(x = dfmat_test_timm$Date, y = dfmat_test_timm[,"positive"] - dfmat_test_timm[,"negative"],kernel = "normal", bandwidth = 30)
plot(dat_smooth$x, dat_smooth$y, type = "l", ylab = "Sentiment", xlab = "")
grid()
abline(h = 0, lty = 2)

#### descriptive statistics 
test_timm <- as.numeric(dfmat_test_timm[,"positive"] - dfmat_test_timm[,"negative"])
class(test_timm)
mean(test_timm, na.rm = T)
sd(test_timm, na.rm = T)

hist(test_timm)





