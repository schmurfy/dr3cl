require 'eventmachine'
require 'zlib'
require 'monitoring_protocols'

module Drone3
  module Clients
    
    class UDP < EM::Connection
      
      def self.create(address, port = 22122, format: 'json')
        EM::open_datagram_socket('0.0.0.0', nil, UDP, address, port, format: format)
      end
      
      
      def initialize(target, port, opts)
        p [:opts, opts]
        @target = target
        @port   = port
        @format = opts[:format]
      end
      
      def send_msg(json)
        case @format
        when 'json'
          # data = Zlib.deflate(json)
          data =json
          send_datagram(data, @target, @port)
        end
      end
      
      
      def send_points(points)
        points = points.map do |args|
          args[:time] ||= nil
          MonitoringProtocols::DataPoint.new(args)
        end
        
        builder = MonitoringProtocols::JSON::Builder.new(points)
        json = builder.build_packet()
        send_msg(json)
      end
      
      
      def receive_data(*)
        
      end
    end
    
  end
end
