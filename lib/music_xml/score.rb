require "rexml/document"

module MusicXml
  class Score
    def to_xml
      body = [
        MusicXml::XML_DECLARATION,
        MusicXml::XML_DOCTYPE,
        xml(:score_partwise, nil, version: "3.0")
      ].join("")
      format_xml(body)
    end

    private

    def format_xml(xml)
      document = REXML::Document.new(xml)
      document.write(target="", 1)
      target.gsub(/"/, "'")
    end
  end
end
