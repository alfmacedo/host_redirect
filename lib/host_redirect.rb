require "host_redirect/version"
require 'rack/request'
require 'uri'

module HostRedirect
  class Run
    def initialize(app, host_mapping)
      @app = app
      @host_authorized = host_mapping[:host_authorized]
    end

    def call(env)
      request = Rack::Request.new(env)
      actual_host = request.host.downcase
      if actual_host != @host_authorized
        location = URI(@host_authorized).to_s
        [301, {'Location' => location, 'Content-Type' => 'text/html', 'Content-Length' => '0'}, []]
      else
        @app.call(env)
      end
    end
  end
end
