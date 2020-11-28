module Logic
  def self.feed(request)
    Rack::Response.new do |response|
      response.set_cookie("hunger", request.cookies["hunger"] = -1)
    end
    self.passed_time(request)
  end
  def self.passed_time(request)
    Rack::Response.new do |response|
      response.set_cookie("age", request.cookies["age"].to_i + 1)
      response.set_cookie("hunger", request.cookies["hunger"].to_i + 1)
      response.set_cookie("mood", request.cookies["mood"].to_i - 1)
      response.redirect('/start')
    end
  end
end