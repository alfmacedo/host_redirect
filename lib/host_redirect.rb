require "host_redirect/version"
require 'rack/request'
require 'uri'

module HostRedirect
  class Run
    def initialize(app, host_mapping)
      @app = app
      @host_authorizeds = host_mapping[:host_authorizeds]
      @host_redirect = host_mapping[:host_redirect]
    end

    def call(env)
      request = Rack::Request.new(env)
      actual_host = request.host.downcase
      puts "*** actual_host: #{actual_host}"
      puts "*** host_authorizeds: #{@host_authorizeds}"
      puts "*** host_redirect: #{@host_redirect}"
      if @host_authorizeds.map { |x| x }.include?(actual_host)
        @app.call(env)
      else
        puts "*** redirect to: #{@host_redirect}"
        location = URI(@host_redirect).to_s
        [301, {'Location' => location, 'Content-Type' => 'text/html', 'Content-Length' => '0'}, []]
      end
    end
  end
end
