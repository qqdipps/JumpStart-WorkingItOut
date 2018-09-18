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
print "How much money do you have? $ "
#user input for $
moneyUser = gets.chomp.to_f #float (decimal)
puts"" #format

puts "Great! You have $ %0.2f" % [moneyUser] << ", 
Let's see what we can do for you..."
#each candy -> 1 row as string 

puts"" #format

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

puts"" #format

#user prompts for selection
print "What tickles your fancy?: "
#user input for selection
candyUser = gets.chomp.upcase

puts"" #format

#user input selection compared to candy string to find selection
if candyUser == mm.slice(0)
	#set generic variable for easy code re-use
	candy = mm
	#check if user has enough money for candy selected
	if moneyUser >= candy.slice(3,4).to_f
		change = moneyUser - candy.slice(3,4).to_f
		#yes calculate change and return statement
		puts "beeboobeeep... enjoy your " << candy.slice(8..-1) << "!"
		puts"tingchchch... don't forget your change: $ %0.2f" % [change]
	elsif moneyUser > 0
		short = candy.slice(3,4).to_f - moneyUser
		puts "Sorry! you don't have enough for " << candy.slice(8..-1) << "."
		puts "You're short $ %0.2f" % [short] << ", but you may have enough for..."
		
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
		puts "Hey no money was inserted!"
	end	
end

if candyUser == tw.slice(0)
	print tw
end

if candyUser == ah.slice(0)
	print ah
end

if candyUser == ss.slice(0)
	print ss
end

if candyUser == fr.slice(0)
	print fr
end 

=begin

4 test cases
---------------
1. enough money
2. not enough money, but enough for something
3. not enough money for anything
4. no money (0.00)

{18-09-18 15:46}Savannahs-MBP:~/AdaJumpStart/Lesson.10.Expressions@master✗✗✗✗✗✗ qqdipps% ruby CandyMachine.rb
Welcome to Virtual Candy Machine!

How much money do you have? $.9

Great! You have $ 0.90,
Let's see what we can do for you...

Today we have:
A $0.75 M&M
B $1.00 Twix
C $0.35 Air Head
D $1.25 Sour Skittles
E $0.55 Fruit Roll-Up

What tickles your fancy?: A

beeboobeeep... enjoy your M&M!
tingchchch... don't forget your change: $ 0.15
{18-09-18 15:46}Savannahs-MBP:~/AdaJumpStart/Lesson.10.Expressions@master✗✗✗✗✗✗ qqdipps% ruby CandyMachine.rb
Welcome to Virtual Candy Machine!

How much money do you have? $0.60

Great! You have $ 0.60,
Let's see what we can do for you...

Today we have:
A $0.75 M&M
B $1.00 Twix
C $0.35 Air Head
D $1.25 Sour Skittles
E $0.55 Fruit Roll-Up

What tickles your fancy?: A

Sorry! you don't have enough for M&M.
You're short $ 0.15, but you may have enough for...
C $0.35 Air Head
E $0.55 Fruit Roll-Up
{18-09-18 15:47}Savannahs-MBP:~/AdaJumpStart/Lesson.10.Expressions@master✗✗✗✗✗✗ qqdipps% ruby CandyMachine.rb
Welcome to Virtual Candy Machine!

How much money do you have? $0.20

Great! You have $ 0.20,
Let's see what we can do for you...

Today we have:
A $0.75 M&M
B $1.00 Twix
C $0.35 Air Head
D $1.25 Sour Skittles
E $0.55 Fruit Roll-Up

What tickles your fancy?: A

Sorry! you don't have enough for M&M.
You're short $ 0.55, but you may have enough for...
nothing, you have enough for nothing. Sorry.
{18-09-18 15:48}Savannahs-MBP:~/AdaJumpStart/Lesson.10.Expressions@master✗✗✗✗✗✗ qqdipps% ruby CandyMachine.rb
Welcome to Virtual Candy Machine!

How much money do you have? $ 0

Great! You have $ 0.00,
Let's see what we can do for you...

Today we have:
A $0.75 M&M
B $1.00 Twix
C $0.35 Air Head
D $1.25 Sour Skittles
E $0.55 Fruit Roll-Up

What tickles your fancy?: A

Hey no money was inserted!	

	
=end