require "colorize"
puts""
puts "--------------------------------------------------------------------------------------------------------------------".yellow
puts "Welcome to 4 link, please pay attetion to the rules and read them carefully, 
enjoy the game".yellow
puts ""
puts "The rules are simple, you will see a 6 x 6 empty board, agree with your partner who is going to play first. 
On  the top of the board you will see the numbers from 1 to 6, those numbers belongs to the column that you want to 
play, once you have agreed with your partner who is going first, choose a column, you will see that your token will 
be placed on the bot of the column that you chose, then is the turn of your partner, if  your  partner  choose  the 
same column that you chose before, his token will be placed on the top of your token, if the column is empty or has 
one of your token, the behavior will be the same. Once one of both players get 4 tokens in  horizontal, vertical or 
diagonally, that player will win the game ".yellow	
puts "--------------------------------------------------------------------------------------------------------------------".yellow
puts""

#Procedure to create a 6 x 6 matrix with empty spaces

	def initMatrix(a)
		for i in 0..5
		column = []
		a[i] = column
			for j in 0..5
			column[j] = " "
			end
		end
	return a	
	end

#Procedure to paint the matrix

	def paintMatrix(a)
	
	puts "   |   1   |   2   |   3   |   4   |   5   |   6".green
	puts ""
	for i in 0..5
		if ( i != 0 )
		puts " "
		end
		for j in 0..5
				print "   |   ".blue
				print "#{a[i][j]}"
		end
		puts ""
	end
	puts""
	end




#Procedure that checks the matrix, horizontal, vertical and diagonally 
#If there is a winner, returns a true value and the game ends

def checker(a,player)
counter = 0
i = 5
controller = 0
player = player

while (i >= 0  && counter != 4)
j = 0
	while ( j <= 5 && counter != 4)
		control = 1
		storer = j 
		storer2 = i
		counter = 0

		while(a[storer2][storer] != " " && counter != 4 && control != 0)	
			if (a[storer2][storer+1] != nil && a[storer2][storer] == player && storer <= 5)
			counter = counter + 1
			storer = storer + 1
			else
			counter = 1
			control = 0
			end
		end
			if (counter == 4)
			return true
			end

		storer = j
		storer2 = i
		control = 1
		counter = 0

		while(a[storer2][storer] != " " && counter != 4 && control != 0)
			if(a[storer2-1][storer+1] != nil && player == a[storer2][storer] && storer <= 5 && storer2 >=0)
			counter = counter + 1
			storer2 = storer2 - 1
			storer = storer + 1
			else
			counter = 1
			control = 0
			end
		end
			if (counter == 4)			
			return true
			end


		storer = j
		storer2 = i
		control = 1
		counter = 0

		while(a[storer2][storer] != " " && counter != 4 && control != 0)
			if(a[storer2-1][storer] != nil && a[storer2][storer] == player && storer2 >= 0)
			counter = counter + 1
			storer2 = storer2 - 1
			else
			counter = 1
			control = 0
			end

		end
			if (counter == 4)
			return true
			end

		storer = j
		storer2 = i
		control = 1
		counter = 0

		while(a[storer2][storer] != " " && counter != 4 && control != 0)
			if(a[storer2-1][storer-1] != nil && a[storer2][storer] == player && storer2 >= 0 && storer >=0)
			counter = counter + 1			
			storer2 = storer2 - 1
			storer = storer - 1
			else			
			counter = 1
			control = 0
			end
		end

			if (counter == 4)
			return true
			end

	j = j +1
	end
i = i - 1
end
end


#Procedure to pick the column, check if the move is valid and insert the number in the column selected
#It sends a Warning Message if the value inserted is out of the limits

	def insertNumber(a,player)
	reader = player
	valid2 = false

		while (!valid2)
		i = 5	
		valid = false
		valid3 = false

                while (!valid3)	
		print "Player #{player} is your turn, choose a column: ".magenta
		column = gets.chomp.to_i	
		puts ""
		if (column > 0 && column < 7)
		column = column - 1
		valid3 = true
		else
		puts "Wrong value, please insert a valid value".yellow
		puts""		
		end
		end
			if (column >= 0 && column <=5)
					while (!valid)
						if(a[i][column] == " ") 
						a[i][column] = reader
						valid = true
						valid2 = true
						else
						i = i - 1
							if (i < 0)
							puts "The column is full, please choose another column".yellow
							puts""
							valid = true
							end
						end
					end
		
			
			end
		end
	return a
	end 

#Function to see which player is going to play and invokes the procedure "Checker" to see if there is a winner or if the game is tie
#Also says which player wins 

def playerTurn(a)
 
initMatrix (a)
paintMatrix (a)
player = 1
stop = false
counterTie = 0
	
	while (!stop)
			counterTie = counterTie + 1
			insertNumber(a,player)
			paintMatrix(a)

			if(player == 1)
				if(checker(a, player))
				puts "Player #{player} wins".yellow
				puts""
				stop = true
				end
				player = player + 1
			else
				if(checker(a, player))
				puts "Player #{player} wins".yellow
				puts""
				stop = true
				end
				player = player - 1
			end
				if(counterTie == a.length**2)
				stop = true
				puts "TIE".yellow
				puts""
				end
	end 
end 


array = []
playerTurn(array)
