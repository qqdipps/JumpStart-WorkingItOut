=begin 
Assignment: Election Time
You are going to create an electronic election program that 
√tracks votes, 
√total votes, and 
determines a winner.

Primary Requirements
√Create an election program that accepts input from the user 
and outputs the winner of the election

Input: Poll 10 people for their election vote
Output: Print the total votes cast as well as the winner of the election

Optional Enhancements
Some of these enhancements are better solved after having knowledge from lesson 12, so you can 
try some and then come back and do others after lesson 12.

Handle ties for a winner appropriately
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
# Intialize ballot_box hash with defualt of 0 (if key is called not in hash, value is 0).
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

# Each voter cast a vote and vote is tallied:
# Number of voters determined by voters var, set at begining of program.
voters.times do |i|
	# Voter prompt:
	print "Voter ##{i+1} cast your vote: "
	# Voter input:
	vote = gets.chomp	

	# Is vote valid? Checks if vote is greater then # of candidates (string ok).
	# Purpose is to avoid out of bounds error when vote is used to index roster. 
	while (vote.to_i > roster.length())
		# Invalid vote statement w/reason.
		puts "Unable to process vote: invalid number selected.\n\n"
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
		# candidate string used as key in ballot box hash.
		# candidate key is used to access value (number of votes)
		# Value updated to be equal to value + 1 each time candidates recieves vote.
		ballot_box[roster[vote-1]] = (ballot_box[roster[vote-1]] + 1)
		# Thank you and confirmation statement:
		puts "Thank you voter ##{i+1} for placing your vote for " << roster[vote-1] << "."
	# Else vote is write-in.
	# Adds write in candidate and tally to ballot_box.
	# Works if voter writes in canididate in ballot_box.
	else 
		# Formats write-in vote.
		vote = vote.capitalize 
		# Candidate is called as key in ballot_box hash.
		# New candidate's value is set to default + 1.
		# When candidate in hash is wrote-in, current value is increased by 1.
		ballot_box[vote] = ballot_box[vote] + 1 
		# Thank you and confirmation user statement.
		puts "Thank you voter ##{i+1} for writing in a vote for " << vote << "."
	end	
	
	# Give out "I voted" sticker.
	puts "	Here's an \"I Voted!\" sitcker! \n\n "
end

# display message about voting being completed and votes being counted
puts "Voting polls are now closed."
puts "Thank you, voters for participating in the election \nfor the Springfield Comptroller!"
puts "\nLet's open the ballot box and count the votes: "

#Intializing winner and tie tally and placeholder vars.
winner_tally = 0
winner_temp = ""
tie_tally = 0
tie_temp = ""

# Iterates over ballot_box to display totals, determine winner, and set tie counters.
ballot_box.each do | candidate, votes |
# Display voting totals.
	if votes == 1
		puts "	#{candidate} recieved #{votes} vote."
	else
		puts "	#{candidate} recieved #{votes} votes."
	end
# tie counters
	if votes == winner_tally
		tie_tally = votes
		tie_temp = candidate
	end
	
# determine winner 
	if votes > winner_tally
		winner_temp = candidate
		winner_tally = votes
	end
end

#Intializing winner variables (winner_2 if tie)
winner = winner_temp

# evaluate tie counters and determines winner
if tie_tally == winner_tally
	winner_2 = tie_temp
	# Announcement of tie and shared position
	puts "\nWowza! there's a tie!"
	puts "#{winner_2} and #{winner} have been elected Co-Comptrollers of Springfield!"
else
	# winner statement
	puts "\nWe have a winner:"
	puts "#{winner} has been elected Comptroller of Springfield!!"
end

# if tie ask if run off votes 
# if yes conduct vote off similar as to regular vote but no write ins