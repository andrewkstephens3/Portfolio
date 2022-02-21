# DSO102C - L10
# FINAL PROJECT



# Load libraries
  install.packages("Ecdat")
  library(Ecdat)
  View(Cigarette)
  

  
# Create a boxplot of the average number of packs per capita by state.
  
      packPC.BP = ggplot(Cigarette, aes(x = state, 
                                        y = packpc))
      packPC.BP + geom_boxplot(
        fill = "lightsteelblue",
        color = "steelblue4") +
        ggtitle("Packs Per Capita by State") +
        xlab("State") + 
        ylab("Average per Year")
      
      
    # Which states have the highest number of packs? Which have the lowest?
      
      Highest.State.PPC = Cigarette %>% group_by(state) %>% summarise(Mean = mean(packpc)) %>% arrange(desc(Mean))
      Lowest.State.PPC = Cigarette %>% group_by(state) %>% summarise(Mean = mean(packpc)) %>% arrange(Mean)
      
          # Kentucky has the highest, Utah has the lowest.


      
# Find the median over all the states of the number of packs per capita for each year.
  
      Median.DF = Cigarette %>% group_by(year) %>% summarise(Median = median(packpc))
      
      
    # Plot this median value for the years from 1985 to 1995.
      
      unique(Cigarette$year)
      
      
      Median.PP = ggplot(Median.DF, aes(x = year, 
                                       y = Median))
      Median.PP + geom_point(
        fill = "lightsteelblue",
        color = "steelblue4")
  
    #   What can you say about cigarette usage in these years?
      
        # Cigarette usage has decreased each year; most notably from 1989 to 1990.
      

      
  
# Create a scatter plot of price per pack vs number of packs per capita for all states and years.
  
      PvN.SP = ggplot(Cigarette, aes(x = avgprs,
                                     y = packpc))
      PvN.SP + geom_point(fill = "lightsteelblue",
                          color = "steelblue4") +
        geom_smooth(method = lm) +
        ggtitle("Price Per Pack vs Packs Per Capita") +
        xlab("Price Per Pack") + 
        ylab("Packs Per Capita")
  
  
      
# Are the price and the per capita packs positively correlated, negatively correlated, or uncorrelated?
  
          # Negatively Correlated
      
      cor.test(Cigarette$avgprs, Cigarette$packpc, method = "pearson", use = "complete.obs")
      
    
    # Explain why your answer would be expected.
      
          # We can see in the scatter plot that the data trends downward. 
          # With a correlation value of 0.59 and a p-value of < 2.2e-16, this 
          #     negative correlation is somewhat small, but very significant.
 
   
      
#  Change your scatter plot to show the points for each year in a different color.
    
    PvN.SP = ggplot(Cigarette, aes(x = avgprs,
                                   y = packpc,
                                   color = year))
    PvN.SP + geom_point() +
      geom_smooth(method = lm) +
      ggtitle("Price Per Pack vs Packs Per Capita") +
      xlab("Price Per Pack") + 
      ylab("Packs Per Capita")
    
    # Does the relationship between the two variable change over time?
    
        # Yes. As the years pass, the price keeps rising and the packs per capita drops.
  
  
    
# Do a linear regression for these two variables. How much variability does the line explain? 
  
    Regression = lm(packpc~avgprs, Cigarette)
    summary(Regression)
    
    
    # How much variability does the line explain? 
    
        #  34% of the variability
    
    
    
# The plot above does not adjust for inflation.
# You can adjust the price of a pack of cigarettes for inflation by
#     dividing the avgprs variable by the cpi variable.
# Create an adjusted price for each row....
    
    Cigarette.Adj = Cigarette %>% mutate(Adjusted = avgprs / cpi)
    
    # ...then re-do your scatter plot...
    
    PvN.SP_Adj = ggplot(Cigarette.Adj, aes(x = Adjusted,
                                   y = packpc,
                                   color = year))
    PvN.SP_Adj + geom_point() +
      geom_smooth(method = lm) +
      ggtitle("Adjusted Price Per Pack vs Packs Per Capita") +
      xlab("Price Per Pack") + 
      ylab("Packs Per Capita")
    
    # ...and linear regression using this adjusted price.
    
    Regression.Adj = lm(packpc~Adjusted, Cigarette.Adj)
    summary(Regression.Adj)    
  
    
    
# Create a data frame with just the rows from 1985.

    Cigs_1985 = Cigarette %>% filter(year == 1985)
    
    # Create a second data frame with just the rows from 1995.
    
    Cigs_1995 = Cigarette %>% filter(year == 1995)    
    
    # Then, from each of these data frames, get a vector of the number of packs per capita.
    
    packpc_1985 = Cigs_1985$packpc
    
    packpc_1995 = Cigs_1995$packpc

    
    # Use a paired t-test to see if the number of packs per capita in 1995 was
    #     significantly different than the number of packs per capita in 1985.
  
    t.test(packpc_1985, packpc_1995, paired = TRUE)
    
      # The p-value < 2.2e-16 indicates that there was a significant difference
      #       in packs per capita between the two years.
  
  
  
  
  
  
  
  
  
  
  
  