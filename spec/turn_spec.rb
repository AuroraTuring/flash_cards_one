require "pry"
require "rspec"
require "./lib/card"
require "./lib/turn"

RSpec.describe Turn do
  it "exists" do
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Juneau", card)
   expect(turn).to be_instance_of(Turn)
  end

  it "makes a guess" do 
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.guess).to eq("Juneau")
  end 

  it "is correct" do 
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.correct?).to be(true)
  end

  it "gives feedback" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.feedback).to eq("Correct!")
  end


  it "guesses wrong" do 
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.guess).to eq("Saturn") 
    expect(turn.correct?).to eq(false)
    expect(turn.feedback).to eq("Incorrect.")
  end

end



pry(main)> round.turns
#=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]

pry(main)> round.number_correct
#=> 1

pry(main)> round.current_card
#=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>

pry(main)> round.take_turn("Venus")
#=> #<Turn:0x00007f972a215b38...>

pry(main)> round.turns.count
#=> 2

pry(main)> round.turns.last.feedback
#=> "Incorrect."

pry(main)> round.number_correct
#=> 1

pry(main)> round.number_correct_by_category(:Geography)
#=> 1

pry(main)> round.number_correct_by_category(:STEM)
#=> 0

pry(main)> round.percent_correct
#=> 50.0

pry(main)> round.percent_correct_by_category(:Geography)
#=> 100.0

pry(main)> round.current_card
#=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>