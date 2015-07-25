module MusicXml
  class Note
    def initialize(options={})
      parse_options(options)
    end

    def to_xml
      if rest?
        rest_to_xml
      else
        note_to_xml
      end
    end

    def rest?
      @pitches.nil?
    end

    private

    def rest_to_xml
      xml(:note, xml(:rest, nil) + duration_xml)
    end

    def note_to_xml
      xml(:note, @pitches.map { |pitch| pitch.to_xml }.join("") + duration_xml)
    end

    def duration_xml
      xml(:duration, @duration)
    end

    def parse_options(options)
      @pitches = options[:pitches]
      @duration = options.fetch(:duration) { raise "Note must have a duration" }
    end
  end
end
