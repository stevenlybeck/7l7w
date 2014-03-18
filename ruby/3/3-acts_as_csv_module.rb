#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    #Note: attr_accessor is a macro (ruby community term) which adds get and put methods for these variables
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end
end

# Rather than modifying the code, we can just re-open the modules and classes contained therein
module ActsAsCsv
  class CsvRow
    attr_accessor :headers, :row

    def method_missing name, *args
      idx = headers.index name.to_s
      if idx != nil
        row[idx]
      else
        super
      end
    end

    def initialize(headers, row)
      @headers = headers
      @row = row
    end
  end

  module InstanceMethods
    def each(&block)
      @csv_contents.each{|row| block.call CsvRow.new @headers, row }
    end
  end
end

  

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

# Test out the new 'each' method for an object that acts as a csv
m.each do |row|
  puts "Two:" + row.two
  puts "Four:" + row.four
  #puts "Six:" + row.six
end