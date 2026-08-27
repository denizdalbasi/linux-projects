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
