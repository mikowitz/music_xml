require "spec_helper"

describe MusicXml::Score do
  describe "an empty score" do
    let(:score) { Score.new }

    it "should write only the barebones of a musicXML file" do
      expect(Score.new.to_xml).to eq fixture_file("empty_score")
    end
  end
end
