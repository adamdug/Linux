#!/bin/bash
# Welcome to the Lucky Duck Casino Dealer Investigation Tool
# Here we start out with the request for the input date, and we will turn that into "vardate".
echo ...........................................................................................................................................................................................................................*****...Welcome to the Lucky Duck Casino Dealer Investigation Tool...*****....................................................................................................................................................................................................................... : Start by giving us a DATE to investigate: The date for the 10th of March should look like this: 0310 
read vardate
# Now we need to know what time to look up on the given date, this information will be recorded as the "vartime".
echo What time? Use the 12 hour clock Example 14:00 will be 02:00:00
read vartime
# Some people are crap at time management and as such are simply unable to manage their lives with the 24 hour clock. So,.... here we allow them to input the am or pm values. This is recorded as "varam"
echo AM or PM?
read varam
# Here is the big conclusion!
echo The Roulette game staff member working on $vardate at $vartime was:
# using grep to manage the inputs from the user to reveal the data and using awk to print to screen the relevant first and last name of the employee from the schedule.
grep $vartime $vardate* | grep -i $varam | awk '{print $5,$6}' 
# Just being nice, here is a little farewell message.....
echo Thank you for using the lucky Duck Casino Investigation Tool!
