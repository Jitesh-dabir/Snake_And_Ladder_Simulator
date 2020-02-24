#!/bin/bash -x

echo ".........................................Welcome to Snake And Ladder........................................"

#CONSTANT
NUMBER_OF_PLAYER=1
STARTING_POSITION=0
FLAG=0
SAFE_POSITION=100

#VARIABLE
firstUserPosition=0
secondUserPosition=0
diceCountUser1=0
diceCountUser2=0
firstUserPreviousPosition=0
secondUserPreviousPosition=0
userChance=0

#FUNCTION TO GET DIE NUMBER BETWEEN 1 TO 6
function rollDie()
{
	randomDieNumber=$((RANDOM%6+1))
	echo $randomDieNumber
}

#FUNCTION FOR LADDER CONDITION
function ladder()
{
	position=$1
	randomNumber=$2
	ladderResult=$(($position+$randomNumber))
	echo $ladderResult
}

#FUNCTION FOR SNAKE CONDITION
function snake()
{
	position=$1
	randomNumber=$2
	snakeResult=$(($position-$randomNumber))
	echo $snakeResult
}

#CHECK NO PLAY,SNAKE,LADDER
while [[ $firstUserPosition -ne $SAFE_POSITION && $secondUserPosition -ne $SAFE_POSITION ]]
do

#GENERATE RANDOM NUMBER FOR CHECKING THEY ARE NO PLAY,LADDER,SNAKE
	randomNumber=$((RANDOM%3+1))
	firstUserRandomNumber=$(rollDie)
	secondUserRandomNumber=$(rollDie)
	if [ $userChance -eq $FLAG ]
	then 
		case $randomNumber in
			1)
				echo ".........................................."
				echo ""
				firstUserPosition=$firstUserPosition
				echo "No Play - position of first user =$firstUserPosition"
				echo ""
				echo ".........................................."
				;;
			2)
				echo ".........................................."
				echo ""
				firstUserPosition=$( ladder $firstUserPosition $firstUserRandomNumber)
				if [ $firstUserPosition -gt $SAFE_POSITION ]
				then
					firstUserposition=$(($firstUserPreviousPosition))
					firstUserPreviousPosition=$(($firstUserPosition))
				fi
				echo "Ladder - position of first user =$firstUserPosition"
				echo ""
				echo ".........................................."
				;;
			3)
				echo ".........................................."
				echo ""
				firstUserPosition=$( snake $firstUserPosition $firstUserRandomNumber)
				if [ $firstUserPosition -lt $STARTING_POSITION ]
				then
					firstUserPosition=$(($STARTING_POSITION))
				fi
				if [ $firstUserPosition -lt $SAFE_POSITION ]
				then
					firstUserPreviousPosition=$(($firstUserPosition))
				fi
				echo "Snake - position of first user =$firstUserPosition"
				echo ""
				echo ".........................................."
				;;
		esac
		diceCountUser1=$(($diceCountUser1+1))
		userChance=1
	else
		case $randomNumber in
			1)
				echo ".........................................."
				echo ""
				secondUserPosition=$(($secondUserPosition))
				echo "No Play - position of second user =$secondUserPosition"
				echo ""
				echo ".........................................."
				;;
			2)
				echo ".........................................."
				echo ""
				secondUserPosition=$( ladder $secondUserPosition $secondUserRandomNumber)
				if [ $secondUserPosition -gt $SAFE_POSITION ]
				then
					secondUserposition=$(($secondUserPreviousPosition))
					secondUserPreviousPosition=$(($secondUserPosition))
				fi
				echo "Ladder - position of second user =$secondUserPosition"
				echo ""
				echo ".........................................."
				;;
			3)
				echo ".........................................."
				echo ""
				secondUserPosition=$( snake $secondUserPosition $secondUserRandomNumber)
				if [ $secondUserPosition -lt $STARTING_POSITION ]
				then
					secondUserPosition=$(($STARTING_POSITION))
				fi
				if [ $secondUserPosition -lt $SAFE_POSITION ]
				then
					secondUserPreviousPosition=$(($secondUserPosition))
				fi
				echo "Snake - position of second user =$secondUserPosition"
				echo ""
				echo ".........................................."
				;;
		esac
		diceCountUser2=$(($diceCountUser2+1))
		userChance=0
	fi
done

if [ $firstUserPosition -eq $SAFE_POSITION ]
then
	echo "First user win position=$firstUserPosition and dice rolls $diceCountUser1 times to win the game"
else
	echo "Second user win position=$secondUserPosition and dice rolls $diceCountUser2 times to win the game"
fi
