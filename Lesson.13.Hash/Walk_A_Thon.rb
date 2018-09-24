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
Display all money formatted to two decimal places
Display by how much the goal was missed by or was beaten by, in the event that the goal was not achieved exactly (e.g. "The goal was missed by $217.50")
Display multiple walkers as highest earning, in the event of a tie for highest earners
Consider how to handle 500 walkers
Consider each walker earning a different amount per lap walked
=end

# outline + comments + code
tracker = {}
total_earned = 0
# welcome statements
puts "Welcome to the United Walk-A-Thon"
puts "Our goal is to raise money to help fund programs to 
support people who are targets of systemic oppression."
# Earning goal for the walk-a-thon prompt
puts "\n\nTRACKER"
puts "=========================\n\n"
print "Goal: $ "
# user input
goal = gets.chomp.to_f
# Amount earned per lap completed (per person) prompt
print "Amount earned per lap completed (per person): $ "
# user input
amount = gets.chomp.to_f
# Number of laps completed for 5 people

puts "Number of laps walked per walker?"
5.times do |i|
	# loop for each person for user input of laps walked
	walker = "##{i + 1}"
	print "Walker #{walker}: "
	laps = gets.chomp.to_i
	# store data in hash (key = walker #, value = # laps)
	tracker[walker] = laps
end
winner =  tracker.max_by {|key,value| value} 
puts "\nWalker #{winner[0]} earned the most money: $ #{(winner[1] * amount)}."
puts "\n\nUnited Walk-A-Thon Results:"
puts "=========================\n\n"
# Have the walk-a-thon program calculate and output the following:
# Who earned the most money
# which key as max value?
# Total amount earned in the walk-a-thon
total_earned =  tracker.values.inject { | result, elem | result + (elem * amount) }
puts "Total raised was $#{total_earned}.\n"
# Whether or not the earning goal was met
# is total earned greater than goal?
puts (total_earned > goal ? "Congratulations! Goal was met!" : "We fell short, let's try another fundraiser to make our goal!") + "\n\n"

=begin 
CONSOLE
Test cases:
1. Goal not met.
2. Goal met.

------------TEST 1------------
{18-09-24 12:22}[ruby-2.4.1]Savannahs-MBP:~/AdaJumpStart/Lesson.13.Hash@master✗✗✗✗✗✗ qqdipps% ruby Walk_A_Thon.rb
Welcome to the United Walk-A-Thon
Our goal is to raise money to help fund programs to
support people who are targets of systemic oppression.


TRACKER
=========================

Goal: $ 1000
Amount earned per lap completed (per person): $ 4.45
Number of laps walked per walker?
Walker #1: 30
Walker #2: 20
Walker #3: 34
Walker #4: 54
Walker #5: 23

Walker #4 earned the most money: $ 240.3.


United Walk-A-Thon Results:
=========================

Total raised was $612.95.
We fell short, let's try another fundraiser to make our goal!

------------TEST 2------------
{18-09-24 12:23}[ruby-2.4.1]Savannahs-MBP:~/AdaJumpStart/Lesson.13.Hash@master✗✗✗✗✗✗ qqdipps% ruby Walk_A_Thon.rb
Welcome to the United Walk-A-Thon
Our goal is to raise money to help fund programs to
support people who are targets of systemic oppression.


TRACKER
=========================

Goal: $ 3340
Amount earned per lap completed (per person): $ 7.75
Number of laps walked per walker?
Walker #1: 23
Walker #2: 200
Walker #3: 53
Walker #4: 235
Walker #5: 32

Walker #4 earned the most money: $ 1821.25.


United Walk-A-Thon Results:
=========================

Total raised was $4053.0.
Congradulations! Goal was met!
