rnum = rand(10)
guess = -1
while guess != rnum
	if guess == -1
		puts "Guess a number from 0 to 9."
	else
		if guess < rnum
			str = "Too low."
		else
			str = "Too high."
		end

		puts str + " Guess again."
	end

	guess = gets.to_i
end

print "Well done!\n"
