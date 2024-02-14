## Simple Menu-Based Calculator in Shell Script (Markdown Explanation)

This document explains the code for a simple calculator program written in a shell script. The script provides basic operations like addition, subtraction, multiplication, and division.

**Please note:** This script requires the `bc` command-line calculator to be installed on your system.

### Functions:

- **calculate()**: This function performs the actual calculation based on the provided numbers and operator. It takes three arguments:
    - `num1`: The first number.
    - `op`: The operator (e.g., "+", "-", "*", "/").
    - `num2`: The second number.

    The function uses a `case` statement to handle different operators and calls the `bc` command with appropriate formatting to perform the calculation. Finally, it stores the result in the `result` variable and prints it.

```bash
calculate() {
  local num1="$1"
  local op="$2"
  local num2="$3"

  case "$op" in
    "+") result=$(echo "scale=2; $num1 + $num2" | bc) ;;
    "-") result=$(echo "scale=2; $num1 - $num2" | bc) ;;
    "*") result=$(echo "scale=2; $num1 * $num2" | bc) ;;
    "/") result=$(echo "scale=2; $num1 / $num2" | bc) ;;
    *) echo "Invalid operator!" ;;
  esac

  echo "Result: $result"
}
```

### Main Loop:

- The script uses a `while` loop to keep the calculator running until the user chooses to quit.
- Inside the loop, the menu is displayed, and the user is prompted to enter their choice.
- A `case` statement handles different user choices:
    - **1-4:** These options call the `calculate` function with appropriate arguments based on the selected operation.
    - **5:** This option exits the loop, effectively ending the program.
    - Any other input is considered invalid, and an error message is displayed.

- After each calculation, the user is asked if they want to continue. If not, the loop breaks, and the program exits.

```bash
# Main loop
while true; do
  # Display menu
  clear
  echo "Menu:"
  echo "1. Addition"
  echo "2. Subtraction"
  echo "3. Multiplication"
  echo "4. Division"
  echo "5. Quit"

  # Read user choice
  read -p "Enter your choice: " choice

  # Handle user input
  case "$choice" in
    # ... (handled in previous explanation)
  esac

  # Ask if user wants to continue
  read -p "Continue (y/n)? " answer
  if [[ "$answer" != "y" ]]; then
    break
  fi
done
```

### Key Points:

- The script uses basic shell commands like `echo`, `read`, and `case` statements.
- The `bc` command is used for calculations.
- Error handling is included for division by zero and invalid user input.
- The script can be easily extended to include more features and operations.
