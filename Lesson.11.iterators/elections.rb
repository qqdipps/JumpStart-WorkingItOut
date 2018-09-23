=begin 
Assignment: Election Time
You are going to create an electronic election program that 
√tracks votes, 
√total votes, and 
√determines a winner.

Primary Requirements
√Create an election program that accepts input from the user 
√and outputs the winner of the election

√Input: Poll 10 people for their election vote
√Output: Print the total votes cast as well as the winner of the election

Optional Enhancements
Some of these enhancements are better solved after having knowledge from lesson 12, so you can 
try some and then come back and do others after lesson 12.

√Handle ties for a winner appropriately
√Handle grammar of vote summary saying vote or votes appropriately
√Handle write in votes
√Consider how to handle more than 10 votes
√Consider how to handle more than 3 candidates
√Refactor your code so that your code is DRY (Don't Repeat Yourself)

=end



# Initialize candidates and number of voters:
# Roster will be stored as an array containing candidates.
# Update roster to add more candidates.
roster = ["Marge", "Homer", "Lisa"]
# Number of voters can be changed using voters var.
voters = 10

# Build ballot box from roster:
# Intialize ballot_box hash with defualt of 0.
# Key will be candidate, value will be number of votes.
ballot_box = Hash.new(0)
# For each candidate on the roster, add candidate to ballot_box with defualt value.
roster.each do |candidate|
	# Sets candidate equal to defualt value. 
	ballot_box[candidate] = ballot_box[candidate]
end

# Election statement:
puts "\nThe Simpsons are running for office!"
puts "You're vote will decide who will be the Springfield Comptroller."
# Displays candidates:
puts "\nCandidates running are: "
puts roster

# Instructions to vote:
puts "\nStep right in to the voting booth.\nFollow the instructions to cast your vote!\n\n"
# Builds voting instructions using range. 
# Range is based on how many candidates are in roster.
(1..roster.length()).each do |i|  
	# Generate vote number (i) using range.
	# Vote is associated to Roster indexing by (i-1).
	puts "		Vote #{i} for " + roster[i-1] + "." 
end
# Write in candidate instructions:
puts "\nIf none of these candidates \"woo you\", you may write in a candidate.\n\n"

# Each voter casts a vote and vote is tallied:
# Number of voters determined by voters var, set at begining of program.
voters.times do |i|
	# Voter prompt:
	print "Voter ##{i+1} cast your vote: "
	# Voter input:
	vote = gets.chomp	
	# Is vote valid? Checks if vote is empty, 0, float, or is greater then # of candidates (string ok).
	# Purpose is to avoid out of bounds error, incorrectly add numbers as write-in, or return incorrect candidate when vote is used to index roster. 
	# if vote is integer then conintue loop until vote is included in the range 1 to length of roster.
	# if vote is not integer then continue loop until vote is not empty or a float or vote begins with "." i.e., ".9" .
	until ((vote.to_i.to_s == vote) ? (1..roster.length()).include?(vote.to_i) : !(vote.empty? || vote.to_f.to_s == vote || vote.slice(0) == "."))
		# Invalid vote statement w/reason.
		puts "Unable to process vote:" + (vote.empty? ? " No entry recieved." : (vote.to_f % 1 == 0 && (1..roster.length()).include?(vote.to_f) ? " Please enter vote as whole number, i.e., \"3\" not \"3.0\"." : " Number entered is not associated with a candidate.")) + "\n\n"
		# Voter prompt to re-vote:
		print "Voter #{i+1} re-cast your vote: " 
		# Voter input for re-vote:
		vote = gets.chomp
	end
	# Checks vote against candidate. Is vote write-in or number? 
	# If statement is true then vote is number.
	if vote.to_i.to_s == vote
		# Vote changed to integer type for index calculations.
		vote = vote.to_i
		# Increases candidate tally.
		# Methodology:
		# (vote-1) is the roster index position of candidate selected.
		# Roster index returns selected candidate string.
		# Candidate string used as key in ballot box hash.
		# Candidate key is used to access value (number of votes)
		# Value updated to be equal to value + 1 each time candidates recieves vote.
		ballot_box[roster[vote-1]] = (ballot_box[roster[vote-1]] + 1)
		# Thank you and confirmation statement:
		puts "Thank you voter ##{i+1} for placing your vote for #{roster[vote-1]}."
	# Else vote is write-in.
	# Adds write in candidate and tally to ballot_box.
	# Okay for voter to write-in candidate already in ballot box.
	else 
		# Formats write-in vote.
		vote = vote.capitalize 
		# Candidate is called as key in ballot_box hash.
		# New candidate's value is set to default + 1.
		# When candidate in hash is wrote-in, current value is increased by 1.
		ballot_box[vote] = ballot_box[vote] + 1 
		# Thank you and confirmation user statement.
		puts "Thank you voter ##{i+1} for writing in a vote for #{vote}."
	end	
	# Give out "I voted" sticker.
	puts "	Here's an \"I Voted!\" sitcker! \n\n "
end

# Display message about voting being completed and votes being counted.
puts "Voting polls are now closed."
puts "Thank you, voters for participating in the election \nfor the Springfield Comptroller!"
puts "\nLet's open the ballot box and count the votes: "

#Intializing winner tally var and winner results array.
winner_tally = 0
win_result = []

# Iterates over ballot_box to display totals and determines winning number of votes.
ballot_box.each do | candidate, votes |
# Display voting totals using correct grammer for vote(s)
	puts "	#{candidate} recieved #{votes} " + (votes == 1 ? "vote." : "votes.")
	# winner_tally is initalized to equal 0. The first candidate with # votes 
	# greater than 0, updates winner_tally to be equal to their # of votes.
	# Each iteration checks if current candidates vote is greater then winner_tally.
	# If it is, winner_tally gets updated. By the end of the iterations winner_tally
	# var holds the highest number of votes.
	winner_tally = votes > winner_tally ? votes : winner_tally
end

# Adds candidates that have winning number of votes to win_reselt array.
# After being added to array, candidate is deleted from ballot box so that the next 
# candidate with winning number of votes can be added or if all are added then
# nil is returned thus breaking the loop.
until ballot_box.key(winner_tally).nil?
	win_result << ballot_box.key(winner_tally)
	ballot_box.delete(ballot_box.key(winner_tally))
end

# Prints formatted list of winners w/ correct grammer.
# WINNER 1 has ..
# WINNER 1 and WINNER 2 have ...
# WINNER 1, WINNER 2, WINNER n-1, and WINNER n have ....
win_result.each do |entry|
	#if there are 1 or 2 winners then the first entry should only be candidate's name & space.
	if win_result.length() <=2 &&  entry == win_result[0]
		print "#{entry} "
		#if there is only 1 winner then singular winner comment is appended.
		print (win_result.length() == 1	? "has been elected Comptroller of Springfield!\n" : "")
	#if there is 3 or more winners then each entry is printed with candidate's name, comma, & space.
	#unless entry is the last winner then it is handled by else statement. 
	elsif entry != win_result[-1]
		print "#{entry}, "
	#if there is more than one entry the last entry is 'and', space, candidate's name, space, & pluaral winning comment.
	else
		puts "and #{entry} have been elected Comptrollers of Springfield!"
	end
end


# if tie ask if run off votes 
# if yes conduct vote off similar as to regular vote but no write ins

=begin 

Test Cases
1. 
a) input (votes): number (1-3), new write-in, 2nd time write_in of new, write-in from roster
b) output: 1 winner

