=begin
Array Worksheet
Read the code in each section, then write exactly what the code prints out.

Each problem stands alone. Variables from previous problems do not exist.

Example:

x = 5
y = 6
print(x+y)
 => 11
Problem Set
True will print if answer is correct, else false.
=end

random_data = ["b", "a", 1, 3, 99, "c"]
puts random_data[4] == 99
puts random_data[2] + 10 == 11
puts random_data[1] + random_data[0] == "ab"

numeric_data = []
numeric_data << 2
numeric_data << 4
numeric_data << 6
numeric_data << 8
puts numeric_data.length == 4
puts numeric_data[1] == 4

my_array = ["dog", 5, "cat", 2, "horse", 1]
puts my_array[6] == nil #thought it would be error, (see line 51)  out of bounds, actually is nil.
puts my_array.last == 1

numbers = Array.new(3)
puts numbers.length == 3
puts numbers.first == nil

student_names = Array.new(24, "Student")
student_names << "Test"
student_names << "Grumpy Cat"
puts student_names[1] == "Student"
puts student_names[25] == "Grumpy Cat"

=begin 
{18-09-23 0:00}[ruby-2.4.1]Savannahs-MBP:~/AdaJumpStart/Lesson.12.Array/practice_problems@master✗✗✗✗✗✗ qqdipps% ruby Array_WS.rb
true
true
true
true
true

true
true
true
true
true
{18-09-23 0:00}[ruby-2.4.1]Savannahs-MBP:~/AdaJumpStart/Lesson.12.Array/practice_problems@master✗✗✗✗✗✗ qqdipps% ruby Array_WS.rb
true
true
true
true
true
true
true
true
true
true
true
=end