class Player
  attr_reader :name, :symbol, :log, :winner

  def initialize (name, symbol)
    @name = name
    @symbol = symbol

    @log = []
    @winner = false
  end

  def make_move (posibilities)
    @log.push(*posibilities)
    @winner = am_i_a_winner
  end

  private

  def am_i_a_winner
    @log.each do |position|
      return true if @log.count(position) == 3
    end

    false
  end
end