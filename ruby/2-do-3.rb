puts "Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. You will need to do a "
puts "simple regular expression match and read lines from a file. (This is surprisingly simple in Ruby.) If you want, include line numbers."

filename = ARGV.shift
term = Regexp.new ARGV.join " "

File.open(filename) do |file|
	num = 0
	file.each_line do |line|
		num += 1
		puts "LINE " + num.to_s + " MATCH:" + line if line.match term
	end
end
