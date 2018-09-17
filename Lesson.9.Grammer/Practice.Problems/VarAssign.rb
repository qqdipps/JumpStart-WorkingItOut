x = 5
# what value does x now hold?
# 5
puts " x = #{x}"

z = "Hello"
# what value does z now hold?
#Hello
puts "z = " + z #check


a = 5
b = 3.2
c = a + b
# what values does c now hold?
# c = 8.2
puts "c = #{c}" #check

var1 = "lawl"
var2 = "brb"
# what value does var2 now hold?
# brb
puts "var2 = " + var2 #check

e = 6 + 3
# what values does e now hold?
#8
puts "e = #{e}" #check
#OOPS 6+3 = 9 NOT 8 :)

f = 3.5
f = f + 2
# what value does f now hold?
#5.5
puts "f = #{f} " #check

poodle = 4
pitbull = 3
# what value does boxer now hold?
#null or error for undeclared var 
#puts "boxer = " + boxer # check
#VarAssign.rb:39:in `<main>': undefined local variable or method `boxer' for main:Object (NameError)

h = 5
h = h + h
# what values does h now hold?
# 10 
puts "h = #{h} " #check

j = 1
k = 2
m = 3
n = j + k + m
# what value does n now hold?
#6
puts "n = #{n} "

p = "moo"
q = "quack"
p  = q
# what value does p now hold?
#quack
puts " p = " + p #check

r = "moo"
s = "quack"
t = "woof"
r = t
# what value does r now hold?
#woof
puts "t = " + t #check

u = 5
u = u * 2
u = u * 2
u = u * 2
# what value does u now hold?
# 40
puts "u = #{u}" #check

v = "b"
z = "a"
# what value does v now hold?
#b
puts "v = " + v #check

aa = 3234
bb = 2398
cc = 0
#dd = (aa + bb) / cc
# what value does dd now hold?
# error can not dived by 0
#puts "dd = #{dd}" #check
#VarAssign.rb:88:in `/': divided by 0 (ZeroDivisionError)
	#from VarAssign.rb:88:in `<main>'
yy = 7
zz = yy % 2
# what value does zz now hold?
#1
puts "zz = #{zz}" #check

ee = 12
ff = ee % 4
# what value does ff now hold?
#0
puts "ff = #{ff}" #check


zz = 17
hh = zz % 3
# what value does hh now hold?
#2
puts "hh = #{hh}" #check