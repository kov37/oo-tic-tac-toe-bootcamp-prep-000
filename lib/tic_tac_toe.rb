class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def display_board(board)
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1 
  end
  
  def move(index, piece)
    @board[index] = piece
  end
  
  def position_taken(index)
    @board[index] == " " || @board[index] == "" || @board[index] == nil ? false : true 
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken(index) ? true : false
  end
  
  def turn_count
    counter = 0 
    @board.each do |piece|
      if piece == 'X' || piece == 'O'
        counter += 1 
      end
    end
    counter
  end
  
  def turn
    puts "Please enter 1-9:"
    position = gets.strip.chomp
    index = input_to_index(position)
    if valid_move?(index)
      piece = current_player
      move(index, piece)
      display_board
    else
      turn
    end
    true
  end
  
  def current_player
    (turn_count % 2).even? ? 'X' : 'O'
  end
end