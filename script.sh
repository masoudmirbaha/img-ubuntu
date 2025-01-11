#!/bin/bash
read -p "please enter number1: " MY_NUM1
read -p "please enter number2: " MY_NUM2
#echo "$MY_NUM1"
#echo "$MY_NUM2"

if `[ "$MY_NUM1" -gt "$MY_NUM2" ]`
then
	echo "$MY_NUM1 greator than $MY_NUM2"
elif
	`[ "$MY_NUM1" -lt "$MY_NUM2" ]`
then 
	echo "$MY_NUM1 less than $MY_NUM2"

else
	echo "number is equle"
fi


