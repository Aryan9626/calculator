#!/bin/bash

# Function to perform calculation
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
    1)
      read -p "Enter first number: " num1
      read -p "Enter second number: " num2
      calculate "$num1" "+" "$num2"
      ;;
    2)
      read -p "Enter first number: " num1
      read -p "Enter second number: " num2
      calculate "$num1" "-" "$num2"
      ;;
    3)
      read -p "Enter first number: " num1
      read -p "Enter second number: " num2
      calculate "$num1" "*" "$num2"
      ;;
    4)
      read -p "Enter first number: " num1
      read -p "Enter second number: " num2
      # Check for division by zero
      if [[ "$num2" -eq 0 ]]; then
        echo "Error: Cannot divide by zero!"
      else
        calculate "$num1" "/" "$num2"
      fi
      ;;
    5)
      echo "Goodbye!"
      exit 0
      ;;
    *)
      echo "Invalid choice!"
      ;;
  esac

  # Ask if user wants to continue
  read -p "Continue (y/n)? " answer
  if [[ "$answer" != "y" ]]; then
    break
  fi
done
