# Install necessary package
install.packages("arules")

# Load the dataset
library(arules)
df <- read.csv("GroceriesData.csv")

# Preprocess data
df_cleaned <- df[complete.cases(df$itemDescription), ]
transactions <- as(split(df_cleaned$itemDescription, df_cleaned$Member_number), "transactions")

# Apply Eclat algorithm
itemsets <- eclat(transactions, parameter = list(supp = 0.05))  # Adjust support threshold as needed

# Inspect results
inspect(itemsets)
