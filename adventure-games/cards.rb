#https://edgdesign.co/blog/building-a-deck-of-cards-with-ruby

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    # create the cards in our deck
  end

  def draw
    @cards.pop
  end

  def shuffle!
    @cards.shuffle!
  end

  def sort!
    @cards.sort!
  end
end
