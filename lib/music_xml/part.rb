module MusicXml
  class Part
    attr_reader :id

    def initialize(id, &block)
      @id = id
      @measures = []
      self.instance_eval(&block) if block_given?
    end

    def to_xml
      xml(:part, measure_xml, id: @id)
    end

    def measure_xml
      @measures.map(&:to_xml).join("")
    end

    private

    def measure(&block)
      @measures << Measure.new(@measures.count + 1, &block)
    end
  end
end
