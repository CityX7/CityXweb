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

# Function to generate a random character name
generate_random_name() {
    local first_names=("C" "D" "M" "M" "A" "L" "B" "Z" "G" "Wen")
    local last_names=("Smartyass" "Johnson" "Sackhoggy" "Jones" "de la Creme" "Dubois" "Corny" "Zpip" "Haaland" "Hoosiers")
    local first_name=${first_names[RANDOM % ${#first_names[@]}]}
    local last_name=${last_names[RANDOM % ${#last_names[@]}]}
    echo "$first_name $last_name"
}

# Loop to generate characters and echo output
for ((i = 1; i <= 5; i++)); do
    # Roll abilities
    strength=$(roll_die_and_keep_highest)
    constitution=$(roll_die_and_keep_highest)
    dexterity=$(roll_die_and_keep_highest)
    intelligence=$(roll_die_and_keep_highest)
    wisdom=$(roll_die_and_keep_highest)
    charisma=$(roll_die_and_keep_highest)

    # Generate a random character name
    character_name=$(generate_random_name)

    # Display the randomized character information
    echo "Character $i: $character_name"
    echo "---------------------------------"
    echo "Strength: $strength"
    echo "Constitution: $constitution"
    echo "Dexterity: $dexterity"
    echo "Intelligence: $intelligence"
    echo "Wisdom: $wisdom"
    echo "Charisma: $charisma"
    echo "---------------------------------"
done
