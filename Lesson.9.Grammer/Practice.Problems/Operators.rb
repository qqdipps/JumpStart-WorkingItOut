d = 10
e = 5.0
f = 2
g = 11.0
h = 3
i = 1.5
#Operation
#Result	
#DataType
type = "Data type of \"result\": " # double quotes for pract. 
type1 = "Fixnum"	# aka Integer
type2 = " float"



s = f + h				
q = 5 
puts "f + h	"
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 	
puts type + type1
puts ""

s = g + h	
puts "g + h	"
q = 14.0
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type2
puts ""


s = d - f	
puts "d - f	"
q = 8
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type1
puts ""

s = g - e		
puts "g + e	"
q = 6.0
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type2
puts ""

s = (h + i) - f		
puts "(h + i) - f"
q = 2.5
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type2
puts ""

s = (d - f) + e	
puts "(d - f) + e	"
q = 13.0
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type2
puts ""

s = d * f		
puts "d * f	"
q = 20
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type1
puts ""

s = g * i		
puts "g * i	"
q = 16.5
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type2
puts ""

s = f * g		
puts "f * g	"
q = 22.0
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type2
puts ""

s = d / f		
puts "d / f	"
q = 5
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type1
puts ""

s = d / e
puts "d / e	"
q = 2.0
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type2
puts ""

s = e / f		
puts "e / f	"
q = 2.5
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type2
puts ""

s = (g * f) / f		
puts "(g * f) / f"
q = 11.0
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type2
puts ""

s = (d / f) * e		
puts "(d / f) * e"
q =  25.0
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type2
puts ""

s = 21 / 5		
puts "21 / 5	"
q = 4
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type1
puts ""

s = 14 / 5		
puts "14 /5	"
q = 2
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type1
puts ""

s = 10 % 3		
puts "10 % 3	"
q = 1
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type1
puts ""

s = 20 % 2		
puts "20 % 2	"
q = 0
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type1
puts ""

s = 4 % 5		
puts "4 % 5	"
q = 4
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type1
puts ""

s = 8 % 1	
puts "8 % 1"
q = 0
puts "answer: #{q}" 
puts "result answer is correct: #{s==q and s.class == q.class} " 
puts type + type1
puts ""

=begin 
{18-09-17 15:27}Savannahs-MBP:~/AdaJumpStart/Lesson.9.Grammer/Practice.Problems@master✗✗✗✗✗✗ qqdipps% ruby Operators.rb
f + h
answer: 5
result answer is correct: true
Data type of "result": Fixnum

g + h
answer: 14.0
result answer is correct: true
Data type of "result":  float

d - f
answer: 8
result answer is correct: true
Data type of "result": Fixnum

g + e
answer: 6.0
result answer is correct: true
Data type of "result":  float

(h + i) - f
answer: 2.5
result answer is correct: true
Data type of "result":  float

(d - f) + e
answer: 13.0
result answer is correct: true
Data type of "result":  float

d * f
answer: 20
result answer is correct: true
Data type of "result": Fixnum

g * i
answer: 16.5
result answer is correct: true
Data type of "result":  float

f * g
answer: 22.0
result answer is correct: true
Data type of "result":  float

d / f
answer: 5
result answer is correct: true
Data type of "result": Fixnum

d / e
answer: 2.0
result answer is correct: true
Data type of "result":  float

e / f
answer: 2.5
result answer is correct: true
Data type of "result":  float

(g * f) / f
answer: 11.0
result answer is correct: true
Data type of "result":  float

(d / f) * e
answer: 25.0
result answer is correct: true
Data type of "result":  float

21 / 5
answer: 4
result answer is correct: true
Data type of "result": Fixnum

14 /5
answer: 2
result answer is correct: true
Data type of "result": Fixnum

10 % 3
answer: 1
result answer is correct: true
Data type of "result": Fixnum

20 % 2
answer: 0
result answer is correct: true
Data type of "result": Fixnum

4 % 5
answer: 4
result answer is correct: true
Data type of "result": Fixnum

8 % 1
answer: 0
result answer is correct: true
Data type of "result": Fixnum
=end	
