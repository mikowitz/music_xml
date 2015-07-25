require "spec_helper"

describe Measure do
  shared_examples_for "a measure" do |fixture_file_name|
    it "should return a valid XML representation" do
      expect(measure.to_xml).to eq fixture_file(fixture_file_name)
    end
  end

  describe "to_xml" do
    describe "with an attributes block" do
      let(:measure) do
        Measure.new do
          attributes do
            divisions 1
            key :C.major
            time 4, 4
            clef :treble
          end
          c(4, 4)
        end
      end

      it_behaves_like "a measure", "measure_with_attributes"
    end

    describe "without an attributes block" do
      let(:measure) do
        Measure.new do
          c(4, 4)
        end
      end

      it_behaves_like "a measure", "measure_without_attributes"
    end
  end
end
