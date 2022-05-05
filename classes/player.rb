class Player
  attr_reader :name, :symbol, :logs, :winner

  def initialize (name, symbol)
    @name = name
    @symbol = symbol

    @logs = []
    @winner = false
  end

  def make_move (posibilities)
    @logs.push(*posibilities)
    @winner = is_winner?
  end

  private

  def is_winner?
    @logs.any? do |log|
      @logs.count(log) == 3
    end
  end
end