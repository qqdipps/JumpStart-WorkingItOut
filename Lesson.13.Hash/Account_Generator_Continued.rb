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

=====================
LESSON 13 HASHES
Complete the following refactor steps:

√Utilize a single array variable to store all student information, 
instead of three individual arrays. 

√This array will contain many hashes.

√Utilize a single loop to drive the hash population (you may have nested
loops inside this loop for other functionality)

=end

# Student Account Generator Cont.
# by qqdipps

#intiate array and counter
student_data = []
i = 0

# Reads student names from file Student_Names.txt
# Number of loops based on how many names are in file.
File.open("Student_Names.txt").each do |student_name| 
	#intiates hash with key symbol :name and value students_name
	student_data[i] = {name: student_name.chomp.upcase}

	# Student ID is generated and check against each hash to see if duplicate student ID is present.
	rand_num = rand(111111..999999)
	(i).times  do |j|
		while (student_data[j].has_value?(rand_num))
			rand_num = rand(111111..999999)
			puts rand_num
		end
	end	
	
	# Unique Student ID value is converted to string.
	# Added to hash associated with key sybmol :ID.
	student_data[i][:ID]= rand_num.to_s

	# Email addresss is built to specification (see requirements lines 30-32) 
	# with optional enhancements (lines 40-49).
	full_name =  student_data[i][:name]
	email_builder =  full_name.slice(0) 
	if full_name.index(" ") != full_name.rindex(" ")
	 	email_builder += full_name.slice(full_name.index(" ") + 1) 
	end
	email_builder += full_name.slice((full_name.rindex(" ") + 1)..-1)
	email_builder += student_data[i][:ID].slice(-3..-1)
	email_builder += "@adadevelopersacademy.org"

	# Added to hash with key symbol :email.
	 student_data[i][:email] = email_builder

	# Prints name, ID number and email address for each student in parallel.
	puts "#{full_name} #{student_data[i][:ID]} #{student_data[i][:email]} "
	i += 1
end
puts student_data #checking data stored properly.
=begin 
Console output:

{18-09-23 22:33}[ruby-2.4.1]Savannahs-MBP:~/AdaJumpStart/Lesson.13.Hash@master✗✗✗✗✗✗ qqdipps% ruby Account_Generator_Continued.rb
SAVANNAH DIPPOLITO 226219 SDIPPOLITO219@adadevelopersacademy.org
SAM RAM BAMJAM 629511 SRBAMJAM511@adadevelopersacademy.org
DONNA MAE RONALDSON 398420 DMRONALDSON420@adadevelopersacademy.org
PENNY WENNYIA 941624 PWENNYIA624@adadevelopersacademy.org
GIGI GORGEOUSON 901416 GGORGEOUSON416@adadevelopersacademy.org
{:name=>"SAVANNAH DIPPOLITO", :ID=>"226219", :email=>"SDIPPOLITO219@adadevelopersacademy.org"}
{:name=>"SAM RAM BAMJAM", :ID=>"629511", :email=>"SRBAMJAM511@adadevelopersacademy.org"}
{:name=>"DONNA MAE RONALDSON", :ID=>"398420", :email=>"DMRONALDSON420@adadevelopersacademy.org"}
{:name=>"PENNY WENNYIA", :ID=>"941624", :email=>"PWENNYIA624@adadevelopersacademy.org"}
{:name=>"GIGI GORGEOUSON", :ID=>"901416", :email=>"GGORGEOUSON416@adadevelopersacademy.org"}

=end
