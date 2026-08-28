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
while true; do
    echo -ne "${CYAN}${USER_NAME}> ${RESET}"
    read -r input

    input_lower="${input,,}"
    ((MESSAGE_COUNT++))

    if [[ "$input_lower" == "exit" || "$input_lower" == "quit" ]]; then
        print_robot_art
        echo -e "${YELLOW}${BOT_NAME}: Disconnecting from the grid. Goodbye, ${USER_NAME}!${RESET}"
        break
    fi

    case "$input_lower" in
        "help"|"?")
            echo -e "${YELLOW}${BOT_NAME}: Here are commands you can try:"
            echo -e "  - ${GREEN}hello / hi${RESET} : Greet the bot"
            echo -e "  - ${GREEN}status${RESET}     : Check system and session stats"
            echo -e "  - ${GREEN}joke${RESET}       : Hear a programming joke"
            echo -e "  - ${GREEN}matrix${RESET}     : See the Matrix art"
            echo -e "  - ${GREEN}mood${RESET}       : Check how the bot is feeling"
            echo -e "  - ${GREEN}exit / quit${RESET}: Leave the chat${RESET}"
            ;;
        
        "hello"|"hi"|"hey")
            echo -e "${GREEN}${BOT_NAME}: Greetings, ${USER_NAME}! How is your shell session going today?${RESET}"
            ;;

        "status"|"stats")
            echo -e "${GREEN}${BOT_NAME}:"
            echo -e "  - User: ${USER_NAME}"
            echo -e "  - Bot Name: ${BOT_NAME}"
            echo -e "  - Current Mood: ${MOOD}"
            echo -e "  - Messages Exchanged: ${MESSAGE_COUNT}"
            echo -e "  - Uptime/OS: $(uname -sr) ${RESET}"
            ;;

        "joke")
            rand_index=$(( RANDOM % ${#JOKES[@]} ))
            echo -e "${YELLOW}${BOT_NAME}: ${JOKES[$rand_index]}${RESET}"
            ;;

        "matrix")
            print_matrix_art
            echo -e "${GREEN}${BOT_NAME}: Follow the white rabbit, ${USER_NAME}.${RESET}"
            ;;

        "mood")
            echo -e "${CYAN}${BOT_NAME}: My current mood is ${MOOD}. Everything is compiling smoothly.${RESET}"
            ;;

        * )
            rand_index=$(( RANDOM % ${#CHITCHAT[@]} ))
            echo -e "${GREEN}${BOT_NAME}: ${CHITCHAT[$rand_index]}${RESET}"
            ;;
    esac
    
    echo ""
done
