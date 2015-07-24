module MusicXml
  class Clef
    RECOGNIZED_CLEFS = [:C, :F, :G]
    RECOGNIZED_CLEF_NAMES = {
      treble: [:G, 2],
      alto: [:C, 3],
      tenor: [:C, 4],
      bass: [:F, 4]
    }

    attr_reader :sign, :line

    def initialize(clef_name, line_number=nil)
      @clef_name = clef_name.to_sym
      @line_number = line_number
      assign_sign_and_line
    end

    def to_xml
      xml(:clef, xml(:sign, sign) + xml(:line, line))
    end

    private

    def assign_sign_and_line
      case @clef_name
      when *RECOGNIZED_CLEFS
        @sign, @line = @clef_name, @line_number
      when *RECOGNIZED_CLEF_NAMES.keys
        assign_from_clef_name
      else
        assign_from_clef_name(:treble)
      end
    end

    def assign_from_clef_name(clef_name=@clef_name)
      @sign, @line = RECOGNIZED_CLEF_NAMES[clef_name]
    end
  end
end
