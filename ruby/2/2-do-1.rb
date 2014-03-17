puts "Print the contents of an array of sixteen numbers, four numbers at a time, using just each."

arr = (0..15).to_a
(0..(arr.length/4)).each {|i| puts arr[i, i+4].join " "}


puts "Now, do the same with each_slice in Enumerable."
arr = (0..15).to_a
arr.each_slice(4) {|s| puts s.join " "}
