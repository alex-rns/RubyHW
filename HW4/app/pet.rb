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
    @life = 3
    @age = 0
    @mood = 100
    @hunger = 0
    @sleep = 0
    @wc = 0
    @study = 0
    @poo_poo = 0
    @emoji = "&#x1F92A;"
    @text = "Minion #{@request.params['pet_name']} came to you!"
    @minion_txt = "BELLO!"
  end

  def response
    case @request.path
    when "/"
      Rack::Response.new(render("welcome.html.erb"))
    when "/welcome"
      Rack::Response.new do |response|
        response.set_cookie('pet_name', @request.params['pet_name'].capitalize)
        response.set_cookie('life', @life)
        response.set_cookie('age', @age)
        response.set_cookie('mood', @mood)
        response.set_cookie('hunger', @hunger)
        response.set_cookie('wc', @wc)
        response.set_cookie('sleep', @sleep)
        response.set_cookie('poo_poo', @poo_poo)
        response.set_cookie('emoji', @emoji)
        response.set_cookie('text', @text)
        response.set_cookie('minion_txt', @minion_txt)
        response.set_cookie('warning_txt', "")
        response.redirect('/start')
      end
    when "/start"
      Rack::Response.new(render("index.html.erb"))
    when '/action_of_button'
      return Logic.feed(
        @request,
        "&#x1F924;",
        "You give #{@request.cookies["pet_name"]} his favorite food",
        "BA-NA-NA!") if @request.params['feed']
      return Logic.go_sleep(
        @request,
        "&#x1F634;",
        "You put #{@request.cookies["pet_name"]} to bed",
        "MUAK MUAK MUAK!") if @request.params['sleep']
      return Logic.go_wc(
        @request,
        "&#x1F92B;",
        "Minion goes to the toilet",
        "PWEDE NA?") if @request.params['wc']
      return Logic.go_walk(
        @request,
        "&#x1F601;",
        "You go for a walk with #{@request.cookies["pet_name"]}",
        "KAMPAI!") if @request.params['walk']
    else
      Rack::Response.new('Not Found', 404)
    end
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def get(attr)
    @request.cookies["#{attr}"]
  end
end