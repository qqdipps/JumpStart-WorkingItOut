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

# Roo implements read access for ods format.
require 'roo'

# Reads roster file.
roster = Roo::Spreadsheet.open('Walking_Roster.ods')

# Intiates master roster: will include array[hash] containing walker id, laps walked, and amount per lap for each participant.
master_roster = []
# Each row of roster is created into array[hash] for each walker.
roster.each(walker_ID: 'walker_ID', laps_walked: 'laps_walked', amount_per_lap: 'amount_per_lap') do |hash|
  # Adds array[hash] for each walker to master roster.
  master_roster << hash
end

# Adds hash that stores key (walker id number) with value (amount raised) to tracker.
master_roster.each do |participant_data|
	if participant_data[:walker_id] != "walker_ID"
		tracker["##{participant_data[:walker_ID]}"] = (participant_data[:laps_walked].to_i * participant_data[:amount_per_lap].to_f)
	end
end

winner = []

# Adds walker number to winner array if amount raised is max. Works for ties.
tracker.each {|walker, amount_raised| winner << walker if amount_raised == tracker.values.max}

# Calculates tbe amount of money winner walkers have earned based on the amount of laps and amount walked.
# Prints formatted list of winners w/ correct grammer.
# WINNER 1 has ..
# WINNER 1 and WINNER 2 have ...
# WINNER 1, WINNER 2, WINNER n-1, and WINNER n have ....
puts "\n\nWhile there are no winners in a Walk-A-Thon. \nWe would like to take a moment and acknowledge those who \ncontributed the time and energy to walk the talk:"
print "\nWalker "
winner.each do |walker|
	# If there are 1 or 2 winners then the first walker should only be participant's name & space.
	if winner.length() <= 2 && walker == winner[0]
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
print "earned the most money, $%0.2f" % [tracker[winner[0]]]
puts winner.length() > 1 ? " a piece." : "."

# Walk-A-Thon Results:
puts "\n\nUnited Walk-A-Thon Results:"
puts "=========================\n\n"
# Have the walk-a-thon program calculate and output the following:
# Who earned the most money, which keys are max values?
# Total amount earned in the walk-a-thon.
total_earned =  tracker.values.inject(:+)
puts "Total raised was $%0.2f" % [total_earned]
# Whether or not the earning goal was met.
# Is total earned greater than goal?
puts total_earned > goal ? "Congratulations! Our goal was met! \nWe surpassed our goal by $%0.2f!" % [total_earned - goal] : "We fell short by $%0.2f, let's try another fundraiser to make our goal!" % [goal - total_earned] + "\n\n"

=begin 
CONSOLE
Test cases:
1. Goal met
2. Goal not met

------------TEST 1------------
{18-10-09 1:05}[ruby-2.4.1]Savannahs-MacBook-Pro:~/AdaJumpStart/Lesson.13.Hash@master✗✗✗✗✗✗ qqdipps% ruby Walk_A_Thon_500_enhanced.rb

Updated data for second test case.
Welcome to the United Walk-A-Thon!
Our goal is to raise money to help fund programs to
support people who are targets of systemic oppression.


TRACKER
=========================

Goal: $ 25000


While there are no winners in a Walk-A-Thon.
We would like to take a moment and acknowledge those who
contributed the time and energy to walk the talk:

Walker #38, #198, and #436 have each earned the most money, $200.00 a piece.


United Walk-A-Thon Results:
=========================

Total raised was $25023.00
Congratulations! Our goal was met!
We surpassed our goal by $23.00!


---------------TEST 2---------
{18-10-09 1:07}[ruby-2.4.1]Savannahs-MacBook-Pro:~/AdaJumpStart/Lesson.13.Hash@master✗✗✗✗✗✗ qqdipps% ruby Walk_A_Thon_500_enhanced.rb

Welcome to the United Walk-A-Thon!
Our goal is to raise money to help fund programs to
support people who are targets of systemic oppression.


TRACKER
=========================

Goal: $ 30000


While there are no winners in a Walk-A-Thon.
We would like to take a moment and acknowledge those who
contributed the time and energy to walk the talk:

Walker #26, #133, #298, and #410 have each earned the most money, $190.00 a piece.


United Walk-A-Thon Results:
=========================

Total raised was $25303.00
We fell short by $4697.00, let's try another fundraiser to make our goal!

=end