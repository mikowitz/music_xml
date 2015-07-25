require "spec_helper"

describe Part do
  describe "a basic part" do
    let(:part) do
      Part.new("P1") do
        measure do
          attributes do
            divisions 1
            key :C, :major
            time 4, 4
            clef :G, 2
          end
          c(4, 4)
        end
        measure do
          d(4, 4)
        end
      end
    end

    it "should return a correct XML representation of the part" do
      expect(part.to_xml).to eq fixture_file("basic_part")
    end
  end
end
