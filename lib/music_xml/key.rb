module MusicXml
  class Key
    NATURAL_MAJOR_MAPPING = {
      C: 0,
      D: 2,
      E: 4,
      F: -1,
      G: 1,
      A: 3,
      B: 5
    }

    attr_reader :key, :mode

    def initialize(key, mode=nil)
      if mode
        assign_key_and_mode(key, mode)
      else
        assign_key_and_mode(*key)
      end
    end

    def fifths
      base = NATURAL_MAJOR_MAPPING[key]
      base -= 3 if minor?
      base += 7 if sharp?
      base -= 7 if flat?
      base
    end

    private

    def assign_key_and_mode(key, mode)
      @key, @mode = parse_key(key), mode
    end

    def parse_key(key)
      key_pitch = key[0].to_sym
      case key[1]
      when "#" then @sharp = true
      when "b" then @flat = true
      end
      key_pitch
    end

    def minor?
      @mode == :minor
    end

    def sharp?
      @sharp
    end

    def flat?
      @flat
    end
  end
end
