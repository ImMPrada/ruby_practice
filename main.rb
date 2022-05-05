require './classes/game.rb'
require './classes/player.rb'

player1 = Player.new('Tato', 'X')
player2 = Player.new('Toto', 'O')
game = Game.new('The big game', player1, player2)

puts("\n Welcome to the game: #{game.game_name}\n The players: #{game.players[0].name} (#{game.players[0].symbol}) Vs. #{game.players[1].name} (#{game.players[1].symbol})\n")
puts("Turn of: #{game.players[game.turn_of].name}\n")
puts("#{game.table}\n")

game.start_game

