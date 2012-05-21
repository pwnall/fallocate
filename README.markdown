# fallocate

Pure-Ruby FFI bindings to
(posix_fallocate)[http://www.kernel.org/doc/man-pages/online/pages/man3/posix_fallocate.3.html]

## Usage

```ruby
require 'fallocate'

File.open 'some/file', 'w' do |f|
  f.allocate 0, 1024 * 1024 * 1024
end
```

## Requirements

Right now, fallocate raises a FFI exception at loading time if
`posix_fallocate` isn't available in `libc`.

## Contributing to fallocate
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Victor Costan. See LICENSE.txt for further details.

