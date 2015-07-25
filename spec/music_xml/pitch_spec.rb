require "spec_helper"

describe Pitch do
  describe "to_xml" do
    it "should return a valid XML representation for a pitch instantiated normally" do
      expect(Pitch.new(:C, 4).to_xml).to eq "<pitch><step>C</step><octave>4</octave></pitch>"
      expect(Pitch.new(:F.sharp, 3).to_xml).to eq "<pitch><step>F</step><alter>1</alter><octave>3</octave></pitch>"
      expect(Pitch.new(:E.flat, 5).to_xml).to eq "<pitch><step>E</step><alter>-1</alter><octave>5</octave></pitch>"
    end
  end
end
