#!/bin/bash

clear
echo "=========================================="
echo "        Number Guessing Game              "
echo "=========================================="
echo "I am thinking of a number between 1 and 100."
echo

# Generate random target between 1 and 100
TARGET=$(( ($RANDOM % 100) + 1 ))
GUESS=0
ATTEMPTS=0

# Loop until the guess matches the target
while [ "$GUESS" -ne "$TARGET" ]; do
    read -p "Enter your guess: " GUESS

    # Validate that user entered a non-empty integer
    if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
        echo "Invalid input! Please enter a number."
        echo
        continue
    fi

    ((ATTEMPTS++))

    if [ "$GUESS" -lt "$TARGET" ]; then
        echo "Too low! Try higher."
        echo
    elif [ "$GUESS" -gt "$TARGET" ]; then
        echo "Too high! Try lower."
        echo
    else
        echo "------------------------------------------"
        echo "Correct! You guessed $TARGET in $ATTEMPTS attempts."
        echo "------------------------------------------"
    fi
done

