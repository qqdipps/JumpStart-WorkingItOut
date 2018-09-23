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
	=> loop contiues to generate rand num until num is not already in id_number array.

√account for ID numbers whose last 3 digits are less 
than 100 (e.g. 111008) because these ID numbers will generate an 
email address with less than 3 digits at the end without special cases.
	=> changed numbers to string before adding to id_numbers array

√on email generation, account for first names with a space in them
e.g. if the first name is "Mary Jane", then the first initial 
should be "MJ" rather than just "M"
	=>added check: if index of fist space does not equal index of last space then take first char 
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
# Adds sudents names to names array.
File.open("Student_Names.txt").each do |student_name| 
 	names << student_name.chomp.upcase 
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

# Email addresss is built to specification (see requirements lines 30-32) with optional enhancements (lines 40-49).
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

{18-09-23 13:18}[ruby-2.4.1]Savannahs-MBP:~/AdaJumpStart/Lesson.12.Array@master✗✗✗✗✗✗ qqdipps% ruby Account_Generator.rb
SAVANNAH DIPPOLITO 323805 SDIPPOLITO805@adadevelopersacademy.org
SAM RAM BAMJAM 838658 SRBAMJAM658@adadevelopersacademy.org
DONNA MAE RONALDSON 773204 DMRONALDSON204@adadevelopersacademy.org
PENNY WENNYIA 562800 PWENNYIA800@adadevelopersacademy.org
GIGI GORGEOUSON 268516 GGORGEOUSON516@adadevelopersacademy.org

=end
