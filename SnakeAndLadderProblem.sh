#!/bin/bash -x

echo ".........................................Welcome to Snake And Ladder........................................"

#CONSTANT
NUMBER_OF_PLAYER=1
STARTING_POSITION=0
FLAG=0
SAFE_POSITION=100

#VARIABLE
Position=0

#FUNCTION TO GET DIE NUMBER BETWEEN 1 TO 6
function rollDie()
{
	randomDieNumber=$((RANDOM%6+1))
	echo $randomDieNumber
}

#FUNCTION CALL TO GET RANDOM DIE NUMBER BETWEEN 1 TO 6
rollDie

#GENERATE RANDOM NUMBER FOR CHECKING THEY ARE NO PLAY,LADDER,SNAKE
randomCheckNumber=$((RANDOM%3+1))

#CHECK NO PLAY,SNAKE,LADDER
while [[ $position -ne $SAFE_POSITION ]]
do
	randomNumber=$((RANDOM%3+1))
	case $randomNumber in

		1)
			echo ".........................................."
	   	echo ""
			position=$position
			echo "No Play - position of user1 =$position"
			echo ""
		   echo ".........................................."
			;;

		2)
			firstRandomNumber=$((RANDOM%6+1))
			echo ".........................................."
			echo ""
			position=$(($position+$firstRandomNumber))
			echo "Ladder - position of user =$position"
			echo ""
			echo ".........................................."
			;;

		3)
			secondRandomNumber=$((RANDOM%6+1))
			echo ".........................................."
			echo ""
			position=$(($position-$secondRandomNumber))
			if [ $position -lt $STARTING_POSITION ]
			then
				position=$STARTING_POSITION
			fi
			echo "Snake - position of user =$position"
			echo ""
			echo ".........................................."
			;;
	esac
done
echo "user win position=$position"
