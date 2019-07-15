require "ovto/router/version"

module Ovto
  module Router
    class Error < StandardError; end
    # Your code goes here...
  end
end

# require all the files, only if Opal is executing
if RUBY_ENGINE == 'opal'
  require 'ovto'
  require_relative 'router/version'
else
  # NOT running inside of opal, set things up
  # so opal can find the files.
  require 'opal'
  Opal.append_path File.expand_path('..', __FILE__).untaint
end
