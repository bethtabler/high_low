# 1. Find a big idea
# 2. Break it into small ideas
# (This might look like a tree)

# 3. Find a small idea that doesn't get broken up further
# 4. Implement the small idea in code
# 5. Run it - IRB or `ruby` - and watch it work
# 6. Don't move on until you're sure the code works.
# 7. Next small idea
# class Deck

class Card

  attr_accessor :face, :suit

  def initialize(face, suit)
    @face = face
    @suit = suit
  end  
end

class Deck
  
  attr_accessor :cards

  def initialize
    create_cards
    shuffle
  end

  def create_cards
    @cards = []
    [:clubs, :diamonds, :spades, :hearts].each do |suit|
      13.times do |face|
        @cards << Card.new(face, suit)
      end
    end
    @cards
  end

  def shuffle
    @cards.shuffle!
  end

  def deal
    @cards.pop
  end
end

class Game

  def initialize
    @deck = Deck.new
    play
  end
 
  def play
    @current_card = @deck.deal
    display_card(@current_card)
    get_player_guess
    @comparison_card = @deck.deal
    display_card(@comparison_card)
    if win? 
      puts "Hooray!"
    else
      puts "boo!"
    end
  end

  def display_card(card)
    puts "#{card.face} of #{card.suit} is your card. Wahoo"
  end

  def get_player_guess
    puts "Is the next card [h]igher or [l]ower?"
    @guess = gets.chomp.downcase
  end

  def win?
    (@guess == "l" && @current_card.face >= @comparison_card.face) ||
    (@guess == "h" && @current_card.face <= @comaprison_card.face)
  end
end

Game.new
