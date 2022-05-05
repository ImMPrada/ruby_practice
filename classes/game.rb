class Game
  attr_reader :game_name, :player1, :player2, :players, :turn_of, :table

  def initialize (game_name, player1, player2)
    @game_name = game_name
    @player1 = player1
    @player2 = player2
    @players = [player1, player2]

    @game_set = ['_', '_', '_', '_', '_', '_', '_', '_', '_']
    @victory_combinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ]
    @game_ended = false

    @turn_of = choose_initial_turn
    @table = set_table
  end

  def start_game
 
    (0...9).each do |i|
      print_table
      break if @game_ended
      require_for_move
    end

    print_game_result
  end

  
  private

  def set_table
    table = ''

    @game_set.each_with_index do |value, index|
      table += value if [0, 3, 6].include?(index)
      table += '|' + value + '|' if [1, 4, 7].include?(index)
      table += value + "\n" if [2, 5, 8].include?(index)
    end

    table
  end
  
  def change_turn
    return @turn_of = 0 if @turn_of == 1
    return @turn_of = 1
  end

  def choose_initial_turn
    rand(0..1)
  end
  
  def find_posibilities(position)
    index_of_posibilities = []
    @victory_combinations.each_with_index { |value, index| index_of_posibilities.push(index) if value.include?(position) }
    
    index_of_posibilities
  end

  def require_for_move
    puts("\n#{players[@turn_of].name} what's your move?")
    position = gets.to_i

    require_for_move if verify_choice(position) == false
  end

  def verify_choice(position)
    if @game_set[position] != '_'
      puts 'You select an ocupedd slot'
      return false
    end

    @game_set[position] = players[@turn_of].symbol
    players[@turn_of].make_move(find_posibilities(position))
    @table = set_table
    
    @game_ended = check_winner?
    @winner = [players[@turn_of].name, players[@turn_of].symbol] if @game_ended
    change_turn
    true
  end

  def check_winner?
    players[@turn_of].winner
  end

  def print_table
    puts(@table)
  end

  def  print_game_result
    return puts("\nThere is a winner!!!!!\nCongrats #{@winner[0]} -- (#{@winner[1]})") if @game_ended
    puts('Game is over, no winner :(') 
  end
end