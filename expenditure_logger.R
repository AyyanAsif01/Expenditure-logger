
# Load necessary packages
if (!require("lubridate")) {
  install.packages("lubridate")
}
library(lubridate)

# Initialize an empty dataframe to store expenses
expenses <- data.frame(Date = as.Date(character()),
                       Amount = numeric(),
                       Category = character(),
                       stringsAsFactors = FALSE)

# Function to input expenses
input_expense <- function() {
  date <- as.Date(readline(prompt = "Enter the date (yyyy-mm-dd): "))
  amount <- as.numeric(readline(prompt = "Enter the amount: "))
  category <- readline(prompt = "Enter the category: ")
  new_entry <- data.frame(Date = date, Amount = amount, Category = category)
  return(new_entry)
}

# Function for Total Expenditure
total_expenditure <- function(expenses) {
  sum(expenses$Amount)
}

# Function for Average Monthly Expenses
average_monthly_expenses <- function(expenses) {
  monthly_expenses <- aggregate(Amount ~ month(Date), data = expenses, sum)
  mean(monthly_expenses$Amount)
}

# Main Program Loop
repeat {
  cat("\n1. Input Expense\n2. Show Total Expenditure\n3. Show Average Monthly Expenses\n4. Exit\n")
  choice <- as.integer(readline(prompt = "Enter choice: "))
  
  if (choice == 1) {
    expenses <- rbind(expenses, input_expense())
  } else if (choice == 2) {
    cat("\nTotal Expenditure: ", total_expenditure(expenses), "\n")
  } else if (choice == 3) {
    cat("\nAverage Monthly Expenses: ", average_monthly_expenses(expenses), "\n")
  } else if (choice == 4) {
    break
  } else {
    cat("\nInvalid choice. Please try again.\n")
  }
}

# Optionally save expenses to CSV
write.csv(expenses, "expenses.csv", row.names = FALSE)