2.
a) input (votes): test for invalid entries (vote >roster.length(), vote = float (in and out of range: whole with .0 appended and decimal), vote = 0, vote = "", vote = number begin with "." (not float)
b) output: 2 winner tie 

3.
a) input: update roster and voters
b) output: >2 winner tie 
--------------TEST 1--------------

{18-09-22 16:07}[ruby-2.4.1]Savannahs-MBP:~/AdaJumpStart/Lesson.11.iterators@master✗✗✗✗✗✗ qqdipps% ruby elections.rb

The Simpsons are running for office!
You're vote will decide who will be the Springfield Comptroller.

Candidates running are:
Marge
Homer
Lisa

Step right in to the voting booth.
Follow the instructions to cast your vote!

		Vote 1 for Marge.
		Vote 2 for Homer.
		Vote 3 for Lisa.

If none of these candidates "woo you", you may write in a candidate.

Voter #1 cast your vote: 1
Thank you voter #1 for placing your vote for Marge.
	Here's an "I Voted!" sitcker!


Voter #2 cast your vote: 2
Thank you voter #2 for placing your vote for Homer.
	Here's an "I Voted!" sitcker!


Voter #3 cast your vote: 3
Thank you voter #3 for placing your vote for Lisa.
	Here's an "I Voted!" sitcker!


