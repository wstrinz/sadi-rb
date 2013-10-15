module SADI
  module Converter
    def parse_string(string,format)
      unless format.is_a? Symbol
        format = RDF::Format.find{|f| f.content_type.find{|type| type[format]}}
        raise "Unknown input format #{mime_type}" unless format
        format = format.to_sym
      end

      RDF::Graph.new << RDF::Reader.for(format).new(string)
    end
  end
end