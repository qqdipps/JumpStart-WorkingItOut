=begin
Assignment: Walk-a-thon
You are going to create a program for tracking a walk-a-thon.

Primary Requirements
Create a walk-a-thon program that accepts the following input from the user:
Earning goal for the walk-a-thon
Amount earned per lap completed (per person)
Number of laps completed for 5 people
Have the walk-a-thon program calculate and output the following:
Who earned the most money
Total amount earned in the walk-a-thon
Whether or not the earning goal was met
Example Output
Below is an example program output. User input is indicated in ~~ (tildes).

Welcome to Crystal's Walk-A-Thon Tracker
Our goal is to raise money!

Enter the earning goal for this event > ~500~
Enter the amount earned per lap (per person) > ~2.50~

Please enter the number of laps completed by each person.
Walker #1 > ~10~
          --> Earned $25.0
Walker #2 > ~11~
          --> Earned $27.5
Walker #3 > ~50~
          --> Earned $125.0
Walker #4 > ~20~
          --> Earned $50.0
Walker #5 > ~22~
          --> Earned $55.0

========================================
Highest Earning Walker: #3
Total amount earned: $282.5
Goal Met? NO :-(
Optional Enhancements
√Display all money formatted to two decimal places
√Display by how much the goal was missed by or was beaten by, in the event that the goal was not achieved exactly (e.g. "The goal was missed by $217.50")
√Display multiple walkers as highest earning, in the event of a tie for highest earners
---
Consider how to handle 500 walkers
Consider each walker earning a different amount per lap walked
=end

# outline + comments + code
tracker = {}
total_earned = 0
# Welcome statements.
puts "\nWelcome to the United Walk-A-Thon!"
puts "Our goal is to raise money to help fund programs to 
support people who are targets of systemic oppression."
# Earning goal for the walk-a-thon prompt.
puts "\n\nTRACKER"
puts "=========================\n\n"
print "Goal: $ "
# User input.
goal = gets.chomp.to_f
# Amount earned per lap completed (per person) prompt.
print "Amount earned per lap completed (per person): $ "
# User input.
amount = gets.chomp.to_f
# Number of laps completed for 5 people.

puts "Number of laps walked per walker?"
	# Loop for each person for user input of laps walked.
5.times do |i|
	walker = "##{i + 1}"
	print "Walker #{walker}: "
	laps = gets.chomp.to_i
	# Store data in hash (key = walker #, value = # laps).
	tracker[walker] = laps
end

winner = []

# Adds walker number to winner array if laps is greatest. Works for ties.
tracker.each {|walker, laps| winner << walker if laps == tracker.values.max}

# Calculates tbe amount of money winner walkers have earned based on the amount of laps and amount walked.
# Prints formatted list of winners w/ correct grammer.
# WINNER 1 has ..
# WINNER 1 and WINNER 2 have ...
# WINNER 1, WINNER 2, WINNER n-1, and WINNER n have ....
puts "\n\nWhile there are no winners in a Walk-A-Thon. \nWe would like to take a moment and acknowledge those who \ncontributed the time and energy to walk the talk:"
print "\nWalker "
winner.each do |walker|
	# If there are 1 or 2 winners then the first walker should only be participant's name & space.
	if winner.length() <=2 &&  walker == winner[0]
		print "#{walker} "
		# If there is only 1 winner then singular winner comment is appended.
		print (winner.length() == 1	? "has " : "")
	# If there is 3 or more winners then each walker is printed with participant's name, comma, & space.
	# Unless walker is the last winner then it is handled by else statement. 
	elsif walker != winner[-1]
		print "#{walker}, "
	# If there is more than one walker the last walker is 'and', space, participant's name, space, & pluaral winning comment.
	else
		print "and #{walker} have each "
	end
end
print "earned the most money, $%0.2f by walking #{tracker[winner[0]]} laps" % [(tracker[winner[0]] * amount)]
puts winner.length() > 1? " a piece." : "."

# Walk-A-Thon Results:
puts "\n\nUnited Walk-A-Thon Results:"
puts "=========================\n\n"
# Have the walk-a-thon program calculate and output the following:
# Who earned the most money, which keys are max values?
# Total amount earned in the walk-a-thon.
total_earned =  tracker.values.inject(:+) * amount
puts "Total raised was $%0.2f" % [total_earned]
# Whether or not the earning goal was met.
# Is total earned greater than goal?
puts total_earned > goal ? "Congratulations! Our goal was met! \nWe surpassed our goal by $%0.2f!" % [total_earned - goal] : "We fell short by $%0.2f, let's try another fundraiser to make our goal!" % [goal - total_earned] + "\n\n"

=begin 
CONSOLE
Test cases:
1. Goal not met, with 4 way tie
2. Goal met, single winner.

------------TEST 1------------
{18-10-08 21:51}[ruby-2.4.1]Savannahs-MacBook-Pro:~/AdaJumpStart/Lesson.13.Hash@master✗✗✗✗✗✗ qqdipps% ruby Walk_A_Thon.rb

Welcome to the United Walk-A-Thon!
Our goal is to raise money to help fund programs to
support people who are targets of systemic oppression.


TRACKER
=========================

Goal: $ 500
Amount earned per lap completed (per person): $ 5
Number of laps walked per walker?
Walker #1: 10
Walker #2: 10
Walker #3: 10
Walker #4: 10
Walker #5: 8


While there are no winners in a Walk-A-Thon.
We would like to take a moment and acknowledge those who
contributed the time and energy to walk the talk:

Walker #1, #2, #3, and #4 have each earned the most money, $50.00 by walking 10 laps a piece.


United Walk-A-Thon Results:
=========================

Total raised was $240.00
We fell short by $260.00, let's try another fundraiser to make our goal!

---------------TEST 2------------
{18-10-08 21:53}[ruby-2.4.1]Savannahs-MacBook-Pro:~/AdaJumpStart/Lesson.13.Hash@master✗✗✗✗✗✗ qqdipps% ruby Walk_A_Thon.rb

Welcome to the United Walk-A-Thon!
Our goal is to raise money to help fund programs to
support people who are targets of systemic oppression.


TRACKER
=========================

Goal: $ 260
Amount earned per lap completed (per person): $ 2.35
Number of laps walked per walker?
Walker #1: 88
Walker #2: 67
Walker #3: 45
Walker #4: 24
Walker #5: 122


While there are no winners in a Walk-A-Thon.
We would like to take a moment and acknowledge those who
contributed the time and energy to walk the talk:

Walker #5 has earned the most money, $286.70 by walking 122 laps.


United Walk-A-Thon Results:
=========================

Total raised was $813.10
Congratulations! Our goal was met!
We surpassed our goal by $553.10!
=end