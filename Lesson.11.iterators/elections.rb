=begin 
Assignment: Election Time
You are going to create an electronic election program that 
tracks votes, 
total votes, and 
determines a winner.

Primary Requirements
Create an election program that accepts input from the user 
and outputs the winner of the election

Input: Poll 10 people for their election vote
Output: Print the total votes cast as well as the winner of the election

Optional Enhancements
Some of these enhancements are better solved after having knowledge from lesson 12, so you can 
try some and then come back and do others after lesson 12.

Handle ties for a winner appropriately
Handle grammar of vote summary saying vote or votes appropriately
Handle write in votes
Consider how to handle more than 10 votes
Consider how to handle more than 3 candidates
Refactor your code so that your code is DRY (Don't Repeat Yourself)

=end



#puts "\n new line check \n learned about new line"

# initialize canidiates (either array or dictionary) (dictionary then can tally votes)
# opening statements
# welcome
# election
# canidiate selection
# user prompts to vote
# user input vote_user
# checks vote against canidiates
# increases canidiate tally
# if no canidiate ask if this is write in
# if yes add canidiate and tally to ballot_box
# if no ask voter to re-cast
# give out "I voted" sticker
# after 10 votes are submitted ask if more votes
# if yes add votes and ask each time vote is cast if more votes repeat
# if no display message about voting being completed and votes being counted
# return votes totals
# determine winner 
# winner statement
# if tie ask if run off votes 
# if yes conduct vote off similar as to regular vote but no write ins
# if no announce tie and shared position