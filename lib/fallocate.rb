require 'ffi'

# Wrapper for the raw FFI call to posix_fallocate.
#
# Do not use this module. Use File#allocate instead.
module Fallocate
  extend FFI::Library
  ffi_lib 'c'
  attach_function :posix_fallocate, [:int, :off_t, :off_t], :int
end

if RUBY_VERSION >= '1.9'
  require 'fallocate/19.rb'
else
  require 'fallocate/18.rb'
end

