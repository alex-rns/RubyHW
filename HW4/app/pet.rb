require "erb"
require './app/lib/logic'
require 'rack'

class Pet
  include Logic

  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    @request = Rack::Request.new(env)
    @name = "Stuart"
    @life = 3
    @age = 0
    @mood = 20
    @hunger = 0
    @sleep = 0
    @wc = 0
    @study = 0
    @poo_poo = 0
  end

  def response
    case @request.path
    when "/"
      Rack::Response.new(render("welcome.html.erb"))
    when "/welcome"
      Rack::Response.new do |response|
        response.set_cookie('life', @life)
        response.set_cookie('age', @age)
        response.set_cookie('mood', @mood)
        response.set_cookie('hunger', @hunger)
        response.redirect('/start')
      end
    when "/start"
      Rack::Response.new(render("index.html.erb"))
    when '/change'
      return Logic.feed(@request) if @request.params['feed']
      # return Logic.passed_time(@request) if @request.params['feed']
    else
      Rack::Response.new('Not Found', 404)
    end
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def get(attr)
    @request.cookies["#{attr}"].to_i
  end
end