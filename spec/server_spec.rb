ENV['RACK_ENV'] = 'test'

require_relative '../lib/sadi-rb.rb'
require 'rspec'
require 'rack/test'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

describe SADI::Server do
  include Rack::Test::Methods

  def app
    SADI::Server
  end

  def sample_input
    <<-EOS
<rdf:RDF
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:hello="http://sadiframework.org/examples/hello.owl#">

  <hello:NamedIndividual rdf:about="http://sadiframework.org/examples/hello-input.rdf#1">
    <foaf:name>Guy Incognito</foaf:name>
  </hello:NamedIndividual>

</rdf:RDF>
    EOS
  end

  describe "basic operation" do
    it "returns service description" do
      get '/services/hello'
      last_response.should be_ok
      last_response.body["<http://sadiframework.org/examples/hello>"].should_not be nil
    end

    it "returns output on post" do
      header "Accept", "text/turtle"
      header "Content-Type", "application/rdf+xml"

      post '/services/hello', sample_input

      last_response.should be_ok
      last_response.body["Hello, Guy Incognito"].should_not be nil
      last_response.content_type.should == "text/turtle"
    end
  end

  context "content negotiation" do
    %w{application/rdf+xml text/turtle application/ld+json}.each do |format|
      describe "accepts #{format}" do
        it {
          header "Accept", format
          get '/services/hello'

          last_response.should be_ok
          last_response.content_type.should == format
        }
      end
    end
  end
end