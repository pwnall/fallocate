require 'ffi'

# Wrapper for the raw FFI call to posix_fallocate.
#
# Do not use this module. Use File#allocate instead.
module Fallocate
  extend FFI::Library
  ffi_lib 'c'
  attach_function :posix_fallocate, [:int, :off_t, :off_t], :int
end

class File
  # Ensures there is enough disk space for writing to a file.
  #
  # This method asks the filesystem to allocate disk blocks for a file region,
  # so that writes to that region will not fail due to out-of-space errors.
  #
  # @param [Integer] offset the 0-based offset of the region's starting byte
  # @param [Integer] length the region's length, in bytes
  def allocate(offset = 0, length)
    errno = Fallocate.posix_fallocate fileno, offset, length
    return if errno == 0
    raise SystemCallError.new(errno)
  end
end

