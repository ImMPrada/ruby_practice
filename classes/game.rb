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

    @turn_of = random_initial_turn_of
    @table = set_table
  end

  def start_game
    i=0

    while i<9 do
      i+=1
      choice_of_player
    end
  end

  
  private

  def set_table
    table = ''

    @game_set.each_with_index do |value, index|
      table += value if [0, 3, 6].include?(index)
      table += '|' + value + '|' if [1, 4, 7].include?(index)
      table += value + "\n" if [2, 5, 8].include?(index)
    end

    puts(table)
    table
  end
  
  def change_turn
    return @turn_of = 0 if @turn_of == 1
    return @turn_of = 1
  end

  def random_initial_turn_of
    rand(0..1)
  end
  
  def find_posibilities(position)
    index_of_posibilities = []
    @victory_combinations.each_with_index { |value, index| index_of_posibilities.push(index) if value.include?(position) }
    
    puts("MWH: #{index_of_posibilities}")
    index_of_posibilities
  end

  def choice_of_player
    puts("\nWhat position do you want? #{players[@turn_of].name}")
    position = gets.to_i

    choice_of_player if verification_of_choice(position) == false
  end

  def verification_of_choice(position)
    if @game_set[position] == '_'
      @game_set[position] = players[@turn_of].symbol
      players[@turn_of].make_move(find_posibilities(position))
      @table = set_table
      
      change_turn
      return true
    end
      
    puts('You select an ocupedd slot')
    return false
  end

  def there_is_a_winner
    puts("WINS!")
  end
end