require './app/pet'

use Rack::Reloader, 0
use Rack::Static, :urls => ["/public"]
use Rack::Auth::Basic do |username, password|
  username == "user" && password == "123"
end
run Pet