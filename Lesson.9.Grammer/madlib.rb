=begin
Write a madlibs program
First play a few on eduplace to become familiar with the game

Create a MadLib program that accepts input from the
 user and outprint a completed MadLib

Use up to ten different parts of speech in order to fill in your MadLib

Output should consist of a paragraph of output that has the user’s input 
substituted into the MadLib, we have provided an example run, 
but your madlib program should be 
unique to you
=end

#open user statement statement
puts "Hey y'all lets take it down to Crazy Town with some Mad Lips!! 
Follow the prompts to get your madlib tale:"

#formatting
puts"

"
#word prompts

#adj day
print "adj: " 
adjDay = gets.chomp.downcase


#object factory
print "noun (singular object): "
nounObject = gets.chomp.downcase

#number
print "number: "
num = gets.chomp

#adj object
print "adj: "
adjObject = gets.chomp.downcase


#verb ending in -ed
print "verb ending in -ed: "
verbEd = gets.chomp.downcase

#verb ending in -ing
print "verb ending in -ing: "
verbIng = gets.chomp.downcase

#noun animal
print "animal: "
animal = gets.chomp.downcase

#noun remember
print "noun (plural): "
nounRemember = gets.chomp.downcase

#formatting
puts "

"


#display madlib statement 
puts "Here's your funky tale \"Fun at the " << nounObject.capitalize << " Factory\": " 

#formatting
puts ""

#madlib indented
puts"	What a " << adjDay << " day! I went to the " << nounObject << " factory. 
	The tour guide showed us #{num} types of " << adjObject << " " << nounObject << ". 
	There were even great vats of " << nounObject << "s being " << verbEd << ". 
	The " << nounObject << " was " << verbIng << " like a " << animal << ". We 
	tasted a "<< nounObject <<" with crackers. Then we got free 
	" << nounRemember << " to remember our " << adjDay <<" day."





=begin
	
{18-09-18 12:56}Savannahs-MBP:~/AdaJumpStart/Lesson.9.Grammer@master✗✗✗✗✗✗ qqdipps% ruby madlib.rb
Hey y'all lets take it down to Crazy Town with some Mad Lips!!
Follow the prompts to get your madlib tale:


adj: Silly
noun (singular object): tire
number: 8
adj: sunny
verb ending in -ed: STEAMED
verb ending in -ing: flattering
animal: vulture
noun (plural): FLowerS


Here's your funky tale "Fun at the Tire Factory":

	What a silly day! I went to the tire factory.
	The tour guide showed us 8 types of sunny tire.
	There were even great vats of tires being steamed.
	The tire was flattering like a vulture. We
	tasted a tire with crackers. Then we got free
	flowers to remember our silly day.
	
end