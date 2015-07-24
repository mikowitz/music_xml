require "spec_helper"

describe Key do
  describe "fifths" do
    it "should return the correct number of fifths in the given key signature" do
      expect(Key.new(:C, :major).fifths).to eq 0
      expect(Key.new(:F, :major).fifths).to eq -1
      expect(Key.new(:D, :major).fifths).to eq 2
      expect(Key.new(:C, :minor).fifths).to eq -3
      expect(Key.new(:C.sharp, :major).fifths).to eq 7
      expect(Key.new(:B.flat, :major).fifths).to eq -2
    end

    it "should return the correct number of fifths with a compound entry" do
      expect(Key.new(:C.major).fifths).to eq 0
      expect(Key.new(:C.sharp.major).fifths).to eq 7
    end
  end
end
