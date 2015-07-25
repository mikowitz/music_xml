module MusicXml
  class Measure
    def initialize(number=1, &block)
      @number = number
      @notes = []
      self.instance_eval(&block) if block_given?
    end

    def to_xml
      xml(:measure, attributes_xml + notes_xml, number: @number)
    end

    private

    def attributes_xml
      return "" unless @has_attributes
      xml(:attributes, divisions_xml + key_xml + time_xml + clef_xml)
    end

    def divisions_xml
      return "" unless @divisions
      xml(:divisions, @divisions)
    end

    def key_xml
      return "" unless @key
      @key.to_xml
    end

    def time_xml
      return "" unless @time
      @time.to_xml
    end

    def clef_xml
      return "" unless @clef
      @clef.to_xml
    end

    def notes_xml
      return "" if @notes.empty?
      @notes.map(&:to_xml).join("")
    end

    def attributes(&block)
      @has_attributes = true
      self.instance_eval(&block) if block_given?
    end

    def divisions(divisions)
      @divisions = divisions
    end

    def key(*key)
      @key = Key.new(*key)
    end

    def time(*time)
      @time = TimeSignature.new(*time)
    end

    def clef(*clef)
      @clef = Clef.new(*clef)
    end

    [:C, :D].each do |pitch_class|
      define_method(pitch_class.downcase) do |octave, duration|
        @notes << Note.new(duration: duration, pitches: [Pitch.new(pitch_class, octave)])
      end
    end
  end
end
