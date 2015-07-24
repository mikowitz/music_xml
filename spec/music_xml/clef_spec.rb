require "spec_helper"

describe Clef do
  describe "to_xml" do
    it "returns correct XML for a full clef definition" do
      expect(Clef.new(:G, 2).to_xml).to eq "<clef><sign>G</sign><line>2</line></clef>"
      expect(Clef.new(:C, 3).to_xml).to eq "<clef><sign>C</sign><line>3</line></clef>"
      expect(Clef.new(:F, 4).to_xml).to eq "<clef><sign>F</sign><line>4</line></clef>"
    end

    it "returns correct XML for clef names" do
      expect(Clef.new(:treble).to_xml).to eq "<clef><sign>G</sign><line>2</line></clef>"
      expect(Clef.new(:alto).to_xml).to eq "<clef><sign>C</sign><line>3</line></clef>"
      expect(Clef.new(:bass).to_xml).to eq "<clef><sign>F</sign><line>4</line></clef>"
    end

    it "returns a treble clef for an unknown clef name" do
      expect(Clef.new(:trouble).to_xml).to eq "<clef><sign>G</sign><line>2</line></clef>"
      expect(Clef.new(:X, 3).to_xml).to eq "<clef><sign>G</sign><line>2</line></clef>"
    end
  end
end
