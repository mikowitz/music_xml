require "rexml/document"

module MusicXml
  class Score

    def initialize(&block)
      @parts = []
      self.instance_eval(&block) if block_given?
    end

    def to_xml
      body = [
        MusicXml::XML_DECLARATION,
        MusicXml::XML_DOCTYPE,
        xml(:score_partwise, part_list_xml + parts_xml, version: "3.0")
      ].join("")
      format_xml(body)
    end

    private

    def part(id=nil, &block)
      id ||= "P#{@parts.size + 1}"
      @parts << Part.new(id, &block)
    end

    def part_list_xml
      return "" if @parts.empty?
      xml(:part_list, score_parts_xml)
    end

    def score_parts_xml
      @parts.map { |part| score_part_xml(part) }.join("")
    end

    def score_part_xml(part)
      xml(:score_part, xml(:part_name, part.id), id: part.id)
    end

    def parts_xml
      return "" if @parts.empty?
      @parts.map(&:to_xml).join("")
    end

    def format_xml(xml)
      document = REXML::Document.new(xml)
      formatter = REXML::Formatters::Pretty.new
      formatter.compact = true
      formatter.write(document, target="")
      target.gsub(/"/, "'")
    end
  end
end
