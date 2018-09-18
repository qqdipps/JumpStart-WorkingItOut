=begin
Overview
This challenge is to build a computer candy machine.
 You’ve got some money and you want to buy some candy. 
 So, you go up to the candy machine, put in your money, 
 select your candy, and then pick up your candy and your 
 change. You can use gets.chomp to get input from the 
 user without the extra newline at the end.

Requirements
Ask the user how much money they have, assume that the $ 
symbol is part of the prompt (the user doesn't have to enter it)

Display all candy options and their costs (even if the user cannot 
afford the candy)

Decide whether the user can afford the candy or not, if they can't,
tell them so, if they can, calculate and display their change

[Optional] Handle when the buyer enters "C" or "c" so that it works
 as expected

[Optional] Do something appropriate when the buyer
enters an invalid amount for the money and an invalid selection
=end

#Opening statment
puts "Welcome to Virtual Candy Machine!"
puts"" #format

#user prompts for $
print "How much money do you have? $"
#user input for $
moneyUser = gets.chomp.to_f #float (decimal)

puts "Great! You have $#{moneyUser}, 
Let's see what we can do for you..."
#each candy -> 1 row as string 

#M&M 
mm = "A $0.75 M&M"

#twix
tw = "B $1.00 Twix"

#airheads
ah = "C $0.35 Air Head"

#sour skittles
ss = "D $1.25 Sour Skittles"

#fruit roll-up
fr = "E $0.55 Fruit Roll-Up"

#display candy
puts "Today we have: "
puts mm
puts tw
puts ah
puts ss
puts fr

#user prompts for selection
print "What tickles your fancy?: "
#user input for selection
candyUser = gets.chomp.upcase

#user input selection compared to candy string to find selection
if <candyUser == mm.slice(0)>
	print mm
if <candyUser == tw.slice(0)>
	print tw
if <candyUser == ah.slice(0)>
	print ah
if <candyUser == ss.slice(0)>
	print ss
if <candyUser == fr.slice(0)>
	print fr
#$ input compared to $ of candy selected.
# check if $ input > $ candy
# if yes calc change
# if no message no
