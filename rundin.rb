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
	end

	def process_list
		@list
		binding.pry
	end


list = Reader.new


process = Processor.new(list.read)
process.process_list


