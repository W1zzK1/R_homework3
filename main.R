setwd("C:/Users/user/PycharmProjects/untitled")

df = read.csv("df.csv")
# head(df)

library(dplyr)
df_filter = filter(df, Income > 30000)
# print(df_filter)

df_few_columns = select(df, Id, Year_Birth, Education, Marital_Status, Income, Response)
# print(df_few_columns)

df_new_columns = mutate(df, Age = 2023 - Year_Birth, Rich_flag = Income > 80000)
# print(df_new_columns)

summary_data <- df %>%
  group_by(Education) %>%
  summarize(Average_Income = mean(Income))
# print(summary_data)

df_new <- df %>%
  left_join(summary_data, by = "Education")
print(df_new)