Voter #4 cast your vote: Grandpa
Thank you voter #4 for writing in a vote for Grandpa.
	Here's an "I Voted!" sitcker!


Voter #5 cast your vote: grandPA
Thank you voter #5 for writing in a vote for Grandpa.
	Here's an "I Voted!" sitcker!


Voter #6 cast your vote: Lisa
Thank you voter #6 for writing in a vote for Lisa.
	Here's an "I Voted!" sitcker!


Voter #7 cast your vote: lisa
Thank you voter #7 for writing in a vote for Lisa.
	Here's an "I Voted!" sitcker!


Voter #8 cast your vote: 3
Thank you voter #8 for placing your vote for Lisa.
	Here's an "I Voted!" sitcker!


Voter #9 cast your vote: 2
Thank you voter #9 for placing your vote for Homer.
	Here's an "I Voted!" sitcker!


Voter #10 cast your vote: 1
Thank you voter #10 for placing your vote for Marge.
	Here's an "I Voted!" sitcker!


Voting polls are now closed.
Thank you, voters for participating in the election
for the Springfield Comptroller!

Let's open the ballot box and count the votes:
	Marge recieved 2 votes.
	Homer recieved 2 votes.
	Lisa recieved 4 votes.
	Grandpa recieved 2 votes.
Lisa has been elected Comptroller of Springfield!

---------------TEST 2 ------------------
{18-09-22 18:45}[ruby-2.4.1]Savannahs-MBP:~/AdaJumpStart/Lesson.11.iterators@master✗✗✗✗✗✗ qqdipps% ruby elections.rb

The Simpsons are running for office!
You're vote will decide who will be the Springfield Comptroller.

Candidates running are:
Marge
Homer
Lisa

Step right in to the voting booth.
Follow the instructions to cast your vote!

		Vote 1 for Marge.
		Vote 2 for Homer.
		Vote 3 for Lisa.

If none of these candidates "woo you", you may write in a candidate.

Voter #1 cast your vote: 2.0
Unable to process vote: Please enter vote as whole number, i.e., "3" not "3.0".

Voter 1 re-cast your vote: 2
Thank you voter #1 for placing your vote for Homer.
	Here's an "I Voted!" sitcker!


Voter #2 cast your vote: 5
Unable to process vote: Number entered is not associated with a candidate.

Voter 2 re-cast your vote: 3
Thank you voter #2 for placing your vote for Lisa.
	Here's an "I Voted!" sitcker!


Voter #3 cast your vote: .9
Unable to process vote: Number entered is not associated with a candidate.

Voter 3 re-cast your vote: 1
Thank you voter #3 for placing your vote for Marge.
	Here's an "I Voted!" sitcker!


Voter #4 cast your vote:
Unable to process vote: No entry recieved.

Voter 4 re-cast your vote: 2
Thank you voter #4 for placing your vote for Homer.
	Here's an "I Voted!" sitcker!


Voter #5 cast your vote: Marge
Thank you voter #5 for writing in a vote for Marge.
	Here's an "I Voted!" sitcker!


Voter #6 cast your vote: 0
Unable to process vote: Number entered is not associated with a candidate.

Voter 6 re-cast your vote: 4.0
Unable to process vote: Number entered is not associated with a candidate.

Voter 6 re-cast your vote: 2.3
Unable to process vote: Number entered is not associated with a candidate.

Voter 6 re-cast your vote: 2
Thank you voter #6 for placing your vote for Homer.
	Here's an "I Voted!" sitcker!


