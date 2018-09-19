#COUNTER_CONTROLLED LOOPS
# Number of loops determined prior to execution of loop. 


#times

3.times do 
	puts " hello!"
end

3.times do |i|
	puts i.to_s << "hello!"
end

-3.times do |num|
	puts num			#no error but no output
end


#ranges

(5..8).each do |elem|  # inclusive
	puts elem
end

# (4,5).each do |i|      #does not work iterator.notes.rb:17: syntax error, unexpected ',', expecting ')'
# 	puts i
# end

(5...8).each do |num| #exclusive 
	puts num
end



#SENTINEL CONTROLLED LOOPS 
#Can not determine # of loops prior to execution

#while loops

i = 0 
while i < 3  #while TRUE exectues loop til false.
	puts i
	i +=1
end

#until loops ( the inverse of the while true that is 
# block of code is exectued until evaluated as false)

until i == 0
	i-=0.5
	puts i
end



