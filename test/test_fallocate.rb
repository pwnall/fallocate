require File.expand_path('helper.rb', File.dirname(__FILE__))

require 'tempfile'

describe 'File#allocate' do
  describe 'on 0-byte file' do
    before do
      @tf = Tempfile.new 'fallocate-test'
      @tf.close
      @f = File.open @tf.path, 'w'
    end
    after do
      @f.close
      @tf.unlink
    end

    it 'expands it from 0 to 1Mb' do
      @f.allocate 0, 1024 * 1024
      @f.stat.size.must_equal 1024 * 1024
    end

    it 'expands it from 2 to 1Mb' do
      @f.allocate 2, 1024 * 1024
      @f.stat.size.must_equal 1024 * 1024 + 2
    end
    
    it 'raises EBADF correctly' do
      @f.close
      @f = File.open @tf.path
      lambda {
        @f.allocate 0, 1024 * 1024
      }.must_raise Errno::EBADF
    end
  end
end

