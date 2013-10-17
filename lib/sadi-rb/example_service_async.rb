class ExampleServiceAsync
  extend SADI::AsynchronousService
  class << self
    def service_name
      "hello_async"
    end

    def service_description
      str = <<-EOS
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

<http://sadiframework.org/examples/hello> a <http://www.mygrid.org.uk/mygrid-moby-service#serviceDescription>;
      rdfs:label "Hello, world"^^xsd:string;
      <http://www.mygrid.org.uk/mygrid-moby-service#hasOperation> [ a <http://www.mygrid.org.uk/mygrid-moby-service#operation>;
            <http://www.mygrid.org.uk/mygrid-moby-service#hasUnitTest> [ a <http://www.mygrid.org.uk/mygrid-moby-service#unitTest>;
            <http://www.mygrid.org.uk/mygrid-moby-service#exampleInput> <http://sadiframework.org/examples/t/hello.input.1.rdf>;
            <http://www.mygrid.org.uk/mygrid-moby-service#exampleOutput> <http://sadiframework.org/examples/t/hello.output.1.rdf>];
            <http://www.mygrid.org.uk/mygrid-moby-service#inputParameter> [ a <http://www.mygrid.org.uk/mygrid-moby-service#parameter>;
            <http://www.mygrid.org.uk/mygrid-moby-service#objectType> <http://sadiframework.org/examples/hello.owl#NamedIndividual>];
            <http://www.mygrid.org.uk/mygrid-moby-service#outputParameter> [ a <http://www.mygrid.org.uk/mygrid-moby-service#parameter>;
            <http://www.mygrid.org.uk/mygrid-moby-service#objectType> <http://sadiframework.org/examples/hello.owl#GreetedIndividual>]];
      <http://www.mygrid.org.uk/mygrid-moby-service#hasServiceDescriptionText> "A simple \"Hello, World\" service that reads a name and attaches a greeting."^^xsd:string;
      <http://www.mygrid.org.uk/mygrid-moby-service#hasServiceNameText> "Hello, world"^^xsd:string;
      <http://www.mygrid.org.uk/mygrid-moby-service#providedBy> [ a <http://www.mygrid.org.uk/mygrid-moby-service#organisation>;
            <http://protege.stanford.edu/plugins/owl/dc/protege-dc.owl#creator> "info@sadiframework.org"^^xsd:string;
            <http://www.mygrid.org.uk/mygrid-moby-service#authoritative> true];
      rdfs:comment "A simple \"Hello, World\" service that reads a name and attaches a greeting."^^xsd:string .
      EOS

      parse_string(str, :ttl)
    end

    def service_owl
      str = <<-EOS
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

<> a owl:Ontology .

<#GreetedIndividual> a owl:Class;
      owl:equivalentClass [ a owl:Restriction;
            owl:onProperty <#greeting>;
            owl:someValuesFrom xsd:string] .

<#NamedIndividual> a owl:Class;
      owl:equivalentClass [ a owl:Restriction;
            owl:minCardinality "1"^^xsd:int;
            owl:onProperty foaf:name] .

<#SecondaryParameters> a owl:Class;
      owl:equivalentClass [ a owl:Restriction;
            owl:minCardinality "1"^^xsd:int;
            owl:onProperty <#lang>] .

<#greeting> a owl:DatatypeProperty .

<#lang> a owl:DatatypeProperty .

foaf:name a owl:DatatypeProperty;
      rdfs:isDefinedBy foaf:index.rdf .
      EOS

      parse_string(str, :ttl)
    end

    def owl_prefix
      "http://sadiframework.org/examples/hello.owl#"
    end

    def process_object(in_graph, object)
      out_graph = RDF::Graph.new

      name = RDF::Query.execute(in_graph) do
        pattern [object, RDF::FOAF.name, :name]
      end
      name = name.first.name

      owl_vocab = RDF::Vocabulary.new(owl_prefix)

      out_graph << RDF::Statement.new(object, RDF.type, output_classes.first)
      out_graph << RDF::Statement.new(object, owl_vocab.greeting, "Hello, #{name}!")

      out_graph
    end
  end
end