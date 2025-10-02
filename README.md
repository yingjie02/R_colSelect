# R_colSelect
colSelect::col_select displays all column names of a given data frame with their indices, and allows interactive selection of specific columns using R's indexing syntax. The selected column names are returned in dput format for precise reproduction.



# Why use it?


It can help you avoid copying and pasting colname in the vast majority of cases.


It allows you to choose while watching Colname


# How to use it？ Example：Make categorical variables factors

## install package
devtools::install_github("yingjie02/R_colSelect/colSelect")

## select cols
selected <- colSelect::col_select(yourdf)

## selected cols —>>> factor
yourdf <- yourdf |> mutate(across(selected, as.factor))

or

yourdf[selected] <- lapply(yourdf[selected], factor)
