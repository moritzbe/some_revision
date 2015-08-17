require "pry"



class Reader
	def initialize
		@sudoku
	end

	def get_sudoku
		@sudoku = IO.read("sudoku.txt")
	end

	def load
      	@board = Array.new
      	@sudoku.each_line do |line|
	        line.delete! '|+-'
	        line.tr! '_', '0'
	        line.squeeze!
	        line.strip!
	    	if line.length > 0
	          	l = line.split
	          	fail "Line length was #{l.length}" unless l.length == 9
	          	@board << l.collect {|x| x.to_i}
    		end
    	end
    	@board
	end

end



class Solver
	def initialize board
		@board = board
		@m = Array.new
	end

	def select i, j
		puts @board[i][j]
		@number = @board[i][j]
		@i = i
		@j = j
	end
	
	def check_line
		@board[@i].each { |item| @m << item }
	end

	def check_row
		9.times { |i| @m << @board[i-1][@j] }
		#puts @m
	end

	def select_box axis, a
		if axis <= 2
			a = [0, 1, 2]
		elsif axis >= 3 && axis <= 5
			a = [3, 4, 5]
		elsif axis >= 5
			a = [6, 7, 8]
		end
		return a
	end

	def check_box
		vx = select_box(@i, vx)
		vy = select_box(@j, vy)
		vx.each do |horz_item|
			vy.each do |vert_item|
				@m << @board[horz_item][vert_item]
			end
		end
		puts @m
	end
 	


	def check_fit
		if @number==0
			check_line
			check_row
			check_box

		end
	end



end





class Printer
	def initialize board
		@board = board
	end

	def result 
		9.times do |i|
  		print @board[i] 
		end
	end
end


sudoku = Reader.new
sudoku.get_sudoku

solve = Solver.new(sudoku.load)
solve.select(0,0)
solve.check_fit


#binding.pry
resume = Printer.new(sudoku.load)
#resume.result




