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
    	return @board
	end

end





class Solver
	def initialize
		@m = Array.new
	end

	def select k, l, board
		@board = board
		@i = k
		@j = l
		@board[@i][@j]
		@number = @board[@i][@j]
	end

	def check_line
		@board[@i].each { |item| @m << item }
	end

	def check_row
		9.times { |k| @m << @board[k-1][@j] }
	end

	def select_box axis
		if axis <= 2
			a = [0, 1, 2]
		elsif axis.between?(3, 5)
			a = [3, 4, 5]
		elsif axis >= 5
			a = [6, 7, 8]
		end
		return a
	end

	def check_box
		vx = select_box(@i)
		vy = select_box(@j)
		vx.each do |horz_item|
			vy.each do |vert_item|
				@m << @board[horz_item][vert_item]
			end
		end
	end
 	
	def check_fit
		match = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		if @number==0
			check_line
			check_row
			check_box
			#binding.pry
			values = @m.grep(Integer).sort.uniq - [0]
			if values.length == 8
				#binding.pry
				finding = match - values
				@board[@i][@j] = finding[0]
			end
		end
		return @board
	end

	def solve
		sudoku = Reader.new
		sudoku.get_sudoku
		board = sudoku.load
		myboard = board

		20.times do |i| 
			for k in 0..8
		   		for l in 0..8
		   			select(k, l, myboard)
					myboard = check_fit
				end
			end
		resume = Printer.new(myboard)
		resume.result
		end
	end


end


class Printer
	def initialize board
		@boards = board
	end

	def result 
		9.times do |i|
  		print @boards[i] 
		end
	end
end



sudoku_instance = Solver.new
sudoku_instance.solve







