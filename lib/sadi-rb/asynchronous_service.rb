module SADI
  module AsynchronousService
    include SADI::Converter
    include SADI::BaseService

    def self.included(base)
      @classes ||= []
      @classes << base
    end

    def self.extended(base)
      @classes ||= []
      @classes << base
    end

    def self.classes
      @classes
    end

    def process_input(input, format)
      gr = RDF::Graph.new
      in_graph = parse_string(input,format)
      input_objects(in_graph).each do |obj|
        gr << process_object(in_graph, obj)
      end

      gr
    end

    def poll(task_id)
    end
  end
end