require "core_ext"
require "music_xml/clef"
require "music_xml/key"
require "music_xml/score"
require "music_xml/time_signature"
require "music_xml/version"

module MusicXml
  XML_DECLARATION = %|<?xml version='1.0' encoding='UTF-8' standalone='no'?>|
  XML_DOCTYPE = %|<!DOCTYPE score-partwise PUBLIC '-//Recordare//DTD MusicXML 3.0 Partwise//EN' 'http://www.musicxml.org/dtds/partwise.dtd'>|

  def xml(tag, contents, attributes={})
    attributes_string = build_attribute_string(attributes)
    tag = tag.dashify
    open_tag = "<#{tag}#{attributes_string}>"
    close_tag = "</#{tag}>"
    [open_tag, contents, close_tag].join("")
  end

  private

  def build_attribute_string(attributes)
    return "" if attributes.empty?
    " " + attributes.map { |(k, v)| %|#{k}='#{v}'| }.join(" ")
  end
end
