require 'rubygems'
require 'bundler/setup'

require 'eetee'

$LOAD_PATH.unshift( File.expand_path('../../lib' , __FILE__) )
require 'drone3/client'

require 'eetee/ext/mocha'
require 'eetee/ext/time'
# require 'eetee/ext/em'

# Thread.abort_on_exception = true


require MonitoringProtocols.factory_file()
