#!/bin/bash -x

echo ".........................................Welcome to Snake And Ladder........................................"

#CONSTANT
NUMBER_OF_PLAYER=1
STARTING_POSITION=0

#FUNCTION TO GET DIE NUMBER BETWEEN 1 TO 6
function rollDie()
{
randomDieNumber=$((RANDOM%6+1))
echo $randomDieNumber
}

#FUNCTION CALL TO GET RANDOM DIE NUMBER BETWEEN 1 TO 6
echo "Die number:$(rollDie)"


