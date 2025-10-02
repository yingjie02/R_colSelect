#' Display and Select Column Names from a Data Frame
#'
#' This function displays all column names of a given data frame with their indices,
#' then allows interactive selection of specific columns using R's indexing syntax.
#' The selected column names are returned in dput format for precise reproduction.
#'
#' @param data A data frame from which to select columns
#' @return Invisibly returns the selected column names as a character vector
#' @examples
#' \dontrun{
#' col_select(iris)
#' }
#' @export
col_select <- function(data) {
  # Validate input
  if (!is.data.frame(data)) {
    stop("Input must be a data frame")
  }
  
  if (ncol(data) == 0) {
    stop("Data frame has no columns")
  }
  
  # Display available columns with indices
  cat("Available columns in the data:\n")
  column_info <- data.frame(
    Index = seq_along(colnames(data)),
    ColumnName = colnames(data)
  )
  print(column_info)
  
  # Get column indices from user input
  cat("\nEnter column indices to select (e.g., 1:3, 5, 7:9):\n")
  user_input <- readline(prompt = "Indices: ")
  
  # Parse user input safely
  selected_indices <- tryCatch({
    parsed_input <- eval(parse(text = paste0("c(", user_input, ")")))
    
    # Validate parsed indices
    if (!is.numeric(parsed_input)) {
      stop("Input must contain numeric indices only")
    }
    
    parsed_input
  }, error = function(e) {
    stop("Invalid input format. Please use R indexing syntax (e.g., 1:3, 5, 7:9)")
  })
  
  # Check if indices are within valid range
  if (any(selected_indices < 1) | any(selected_indices > ncol(data))) {
    stop("Indices must be between 1 and ", ncol(data))
  }
  
  # Remove duplicate indices and sort
  selected_indices <- sort(unique(selected_indices))
  
  # Get selected column names
  selected_columns <- colnames(data)[selected_indices]
  
  # Display results
  cat("\nSelected columns:\n")
  print(data.frame(Index = selected_indices, ColumnName = selected_columns))
  
  cat("\nColumn names in dput format:\n")
  dput(selected_columns)
  
  # Return selected columns invisibly
  invisible(selected_columns)
}