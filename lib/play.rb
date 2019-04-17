# Helper Methods
def display_board(board)
  to_cell = Proc.new {|row| row.map {|cell| " #{cell} "}.join("|")}
  board.each_slice(3)
  .map(&to_cell)
  .zip(Array.new(2).fill("-" * 11))
  .each {|row| puts row}
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
  count_plays = Proc.new {|cell| cell == "O" || cell == "X"}
  while board.filter(&count_plays).length < 9 do
    turn(board)
  end
end