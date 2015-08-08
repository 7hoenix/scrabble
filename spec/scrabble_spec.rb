require './lib/scrabble'

describe Scrabble do
  describe "#score" do
    it "scores a single letter" do
      expect( Scrabble.new.score("A") ).to eq 1
      expect( Scrabble.new.score("F") ).to eq 4
    end

    it "scores a lower case letter" do
      expect( Scrabble.new.score("a")  ).to eq 1
      expect( Scrabble.new.score("f")  ).to eq 4
    end

    it "scores nil as 0" do
      expect( Scrabble.new.score(nil) ).to eq 0
    end

    it "scores an empty string as 0" do
      expect( Scrabble.new.score("") ).to eq 0
    end

    it "scores a word" do
      expect( Scrabble.new.score("hello") ).to eq 8
    end

    it "can handle special characters" do
      expect( Scrabble.new.score("$#@%^&*&*@#\#$A\nSDF") ).to eq 8
    end

    it "can handle a super long string" do
      expect( Scrabble.new.score("The rain in spain stays mainly in the" +
        "plains." ) ).to eq 54
    end

    it "can handle an array" do
      expect( Scrabble.new.score([]) ).to eq 0
    end

    it "can handle a blank hash" do
      expect( Scrabble.new.score({}) ).to eq 0
    end
  end
end
