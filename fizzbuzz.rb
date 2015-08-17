class Intake
	def fizzer var
		number = var
		if number % 3 == 0
			print "fizz"
		end
	end

	def buzzer
		if number % 5 == 0
			print "buzz"
		end
	end
end



puts "Enter a number"
class_instance = Intake.new
class_instance.fizzer(3)

