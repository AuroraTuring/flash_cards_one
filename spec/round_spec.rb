require "pry"
require "rspec"
require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"


RSpec.describe Round do
  it "returns objects of the expected class" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    rounds_deck = round.deck

    expect(round).to be_instance_of(Round)
    expect(rounds_deck).to be_instance_of(Deck)
    expect(round.current_card).to be_instance_of(Card)
  end

  it "shows no turns have been taken" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    
    expect(round.turns).to eq([])
  end

  it "takes a new turn" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(new_turn).to be_instance_of(Turn)
    expect(new_turn.correct?).to be(true)
    expect(round.turns.count).to eq(1)
  end

  it "takes rounds" do 
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(round.turns).to eq()
    expect(round.number_correct).to eq(1)
    expect(round.current_card).to eq()
    expect(round.take_turn("Venus")).to eq()
    expect(round.turns.count).to eq(2)
    expect(round.turns.last.feedback).to eq("Incorrect.")
    expect(round.number_correct).to eq(1)
    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
    expect(round.percent_correct).to eq(50.0)
    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(round.current_card).to eq()
  end

end


pry(main)> round.turns
#=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]

pry(main)> round.current_card
#=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>

pry(main)> round.take_turn("Venus")
#=> #<Turn:0x00007f972a215b38...>

pry(main)> round.current_card
#=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>

