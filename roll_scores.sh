#!/bin/bash

# Function to roll a six-sided die and keep the highest 3 rolls
roll_die_and_keep_highest() {
    local rolls=()
    for (( i = 0; i < 4; i++ )); do
        rolls+=( $((RANDOM % 6 + 1)) )
    done
    local sorted_rolls=( $(printf '%s\n' "${rolls[@]}" | sort -rn | head -n 3) )
    local sum=0
    for roll in "${sorted_rolls[@]}"; do
        ((sum += roll))
    done
    echo "$sum"
}

# Roll abilities
strength=$(roll_die_and_keep_highest)
constitution=$(roll_die_and_keep_highest)
dexterity=$(roll_die_and_keep_highest)
intelligence=$(roll_die_and_keep_highest)
wisdom=$(roll_die_and_keep_highest)
charisma=$(roll_die_and_keep_highest)

# Display the randomized character information

echo "WELCOME "
echo "---------------------------------"
echo "--------FRANKENSTIEN-------------"
echo "---------------------------------"

echo "STR: $strength"
echo "CON: $constitution"
echo "DEX: $dexterity"
echo "INT: $intelligence"
echo "WIS: $wisdom"
echo "CHA: $charisma"

echo "------------------------rise-----"
echo "---------------------------------"
