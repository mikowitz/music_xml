module MusicXml
  class Score
    def to_xml
      [
        MusicXml::XML_VERSION,
        MusicXml::XML_DOCTYPE,
        xml(:score_partwise, nil, version: "3.0")
      ].join("\n")
    end
  end
end
