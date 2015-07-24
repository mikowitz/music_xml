require "spec_helper"

describe TimeSignature do
  describe "to_xml" do
    it "should return a correct XML representation of a basic time signature" do
      expect(TimeSignature.new(4, 4).to_xml).to eq "<time><beats>4</beats><beat-type>4</beat-type></time>" 
      expect(TimeSignature.new(3, 8).to_xml).to eq "<time><beats>3</beats><beat-type>8</beat-type></time>" 
    end

    it "should return a correct XML representation of a named time signature" do
      expect(TimeSignature.new(:common).to_xml).to eq "<time symbol='common'><beats>4</beats><beat-type>4</beat-type></time>" 
      expect(TimeSignature.new(:cut).to_xml).to eq "<time symbol='cut'><beats>2</beats><beat-type>2</beat-type></time>" 
    end
  end
end
