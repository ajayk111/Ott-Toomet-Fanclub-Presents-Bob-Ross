raw_data <-
  read.csv("cleaned_data.csv") # Original DataFrame from csv file

getEpisode <- function (features) {
  #Display whole list if features is empty
  if (length(features) < 1) {
    raw_data$TITLE <- str_to_title(raw_data$TITLE)
    return(raw_data[c(2, 3)])
  }
  else {
  filteredList = vector()
  
  for (val in features) {
    #Get data frames where all elements have 1 in the right column
    temp <- list(raw_data[raw_data[val] == 1,])
    #add that to our list
    filteredList <- c(filteredList , temp)
  }
  # merge the list of data frames into one (Set AND)
  result <-
    filteredList %>% Reduce(function(d1, d2)
      merge(d1, d2), .)
  # Get Relevant Columns
  result <- result[c(2, 3)]
  # Make Pretty
  result$TITLE <- str_to_title(result$TITLE)
  return (result)
  }
}