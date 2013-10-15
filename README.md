# sadi-rb

### Installation
`gem install sadi-rb`

or clone the repository and run `rake install` for the latest version

### Description

Write [SADI] Services in Ruby, then host them as a Sinatra server

Currently only supports [synchronous] service have been implemented.

### Usage

To test the server, use the gem's executable `sadi-rb`. This will start the server on [http://localhost:4567](http://localhost:4567), and load the [demo service].

The server can also be run as part of a script using

```ruby
require 'sadi-rb'

SADI::Server.run!
```

### Writing your own services

To create an asynchronous service, simply extend the `SADI::SynchronousService` module and implement the interface methods it requires;

```ruby
require 'sadi-rb'

Class MyService
    def service_name
        "my_service_name"
    end

    def service_description
        # an RDF::Graph of your service's description
    end

    def service_owl
        # an RDF::Graph of your service's OWL classes
    end

    def process_object(input_graph, owl_object)
        # Service logic goes here

        # Should return an RDF::Graph of
        #   the output for the resource specified by the URI owl_object,
        #   from the RDF::Graph input_graph
    end
end
```

Although SADI can theoretically use any vocabulary for its service description, the gem internals currently require that you use the [mygrid ontology] in implementing your `service_description` method

## Contributing to sadi-rb

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 Will Strinz. See LICENSE.txt for
further details.

[demo service]: http://sadiframework.org/content/how-sadi-works/synchronous-sadi-services/
[SADI]: http://sadiframework.org
[mygrid ontology]: http://www.mygrid.org.uk/tools/service-management/mygrid-ontology/