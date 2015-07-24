require "spec_helper"

describe Key do
  let(:c_major) { Key.new(:C, :major) }
  let(:c_minor) { Key.new(:C, :minor) }

  describe "fifths" do
    it "should return the correct number of fifths in the given key signature" do
      expect(c_major.fifths).to eq 0
      expect(Key.new(:F, :major).fifths).to eq -1
      expect(Key.new(:D, :major).fifths).to eq 2
      expect(c_minor.fifths).to eq -3
      expect(Key.new(:C.sharp, :major).fifths).to eq 7
      expect(Key.new(:B.flat, :major).fifths).to eq -2
    end

    it "should return the correct number of fifths with a compound entry" do
      expect(Key.new(:C.major).fifths).to eq 0
      expect(Key.new(:C.sharp.major).fifths).to eq 7
    end
  end

  describe "to_xml" do
    it "should return an XML representation of the key signature" do
      expect(c_major.to_xml).to eq "<key><fifths>0</fifths></key>"
      expect(c_minor.to_xml).to eq "<key><fifths>-3</fifths></key>"
    end
  end
end
