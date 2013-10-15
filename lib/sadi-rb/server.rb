require 'sinatra/base'
require 'sinatra/linkeddata'

module SADI
  class Server < Sinatra::Base
    register Sinatra::LinkedData

    configure do
      enable :inline_templates
    end

    get '/' do
      # "This is a SADI "
      haml :index
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
        svc = SADI.service_for(service)
        raise "no service exists with name '#{service}'" unless svc
        rdf_response svc.process_input(request.body.read,request.content_type)
      end

      def get_description(service)
        svc = SADI.service_for(service)
        raise "no service exists with name '#{service}'" unless svc
        svc.service_description
      end

      def service_list
        SADI.services.keys.map{|k| "<a href=\"/services/#{k}\"> #{k} </a>"}.join("<br>")
      end

      def format_list
        RDF::Format.each.to_a.uniq{|f| f.content_type}
        .reject{|f| f.content_type.size == 0}
        .map{|f| "#{f.content_type} (#{f.to_sym})"}
        .join('<br>')
      end
    end
  end
end

__END__

@@ index
%h1
  This is a
  %a{href: 'http://sadiframework.org'} SADI
  Server

%div
  %strong Available services are: <br>
  = service_list

%br
%br

%div
  %strong Valid RDF formats are: <br>
  = "#{format_list}"