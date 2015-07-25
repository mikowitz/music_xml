require "spec_helper"

describe Score do
  describe "an empty score" do
    let(:score) { Score.new }

    it "should write only the barebones of a musicXML file" do
      confirm_score("empty_score")
    end
  end

  describe "a very basic score" do
    let(:score) do
      Score.new do
        part do
          measure do
            attributes do
              divisions 1
              key :C.major
              time 4, 4
              clef :treble
            end
            c(4, 4)
          end
        end
      end
    end

    it "should write a very basic musicXML file" do
      confirm_score("basic_score")
    end
  end

  def confirm_score(fixture_file_name)
    expect(score.to_xml).to eq fixture_file(fixture_file_name)
  end
end
