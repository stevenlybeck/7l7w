# Find out how to access files with and without code blocks. What is the benefit of the code block?
	# Answer: Code-blok method allows you to process contents inline?
def access_file(filename)
	contents = File.read(filename)

	puts "Unprocessed: " + contents

	processed_contents = File.open(filename) do |file|
		# do processing and return processed file contents here
		return file.read.replace "a" "zzz"
	end

	puts "Processed: " + contents
end


# How would you translate a hash to an array? Can you translate arrays to hashes?

# hash to array
hash = {0=>0, :zero=>0, 'zero'=>0}
arr = hash.to_a

# array to hash
arr = ["zero", "one", "two"]
hash = {}
arr.each_with_index do |item, index|
	hash[index] = item
end
# is it possible with a one-liner?


# Can you iterate through a hash?

# Yes - but it iterates index, value, index, value - odd
hash.each {|e| puts e}


# You can use Ruby arrays as stacks. What other common data structures do arrays support?
arr = [0, 1, 2]

# Stack
arr.push 3
arr.pop
arr.unshift -1
arr.shift

# What are other common data structures? I dunno.


