# DSO105C_L03_HANDS-ON
# ADVANCED CHI-SQUARES


# For each part:
# 1. Check and correct for assumptions if possible
# 2. Perform the appropriate categorical data analysis in R
# 3. Provide a one-sentence conclusion at the bottom of your program files about the analysis you performed.


# PART 1
# Please answer the following question.

#   Does the term of the loan influence loan status? If so, how?

    CrossTable(loans$term, loans$loan_status, chisq = TRUE, expected = TRUE, sresid=TRUE, format="SPSS")

#   ANSWER: The term of the loan does influence the loan status. Loan terms of 36 months are more likely to
#           be fully paid and less likely to be charged off than expected. Particularly in comparison to
#           60 month loan terms.    
    
    

# PART 2
# Please answer the following question.

#   How has the ability to own a home changed after 2009?

    loans$DateR = as.Date(paste(loans$Date), "%m/%d/%Y")
    
    loans1 = separate(loans, DateR, c("Year", "Month", "Day"), sep="-")
    
    loans1$YearR = NA
    loans1$YearR[loans1$Year <= 2009] = 0
    loans1$YearR[loans1$Year > 2009] = 1
    
    loans1$RentvOwn = NA
    loans1$RentvOwn[loans1$home_ownership == "RENT"] = 0
    loans1$RentvOwn[loans1$home_ownership == "OWN"] = 1
    
    CrossTable(loans1$RentvOwn, loans1$YearR, fisher=TRUE, chisq = TRUE, mcnemar = TRUE, expected = TRUE, sresid=TRUE, format="SPSS")

#   ANSWER: There does not seem to be a statistical difference in the ability to own a home before, or after 2009.


    
# PART 3
# Please answer the following question.

#   The news just ran a story that only 15% of homes are fully paid for in America, and that another 10% have given up on paying it back,
#   so the bank has "charged off" the loan.
#   Does it seem likely that the data for this hands on came from the larger population of America?

    loans %>% group_by(loan_status) %>% summarize(count=n())
    
    observed = c(18173, 3784)
    expected = c(0.15, 0.85)
    chisq.test(x = observed, p = expected)
    
    observed2 = c(18675, 3282)
    expected2 = c(0.9, 0.1)
    chisq.test(x = observed2, p = expected2)
    
#   ANSWER: The same percentages do not hold true in this data set, which indicates that this data did
#           not come from the larger population of America
    
    
    
