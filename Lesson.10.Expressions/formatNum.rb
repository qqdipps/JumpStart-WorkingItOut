score = 78.5431
puts "The average is %0.2f" % [score]


num = gets.chomp
if num.to_f.to_s ==  num #yes i get it, was puzzled but now I get it! when converted to float letters get dropped or set to 0 so when its turned back to string and compared to orginal it will be different if letters are there.
	print num
else
	puts "not"
end