Voter #7 cast your vote: 1
Thank you voter #7 for placing your vote for Marge.
	Here's an "I Voted!" sitcker!


Voter #8 cast your vote: 1
Thank you voter #8 for placing your vote for Marge.
	Here's an "I Voted!" sitcker!


Voter #9 cast your vote: 2
Thank you voter #9 for placing your vote for Homer.
	Here's an "I Voted!" sitcker!


Voter #10 cast your vote: 3
Thank you voter #10 for placing your vote for Lisa.
	Here's an "I Voted!" sitcker!


Voting polls are now closed.
Thank you, voters for participating in the election
for the Springfield Comptroller!

Let's open the ballot box and count the votes:
	Marge recieved 4 votes.
	Homer recieved 4 votes.
	Lisa recieved 2 votes.
Marge and Homer have been elected Comptrollers of Springfield!
---------------TEST 3---------------------
{18-09-22 18:54}[ruby-2.4.1]Savannahs-MBP:~/AdaJumpStart/Lesson.11.iterators@master✗✗✗✗✗✗ qqdipps% ruby elections.rb

The Simpsons are running for office!
You're vote will decide who will be the Springfield Comptroller.

Candidates running are:
Marge
Homer
Lisa
Savannah

Step right in to the voting booth.
Follow the instructions to cast your vote!

		Vote 1 for Marge.
		Vote 2 for Homer.
		Vote 3 for Lisa.
		Vote 4 for Savannah.

If none of these candidates "woo you", you may write in a candidate.

Voter #1 cast your vote: 1
Thank you voter #1 for placing your vote for Marge.
	Here's an "I Voted!" sitcker!


Voter #2 cast your vote: 2
Thank you voter #2 for placing your vote for Homer.
	Here's an "I Voted!" sitcker!


Voter #3 cast your vote: 3
Thank you voter #3 for placing your vote for Lisa.
	Here's an "I Voted!" sitcker!


Voter #4 cast your vote: 4
Thank you voter #4 for placing your vote for Savannah.
	Here's an "I Voted!" sitcker!


Voter #5 cast your vote: 1
Thank you voter #5 for placing your vote for Marge.
	Here's an "I Voted!" sitcker!


Voter #6 cast your vote: 2
Thank you voter #6 for placing your vote for Homer.
	Here's an "I Voted!" sitcker!


Voter #7 cast your vote: 3
Thank you voter #7 for placing your vote for Lisa.
	Here's an "I Voted!" sitcker!


Voter #8 cast your vote: 4
Thank you voter #8 for placing your vote for Savannah.
	Here's an "I Voted!" sitcker!


Voter #9 cast your vote: 1
Thank you voter #9 for placing your vote for Marge.
	Here's an "I Voted!" sitcker!


Voter #10 cast your vote: 2
Thank you voter #10 for placing your vote for Homer.
	Here's an "I Voted!" sitcker!


Voter #11 cast your vote: 3
Thank you voter #11 for placing your vote for Lisa.
	Here's an "I Voted!" sitcker!


Voter #12 cast your vote: 4
Thank you voter #12 for placing your vote for Savannah.
	Here's an "I Voted!" sitcker!


Voter #13 cast your vote: 1
Thank you voter #13 for placing your vote for Marge.
	Here's an "I Voted!" sitcker!


Voter #14 cast your vote: 2
Thank you voter #14 for placing your vote for Homer.
	Here's an "I Voted!" sitcker!


Voter #15 cast your vote: 3
Thank you voter #15 for placing your vote for Lisa.
	Here's an "I Voted!" sitcker!


Voter #16 cast your vote: 4
Thank you voter #16 for placing your vote for Savannah.
	Here's an "I Voted!" sitcker!


Voting polls are now closed.
Thank you, voters for participating in the election
for the Springfield Comptroller!

Let's open the ballot box and count the votes:
	Marge recieved 4 votes.
	Homer recieved 4 votes.
	Lisa recieved 4 votes.
	Savannah recieved 4 votes.
Marge, Homer, Lisa, and Savannah have been elected Comptrollers of Springfield!
=end
