# R_colSelect
col_select displays all column names of a given data frame with their indices, and allows interactive selection of specific columns using R's indexing syntax. The selected column names are returned in dput format for precise reproduction.



# Make categorical variables factors

selected <- colSelect::col_select(yourdf)
yourdf <- yourdf |> mutate(across(selected, as.factor))
or:
yourdf[selected] <- lapply(yourdf[selected], factor)
