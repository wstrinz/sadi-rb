require 'sinatra/base'
require 'sinatra/linkeddata'

module SADI
  class Server < Sinatra::Base
    register Sinatra::LinkedData

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
        svc = SADI.service_for(service)
        rdf_response svc.process_input(request.body.read,request.content_type)
      end

      def get_description(service)
        svc = SADI.service_for(service)
        svc.service_description
      end
    end
  end
end