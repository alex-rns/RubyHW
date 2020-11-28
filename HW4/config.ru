require './app/pet'

use Rack::Reloader, 0
use Rack::Static, :urls => ["/public"]
run Pet