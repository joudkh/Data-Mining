library("arules")

library("arulesViz")

library("datasets")














# I'm using the Groceries dataset that comes
# bundled with the arules package.
data(Groceries)








# Lets inspect the Groceries data first


# dimensionality of the data
dim(Groceries)

# first 6 observations
head(Groceries)

# Class object kind (transactional dataset)
class(Groceries)











itemFrequencyPlot(Groceries)

itemFrequencyPlot(Groceries,topN=20)

itemFrequencyPlot(Groceries,topN=20,type="absolute")








# Lets find out the rules using the apriori algorithm.
rules<-apriori(Groceries)








rules<-apriori(Groceries,
               parameter = list(supp=0.01,conf=0.5))










inspect(rules)






rules<-sort(rules,by="confidence",decreasing = 1)





inspect(rules)

# Generating Rules
# There are three parameters controlling the number of rules to be generated:
# Support and Confidence and Lift

# Support is an indication of how frequently the itemset appears in the dataset. Consider only the two transactions from the above output. The support of the item citrus fruit is 1/2 as it appears in only 1 out of the two transactions.
# Confidence is an indication of how often the rule has been found to be true.


# Limiting the number of rules generated






wholemilk_rules <- apriori(data=Groceries,
                           parameter=list(minlen=4,supp=0.001,conf = 0.8),
                           appearance = list(rhs="whole milk"))






# The above code shows what products are bought before buying "whole milk" and will generate rules that lead to buying "whole milk".

inspect(wholemilk_rules)



# If you want to get stronger rules, you have to increase the confidence.

plot(rules)


plot(rules, method = "grouped")


