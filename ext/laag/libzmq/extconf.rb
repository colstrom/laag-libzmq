
# -*- ruby -*-

require 'mkmf' # Ruby Standard Library

require 'laag'           # MIT License
require 'laag/libsodium' # ISC License

require_relative '../../../lib/laag/libzmq'

LAAG::BuildEnvironment.new(LAAG.libzmq).script do
  configure!(
    "--with-libsodium=#{LAAG.libsodium.install_path}",
    '--without-docs'
  )
  make! :clean
  make!
  make! :install
  make! :clean
end

create_makefile 'laag/libzmq'
