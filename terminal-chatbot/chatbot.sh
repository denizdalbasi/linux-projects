#!/bin/bash

GREEN="\033[32m"
CYAN="\033[36m"
YELLOW="\033[33m"
RED="\033[31m"
RESET="\033[0m"

print_matrix_art() {
    echo -e "${GREEN}"
    echo "  __  __       _        _              "
    echo " |  \/  |     | |      (_)             "
    echo " | \  / | __ _| |_ _ __ ___  __        "
    echo " | |\/| |/ _\` | __| '__| \ \/ /        "
    echo " | |  | | (_| | |_| |  | |>  <         "
    echo " |_|  |_|\__,_|\__|_|  |_/_/\_\        "
    echo -e "${RESET}"
}

print_robot_art() {
    echo -e "${CYAN}"
    echo "    [o_o]    "
    echo "   /|   |\   "
    echo "    /   \    "
    echo -e "${RESET}"
}
declare -a JOKES=(
    "Why do programmers prefer dark mode? Because light attracts bugs!"
    "There are 10 types of people in the world: those who understand binary, and those who don't."
    "A SQL query walks into a bar, walks up to two tables and asks: 'Can I join you?'"
    "To understand recursion, you must first understand recursion."
)

declare -a CHITCHAT=(
    "The Matrix has you... or at least, this terminal session does."
    "I'm just a bundle of scripts, but I appreciate a good chat."
    "Type 'help' if you get lost in the system core."
    "All I do is read inputs and print outputs, and honestly? It's a living."
)

BOT_NAME="MatrixBot-v1"
USER_NAME=""
MOOD="curious"
MESSAGE_COUNT=0

clear
print_matrix_art
echo -e "${YELLOW}System Initialized.${RESET}"
echo -e "Hello! I am ${CYAN}${BOT_NAME}${RESET}. Your local terminal companion."
echo -n "What should I call you? "
read -r USER_NAME

if [ -z "$USER_NAME" ]; then
    USER_NAME="User"
fi

echo -e "Nice to meet you, ${GREEN}${USER_NAME}${RESET}. Type ${YELLOW}'help'${RESET} to see what I can do, or ${YELLOW}'exit'${RESET} to quit.\n"
