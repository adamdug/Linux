#!/bin/bash
# Welcome to the Lucky Duck Casino Dealer Investigation Tool
# Here we start out with the request for the input date, and we will turn that into "vardate" or Variable for date.
echo -e  "\e[34m*******Welcome to the \e[0m\e[36m\e[5mLucky Duck Casino \e[25m\e[0m\e[34m Dodgy Dealer Tool...******* 
Start by entering a DATE to investigate: The date for the 10th of March should look like this:  \e[0m \e[32m0310\e[0m"
read vardate
# Now we need to know what time to look up on the given date, this information will be recorded as the "vartime". We use the example to the user of the full hour minutes and seconds, whilst this will still work with just the hour eg. 02, we make the shell future proof incase other data is added to later schedules, other than times. This is the variable time.
echo -e "\e[34mWhat time? Use the 12 hour clock Example 14:00 will be \e[0m \e[32m02:00:00\e[0m"
read vartime
# Some people are crap at time management and as such are simply unable to manage their lives with the 24 hour clock. I don't know, maybe they have never had to fly cross time zone into the previous day or something like that? Who knows?... So,.... here we allow them to input the am or pm values. This is recorded as "varam" or the Variable for AM.
echo -e "\e[34mAM or PM?\e[0m"
read varam
# Multiple choice question to address which gaming table the employee is scheduled to work on... Here we will offer the options in the terminal and list them, enabling a user to easily pick which game they want to investigate. After all we can't have another situation like that Dodgy geezer Billy Jones again!

PS3='Which gaming table are you looking for:'
games=("Roulette" "Black Jack" "Texas Holdem" "Quit")
select vargame in "${games[@]}"; do
case $vargame in

"Roulette")
# Roulette option using colour to depict the user inputs used, and emphasis on the gaming option chosen...
echo -e "\e[34mThe\e[0m \e[32m\e[5m$vargame\e[25m\e[0m\e[34mdealer staff member working on\e[0m\e[32m$vardate\e[0m\e[34m at\e[0m\e[32m $vartime $varam\e[0m\e[34mwas:\e[0m"
# using grep to manage the inputs from the user to reveal the data and using awk to print to screen the relevant first and last name of the employee from the schedule in columns 5 and 6.
grep $vartime $vardate* | grep -i $varam | awk '{print $5,$6}'
;;
       
"Black Jack")
# Black Jack option using colour to depict the user inputs used,... Basically a copy paste of Roulette, with the output lines changed to column 3 and 4
echo -e "\e[34mThe\e[0m \e[32m\e[5m$vargame\e[25m\e[0m\e[34mdealer staff member working on\e[0m\e[32m$vardate\e[0m\e[34m at\e[0m\e[32m $vartime $varam\e[0m\e[34mwas:\e[0m"
# using grep to manage the inputs from the user to reveal the data and using awk to print to screen the relevant first and last name of the employee from the schedule in columns 3 and 4.
grep $vartime $vardate* | grep -i $varam | awk '{print $3,$4}'
;;
       
"Texas Holdem")
# Texas Holdem option using colour to depict the user inputs used,...Basically a copy paste of Roulette with output lines changed to columns 7 and 8
echo -e "\e[34mThe\e[0m \e[32m\e[5m$vargame\e[25m\e[0m\e[34mdealer staff member working on\e[0m\e[32m$vardate\e[0m\e[34m at\e[0m\e[32m $vartime $varam\e[0m\e[34mwas:\e[0m"
# using grep to manage the inputs from the user to reveal the data and using awk to print to screen the relevant first and last name of the employee from the schedule in columns 7 and 8.
grep $vartime $vardate* | grep -i $varam | awk '{print $7,$8}'
;;
#Now we could add an option here for help by adding it to line 15 in the games, and outputting some echo text with a few instructions, but that is probably a bit useless, and not likely to assist anyone, so I will move on to complete the options,...

#Tidy up and leave an option to go back in to the terminal like Tom Hanks!  
"Quit")
echo -e "\e[93mThank you for using the lucky Duck Casino Investigation Tool\e[0m"
exit
;;
# An option for user errors outside of the 4 options, this is our kind of help option I suppose.
*) echo -e "\e[31minvalid option try a number 1,2,3 or 4\e[0m"
;;
#close off the case with case written backwards esac. Reminds me of the use of the name CAISSE in  ESSIAC for the cancer treatment,... is it the cure?
esac
done




