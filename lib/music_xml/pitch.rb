module MusicXml
  class Pitch
    def initialize(pitch_class, octave)
      @pitch_name, @octave = parse_pitch_class(pitch_class), octave
    end

    def to_xml
      xml(:pitch, step_xml + alter_xml + octave_xml)
    end

    private

    def step_xml
      xml(:step, @pitch_name)
    end

    def alter_xml
      return "" if natural?
      xml(:alter, alter)
    end

    def alter
      return -1 if @flat
      1
    end

    def octave_xml
      xml(:octave, @octave)
    end

    def natural?
      !(@sharp || @flat)
    end

    def sharp?
      @sharp
    end

    def flat?
      @flat
    end

    def parse_pitch_class(pitch_class)
      case pitch_class[1]
      when "#" then @sharp = true
      when "b" then @flat = true
      end
      pitch_class[0].to_sym
    end
  end
end
