=begin 

Assignment: Student Account Generator
We are going to write a program that generates some student information. 
This exercise will practice our skills with strings, random numbers, 
arrays and iterators.

Requirements
You will start by creating three arrays:

√An array that will contain student names
√An array that will store student ID numbers
√An array that will contain student email addresses
√Note Make sure to name your variables appropriately so that it is easy 
to deduce the information stored in each array and that this information 
is not singular. e.g.
flowers = ["lily", "rose", "gardenia", "daisy"] vs. flower = "tulip"

√Write a times loop that asks the user to enter in 5 student names 
(first and last name) and store those values in the first array in 
all uppercase even if the information is not entered by the user in 
uppercase.
Example output: student names

√Write a times loop to generate random student ID numbers 
from 111111 to 999999 and put these values to the student 
ID number array.
Example output: student IDS

√Write a times loop to generate student email addresses in the format: 
(first inital)+(last name)+(last 3 digits of student ID number)@adadevelopersacademy.org
Example output: student emails

√Write the code which will print out all the student names, ID numbers, and email addresses in parallel.

Optional Enhancements
√make sure none of the IDs are duplicates
	=> loop to check if rand # generated is already in id_number array.

√account for ID numbers whose last 3 digits are less 
than 100 (e.g. 111008) because these ID numbers will generate an 
email address with less than 3 digits at the end without special cases.
	=> changed numbers to string 

√on email generation, account for first names with a space in them
e.g. if the first name is "Mary Jane", then the first initial 
should be "MJ" rather than just "M"
	=>added check: if fist space does not equal last space then take first char 
	after first space and append it to email builder string.

√read in the student names from a file instead of the user and 
make the array size according to the number of names
	=> created Student_Names.txt and used File class wth open method in each loop.
=end

# Student Account Generator
# by qqdipps

names = []
id_numbers = []
email_addresses = []

# Reads student names from file Student_Names.txt
File.open("Student_Names.txt").each do |student_name| 
 	names << student_name.chomp
end
# Number of loops based on how many names are added to names array.
num_loops = names.length() 

# Random number is generated and check for duplicate number then added to id_numbers array.
num_loops.times do 
	rand_num = rand(111111..999999)
	until !(id_numbers.include?(rand_num))
		rand_num = rand(111111..999999)
	end	
	id_numbers << rand_num.to_s
end

# Email addresss is built to specification (see requirements line 30-32) with optional enhancements.
num_loops.times do |i|
	email_builder =  names[i].slice(0) 
	if names[i].index(" ") != names[i].rindex(" ")
		email_builder += names[i].slice(names[i].index(" ") + 1) 
	end
	email_builder += names[i][(names[i].rindex(" ") + 1)..-1]
	email_builder += id_numbers[i].slice(-3..-1)
	email_builder += "@adadevelopersacademy.org"
	email_addresses <<  email_builder
end

# Prints name, ID number and email address for each student in parallel.
num_loops.times do |i|
	puts names[i] + " " + id_numbers[i] + " " + email_addresses[i]
end

=begin 
Console output:

Savannah Dippolito 695565 SDippolito565@adadevelopersacademy.org
Sam Ram Bamjam 594689 SRBamjam689@adadevelopersacademy.org
Donna Mae Ronaldson 430509 DMRonaldson509@adadevelopersacademy.org
Penny Wennyia 419349 PWennyia349@adadevelopersacademy.org
Gigi Gorgeouson 263930 GGorgeouson930@adadevelopersacademy.org

=end
