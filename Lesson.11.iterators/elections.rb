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
Handle grammar of vote summary saying vote or votes appropriately
√Handle write in votes
√Consider how to handle more than 10 votes
√Consider how to handle more than 3 candidates
√Refactor your code so that your code is DRY (Don't Repeat Yourself)

=end



# puts "\n new line check \n learned about new line"

# Initialize candidate (array and dictionary) 
# (dictionary then can tally votes):
# 'roster' is array containing candidate.
# Update roster to add more candidates.
roster = ["Marge", "Homer", "Lisa"]
# Number of voters can be changed using voters var.
voters = 10
# Build ballot box from roster:
# Intialize ballot_box hash with defualt of 0 (if key is called not in hash value is 0)
# Key will be canidate, value will be number of votes.
ballot_box = Hash.new(0)

# For each candidate on roster, add them to ballot box with defualt value
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
# User instructions to vote:
puts "\nStep right in to the voting booth.\nFollow the instructions to cast your vote!\n\n"

# Builds voting instructions using range. 
# Range is based on how many canidates are in roster.
(1..roster.length()).each do |i|  
	# Generate vote number (i) using range.
	# Vote is associated to Roster indexing by (i-1).
	puts "		Vote #{i} for " + roster[i-1] + "." 
end

# Write in candidate instructions.
puts "\nIf none of these candidates \"woo you\", you may write in a candidate.\n\n"

# Number of voters determined by voters var, set at begining of program.
voters.times do |i|
	# User prompted to vote.
	print "Voter ##{i+1} cast your vote: "
	# User input for vote.
	vote = gets.chomp	

	# Is vote valid? Checks if float is greater then # of canidates (string ok).
	# Purpose is to avoid out of bounds error when vote is used to index roster. 
	while (vote.to_f > roster.length())
		# Invalid vote statement w/reason.
		puts "Unable to process vote: invalid number selected.\n\n"
		# User prompt to re-vote.
		print "Voter #{i+1} re-cast your vote: "
		# User input for re-vote.
		vote = gets.chomp
	end

	# Checks vote against candidate. Is vote integer? 
	if vote.to_i.to_s == vote
		# Vote changed to integer type for index calculations.
		vote = vote.to_i
		# Increases candidate tally.
		# Methodology:
		# (vote-1) is the roster index position of canidate selected.
		# Roster index returns selected canidate string.
		# Canidate string used as key in ballot box hash.
		# Canidate key is used to access value (number of votes)
		# Value updated to be equal to value + 1 each time canidates recieves vote.
		ballot_box[roster[vote-1]] = (ballot_box[roster[vote-1]] + 1)
		# Thank you and confirmation user statement.
		puts "Thank you voter ##{i+1} for placing your vote for " << roster[vote-1] << "."
	
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
puts ballot_box


# display message about voting being completed and votes being counted
# return votes totals
# determine winner 
# winner statement
# if tie ask if run off votes 
# if yes conduct vote off similar as to regular vote but no write ins
# if no announce tie and shared position