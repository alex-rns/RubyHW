module Logic

  def self.passed_time(request, emoji, text, minion_txt)
    Rack::Response.new do |response|
      response.set_cookie("age", request.cookies["age"].to_i + 1)
      response.set_cookie("hunger", request.cookies["hunger"].to_i + 10)
      response.set_cookie("mood", request.cookies["mood"].to_i - 5)
      response.set_cookie("sleep", request.cookies["sleep"].to_i + 5)
      response.set_cookie("wc", request.cookies["wc"].to_i + 10)
      response.set_cookie("emoji", emoji)
      response.set_cookie("text", text)
      response.set_cookie("minion_txt", minion_txt)
      response.set_cookie("warning_txt", "")
      response.redirect('/start')
    end
  end

  def self.feed(request, emoji, text, minion_txt)
    Rack::Response.new do |response|
      response.set_cookie("hunger", request.cookies["hunger"] = -10)
    end
    self.passed_time(request, emoji, text, minion_txt)
  end

  def self.go_sleep(request, emoji, text, minion_txt)
    if request.cookies["wc"].to_i >= 70 || request.cookies["hunger"].to_i >= 70
      Rack::Response.new do |response|
        response.set_cookie("minion_txt", "BULAKA!")
        response.set_cookie("text", text)
        response.set_cookie("emoji", "&#x1F914;")
        response.set_cookie("warning_txt", "Attention! Minion can not sleep. Something bothers him.")
        response.redirect('/start')
      end
    else
      Rack::Response.new do |response|
        response.set_cookie("sleep", request.cookies["sleep"] = -5)
      end
      self.passed_time(request, emoji, text, minion_txt)
    end
  end
end