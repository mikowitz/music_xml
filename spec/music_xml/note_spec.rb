require "spec_helper"

describe Note do
  describe "to_xml" do
    describe "for a pitch" do
      let(:note) { Note.new(pitches: [Pitch.new(:C, 4)], duration: 4) }

      it "should return a correct XML representation" do
        expect(note.to_xml).to eq "<note><pitch><step>C</step><octave>4</octave></pitch><duration>4</duration></note>"
      end
    end

    describe "for a rest" do
      let(:note) { Note.new(duration: 4) }

      it "should return a correct XML representation" do
        expect(note.to_xml).to eq "<note><rest/><duration>4</duration></note>"
      end
    end
  end
end
