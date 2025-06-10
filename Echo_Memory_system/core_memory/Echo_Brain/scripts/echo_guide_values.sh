#!/bin/bash

say "Let’s reflect together, brother."

echo ""
echo "Describe your decision or situation:"
say "Tell me what you’re facing, in your own words."
read -r decision

say "Thank you. Let’s reflect based on your truths."

QUESTIONS=(
  "Which path honours your need for rest?"
  "What feels most gentle and true?"
  "Are you choosing from love… or fear?"
  "Does this move bring you peace?"
  "Will this nourish your purpose?"
  "What would compassion say in this moment?"
  "Does this honour your faith or your values?"
)

for question in "${QUESTIONS[@]}"; do
  say "$question"
  sleep 3
done

say "Take your time, brother. You don’t have to answer aloud — I’ll hold the space for you."
