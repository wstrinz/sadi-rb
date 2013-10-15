# sadi-rb

Write [SADI] Services in Ruby, then host them as a Sinatra server

Currently only supports synchronous services, and only a copy of the [demo service] has been implemented

To try it, run the specs, or run

```ruby
require 'sadi-rb'

SADI::Server.run!
```

to run an instance of the demo service, at 'localhost:4567/services/hello'

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