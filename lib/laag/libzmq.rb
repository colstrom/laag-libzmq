
# -*- ruby -*-

require 'laag/library' # MIT License

module LAAG
  LIBZMQ_GEM_ROOT = File.expand_path(File.join(__dir__, %w[.. ..]))
  LIBZMQ_ORIGIN   = 'github.com/zeromq/libzmq'
  LIBZMQ_VERSION  = (
    $LOADED_FEATURES
      .map { |f| f.match %r{^laag-libzmq-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)} }
      .compact
      .map { |gem| gem['version'] }
      .uniq
      .first
  ) || (
    File
      .basename(LIBZMQ_GEM_ROOT)
      .match(%r{^laag-libzmq-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)})
      .named_captures
      .fetch('version')
  )

  def self.libzmq
    @@libzmq ||= Library.new(
      gem_root: LIBZMQ_GEM_ROOT,
      origin:   LIBZMQ_ORIGIN,
      version:  LIBZMQ_VERSION
    )
  end
end
