require 'pry'
require 'sinatra/base'
require 'sinatra/linkeddata'

require_relative 'converter.rb'
require_relative 'synchronous_service.rb'
require_relative 'example_service.rb'

module SADI
  class Server < Sinatra::Base
    register Sinatra::LinkedData

    get '/test' do
      "test success"
    end

    get '/services/:service' do
      get_description(params[:service])
    end

    post '/services/:service' do
      handle_synchronous(params[:service])
    end

    get '/files/:service/:file' do
      "send a file (ontology)"
    end

    helpers do
      def rdf_response(repo)
        raise "Must return an RDF::Graph or RDF::Repository" unless repo.is_a?(RDF::Graph) or repo.is_a?(RDF::Repository)
        repo
      end


      def handle_synchronous(service)
        rdf_response ExampleService.process_input(request.body.read,request.content_type)
      end

      def get_description(service)
        ExampleService.service_description
      end
    end

    run! if app_file == $0
  end
end