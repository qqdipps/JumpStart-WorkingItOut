#  =begin
# Overview
# This challenge is to build a computer candy machine.
#  You’ve got some money and you want to buy some candy.
#  So, you go up to the candy machine, put in your money,
#  select your candy, and then pick up your candy and your
#  change. You can use gets.chomp to get input from the
#  user without the extra newline at the end.
#
# Requirements
# Ask the user how much money they have, assume that the $
# symbol is part of the prompt (the user doesn't have to enter it)
#
# Display all candy options and their costs (even if the user cannot
# afford the candy)
#
# Decide whether the user can afford the candy or not, if they can't,
# tell them so, if they can, calculate and display their change
#
# [Optional] Handle when the buyer enters "C" or "c" so that it works
#  as expected
#
# [Optional] Do something appropriate when the buyer
# enters an invalid amount for the money and an invalid selection
# =end

puts "" #formatting

#candy in the candy machine, initializing constant string vars
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

#Opening statment
puts "Welcome to Virtual Candy Machine!"

puts"" #format

#user prompts for $
print "How much money do you have? $ "

#user input for $
moneyUser = gets.chomp

puts"" #format

# checks user input format
# Checks by converting moneyUser to num types (i or f (also get checked for corrected decimal can't be greater then hundredths place)) then back to string and compares to orginal input.
# Non-digits get dropped or equal 0. So if non-digits are contained input it will be evlaute as false;
# 'while !(false)' thus 'while true' excutes while block, second || statement can be ignored.
# If no non-digits 'while !(true)' thus 'while false', now second || statement will be evaluated.
# If money is less than 0  statement evaluates as true, 'while false || true' thus 'while true' : while block will be
# executed. If money is not less than 0; 'while false || false' : while block will be skipped.
# If while block is executed then loops until correct number format not less than 0 is entered by user.
until  "%0.2f" % [moneyUser.to_f] == moneyUser || moneyUser.to_i.to_s == moneyUser && moneyUser.to_f > 0 #money should be positive and numeric

	#user statement for invalid input
	puts "Please insert some money using numeric dollar formatting."

	#user prompts for $
	print "How much money do you have? $ "

	#user input for $
	moneyUser = gets.chomp #float (decimal)
	puts"" #format
end

moneyUser = moneyUser.to_f #Converts var to type float for comparison of candy cost.

#user experiance statement, re-cap
puts "Great! You have $ %0.2f" % [moneyUser] << ",
Let's see what we can do for you..."

puts"" #format

#display candy
puts "Today we have: "
puts mm
puts tw
puts ah
puts ss
puts fr

puts"" #format

#user prompts for selection
print "What tickles your fancy?: "

#user input for selection
candyUser = gets.chomp.upcase # allow for input to be either upper or lower case

#checks user input format and valid selection
# If input is equal to A,B,C,D or E. statement evaluates as 'while !(true)',
# which evaluates as 'while false' whch skips 'while' block.
# If input is not equal to A,B,C,D or E. statement evaluates as 'while !(false)',
# which evaluates as 'while true' whch executes 'while' block.
# 'while' loops until input is equal to A,B,C,D or E.
while ! (candyUser == "A" || candyUser == "B" || candyUser == "C" || candyUser == "D" || candyUser == "E")
	puts ""

	# notifies user of invlaid selection
	puts "Invalid selection processed... "

	#user prompts for selection
	print "Try again. What is your selection (A, B, C, D, or E)?: "


	#user input for selection
	candyUser = gets.chomp.upcase
end

puts"" #format


#candy counter is an array that contains all the candy variables
candy_drawer = [mm,tw,ah,ss,fr]

#for each item in candy_drawer iterate through were item = candy
candy_drawer.each do |candy|

	#user input selection compared to candy string to find selection
	if candyUser == candy.slice(0)

		#check if user has enough money for candy selected
		if moneyUser >= candy.slice(3,4).to_f
			#yes calculate change and return statement
			change = moneyUser - candy.slice(3,4).to_f
			puts "beeboobeeep... enjoy your " << candy.slice(8..-1) << "!"
			puts"tingchchch... don't forget your change: $ %0.2f" % [change]

		elsif moneyUser > 0
			#no calculates amount needed and return statement
			short = candy.slice(3,4).to_f - moneyUser #calculates how much more is required
			puts "Sorry! you don't have enough for " << candy.slice(8..-1) << "."
			puts "You're short $ %0.2f" % [short] << ", but you may have enough for..."

			#checks if user has enough money for anything else.
			if moneyUser >= mm.slice(3,4).to_f
				puts mm
			end
			if moneyUser >= tw.slice(3,4).to_f
				puts tw
			end
			if moneyUser >= ah.slice(3,4).to_f
				puts ah
			end
			if moneyUser >= ss.slice(3,4).to_f
				puts ss
			end
			if moneyUser >= fr.slice(3,4).to_f
				puts fr
			else
				puts "nothing, you have enough for nothing. Sorry."
			end
		else
			puts " Hey you didn't put any money in!"
		end
	end
