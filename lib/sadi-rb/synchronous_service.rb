module SADI
  module SynchronousService
    include SADI::Converter

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

    def input_objects(graph)
      cl = input_classes.first
      solutions = RDF::Query.execute(graph) do
        pattern [:obj, RDF.type, cl]
      end

      solutions.map(&:obj)
    end

    def input_classes
      moby = RDF::Vocabulary.new('http://www.mygrid.org.uk/mygrid-moby-service#')

      solutions = RDF::Query.execute(service_description) do
        pattern [nil, moby.inputParameter, :param]
        pattern [:param, moby.objectType, :in_class]
      end

      solutions.map(&:in_class)
    end

    def output_classes
      moby = RDF::Vocabulary.new('http://www.mygrid.org.uk/mygrid-moby-service#')

      solutions = RDF::Query.execute(service_description) do
        pattern [nil, moby.outputParameter, :param]
        pattern [:param, moby.objectType, :out_class]
      end

      solutions.map(&:out_class)
    end

    def service_description(service)
      raise "Must implement a #service_description method returning an RDF::Graph or Repository"
    end

    def service_owl(service)
      raise "Must implement a #service_owl method returning an RDF::Graph or Repository"
    end

    def process_object(owl_graph, object)
      raise "Must implement a #process_input that takes an RDF::Graph or Repository as input and returns a new one"
    end

    def service_name
      raise "Must define a service name"
    end
  end
end