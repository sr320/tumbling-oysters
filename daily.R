library(lubridate)
library(stringr)
library(usethis)

create_post <- function(date) {
  # Format date and create file name
  date_formatted <- format(date, "%Y-%m-%d")
  file_name <- str_glue("{date_formatted}-weekday-post.qmd")
  
  # Define post content
  post_content <- str_glue("---\ntitle: Weekday Post {date_formatted}\ndate: {date_formatted}\n---\n\n# {date_formatted}\n\nContent goes here.")
  
  # Write post to file
  write_lines(post_content, file_name)
  message("Post created: ", file_name)
}

# Define start and end dates
start_date <- Sys.Date() + 1
end_date <- start_date + 30

# Loop through weekdays and create posts
for (date in seq(start_date, end_date, by = "1 day")) {
  if (wday(date, label = TRUE) %in% c("Mon", "Tue", "Wed", "Thu", "Fri")) {
    create_post(date)
  }
}

message("All posts created!")
