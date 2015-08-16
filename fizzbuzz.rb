class Intake
	def initialize number
		@number = number.to_i
	end

	def fizzer
		if @number % 3 == 0
			print "fizz"
		end
	end

	def buzzer
		if @number % 5 == 0
			print "buzz"
		end
	end
end



puts "Enter a number"
a = gets.chomp
class_instance = Intake.new(a)

puts "Thanks, my answer is class_instance.fizzer
class_instance.buzzer
