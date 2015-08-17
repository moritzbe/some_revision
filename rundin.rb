require "pry"


class Reader
	def initalize
		@list
	end
	def read
		@list = IO.read("rundin.txt")
	end
end

class Processor
	def initialize (list)
		@list = list
		@teams = Array.new
	end

	def remove_line
		@list = @list.split("\n")[1..-1].join("\n")
	end

	def process_list
		remove_line
		container = []
		@list = @list.each_line do |line|
			line.gsub! /\n/, ''
			line.gsub! /\t/, ' '
			container = line.split(' ')
	     	@teams << container
	     	binding.pry
		end	
		puts @list
		puts @teams
	end
end


list = Reader.new


process = Processor.new(list.read)
process.process_list