end
puts ""
=begin

Test case
------------
1. a) enough money, b) correct input types
2. a) enough money, b) incorrect input types moneyUser: alpha, alpha-numeric, extra decimal, candyUser: not ABCD or E)
3. a) not enough money, but enough to buy something else , b) candyUser: lower case
4. a) not enough money for anything, b) moneyUser:  neg value, 7$0

----------TEST CASE 1---------
{18-09-19 0:18}Savannahs-MBP:~/AdaJumpStart/Lesson.10.Expressions@master✗✗✗✗✗✗ qqdipps% ruby CandyMachine.rb

Welcome to Virtual Candy Machine!

How much money do you have? $ 5

Great! You have $ 5.00,
Let's see what we can do for you...

Today we have:
A $0.75 M&M
B $1.00 Twix
C $0.35 Air Head
D $1.25 Sour Skittles
E $0.55 Fruit Roll-Up

What tickles your fancy?: B

beeboobeeep... enjoy your Twix!
tingchchch... don't forget your change: $ 4.00

-------------TEST CASE 2--------------
{{18-09-19 0:37}Savannahs-MBP:~/AdaJumpStart/Lesson.10.Expressions@master✗✗✗✗✗✗ qqdipps% ruby CandyMachine.rb

Welcome to Virtual Candy Machine!

How much money do you have? $ SEVEN Dollars

Please insert some money using numeric dollar formatting.
How much money do you have? $ 7 dollars

Please insert some money using numeric dollar formatting.
How much money do you have? $ 7.008

Please insert some money using numeric dollar formatting.
How much money do you have? $ 7

Great! You have $ 7.00,
Let's see what we can do for you...

Today we have:
A $0.75 M&M
B $1.00 Twix
C $0.35 Air Head
D $1.25 Sour Skittles
E $0.55 Fruit Roll-Up

What tickles your fancy?: F

Invalid selection processed...
Try again. What is your selection (A, B, C, D, or E)?: M&M

Invalid selection processed...
Try again. What is your selection (A, B, C, D, or E)?: A

beeboobeeep... enjoy your M&M!
tingchchch... don't forget your change: $ 6.25

-------------TEST CASE 3--------------
{18-09-19 0:40}Savannahs-MBP:~/AdaJumpStart/Lesson.10.Expressions@master✗✗✗✗✗✗ qqdipps% ruby CandyMachine.rb

Welcome to Virtual Candy Machine!

How much money do you have? $ 1.02

Great! You have $ 1.02,
Let's see what we can do for you...

Today we have:
A $0.75 M&M
B $1.00 Twix
C $0.35 Air Head
D $1.25 Sour Skittles
E $0.55 Fruit Roll-Up

What tickles your fancy?: d

Sorry! you don't have enough for Sour Skittles.
You're short $ 0.23, but you may have enough for...
A $0.75 M&M
B $1.00 Twix
C $0.35 Air Head
E $0.55 Fruit Roll-Up

--------------TEST CASE 4-----------------
{18-09-19 0:41}Savannahs-MBP:~/AdaJumpStart/Lesson.10.Expressions@master✗✗✗✗✗✗ qqdipps% ruby CandyMachine.rb

Welcome to Virtual Candy Machine!

How much money do you have? $ -90

Please insert some money using numeric dollar formatting.
How much money do you have? $ -9.08

Please insert some money using numeric dollar formatting.
How much money do you have? $ .25

Please insert some money using numeric dollar formatting.
How much money do you have? $ 0.24

Great! You have $ 0.24,
Let's see what we can do for you...

Today we have:
A $0.75 M&M
B $1.00 Twix
C $0.35 Air Head
D $1.25 Sour Skittles
E $0.55 Fruit Roll-Up

What tickles your fancy?: C

Sorry! you don't have enough for Air Head.
You're short $ 0.11, but you may have enough for...
nothing, you have enough for nothing. Sorry.
=end
