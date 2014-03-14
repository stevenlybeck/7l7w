timeszero = 0
timesten = 0
10000.times do
	num = rand(10)
	if num == 0
		puts "Num is 0"
		timeszero = timeszero + 1
	elsif num == 10
		puts "Num is 10"
		timesten = timesten + 1
	end
end
puts "Times zero #{timeszero}"
puts "Times ten #{timesten}"
