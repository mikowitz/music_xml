module MusicXml
  class TimeSignature
    NAMED_TIME_SIGNATURES = {
      common: [4, 4],
      cut: [2, 2]
    }

    def initialize(beats_or_name, beat_type=nil)
      if beat_type
        assign_beats_and_type(beats_or_name, beat_type)
      else
        @name = beats_or_name
        assign_beats_and_type(*NAMED_TIME_SIGNATURES[beats_or_name])
      end
    end

    def to_xml
      attributes = !!@name ? { symbol: @name } : {}
      xml(:time, xml(:beats, @beats) + xml(:beat_type, @type), attributes)
    end

    private

    def assign_beats_and_type(beats, type)
      @beats, @type = beats, type
    end
  end
end
