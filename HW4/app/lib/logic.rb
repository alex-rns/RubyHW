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

      if request.cookies["hunger"].to_i >= 75
        response.set_cookie("warning_txt", "Attention! Feed your minion!")
        response.set_cookie("minion_txt", "ME WANT BANANA!")
        response.set_cookie("emoji", "&#x1F34C;")
      end
      if request.cookies["hunger"].to_i >= 100
        response.set_cookie("text", "You did not feed your minion")
        response.set_cookie("minion_txt", "TATATA BALA TU!!")
        self.die(request, response)
      end
      self.remove_attention(request, response, "Attention! Feed your minion!", "hunger", 80 )
      self.remove_attention(request, response, "Attention! Feed your minion before walk!", "hunger", 65 )

      if request.cookies["warning_txt"].start_with?("Attention! Minion can not sleep") && request.cookies["wc"].to_i < 70 && request.cookies["hunger"].to_i < 70
        response.set_cookie("warning_txt", "")
      end

      if request.cookies["sleep"].to_i >= 70
        response.set_cookie("mood", request.cookies["mood"].to_i - 5)
        response.set_cookie("warning_txt", "Attention! Minion wants to sleep!")
        response.set_cookie("emoji", "&#x1F971;")
      end
      if request.cookies["sleep"].to_i >= 85
        response.set_cookie("mood", request.cookies["mood"].to_i - 15)
        response.set_cookie("warning_txt", "Attention! Minion wants to sleep! Mood gets worse")
        response.set_cookie("emoji", "&#x1F974;")
      end
      self.remove_attention(request, response, "Attention! Minion wants to sleep!", "sleep", 70 )
      self.remove_attention(request, response, "Attention! Minion wants to sleep! Mood gets worse", "sleep", 90 )

      if request.cookies["wc"].to_i >= 70
        response.set_cookie("warning_txt", "Attention! Minion wants to go to the toilet!")
        response.set_cookie("minion_txt", "STUPA! PEE-PEE!")
        response.set_cookie("emoji", "&#x1F629;")
      end
      if request.cookies["wc"].to_i >= 90
        response.set_cookie("wc", 0)
        response.set_cookie("poo_poo", request.cookies["poo_poo"].to_i + 1)
        response.set_cookie("warning_txt", "Your minion went to the toilet in jeans")
        response.set_cookie("minion_txt", "OOOPS! BI-DO")
        response.set_cookie("emoji", "&#x1F4A9;")
      end
      self.remove_attention(request, response, "Attention! Minion wants to go to the toilet!", "wc", 70 )
      self.remove_attention(request, response, "Your minion went to the toilet in jeans", "wc", 90 )
      self.remove_attention(request, response, "#{request.cookies["pet_name"]} lost one life", "age", 1 )

      if request.cookies["mood"].to_i <= 20
        response.set_cookie("warning_txt", "Attention! Minion is in no mood. Learning gets harder.
 Play with him or take for a walk")
        response.set_cookie("minion_txt", "PAPOY..")
        response.set_cookie("emoji", "&#x1F61E;")
      end
      if request.cookies["warning_txt"].start_with?("Attention! Minion is in no mood") && request.cookies["mood"].to_i > 20
        response.set_cookie("warning_txt", "")
      end

      response.set_cookie("mood", 0) if request.cookies["mood"].to_i.negative? || request.cookies["mood"].to_i == 0
      response.set_cookie("mood", 100) if request.cookies["mood"].to_i > 100
      response.set_cookie("sleep", 100) if request.cookies["sleep"].to_i > 100

      if request.cookies["life"].to_i.zero?
        response.set_cookie("warning_txt", "Minion has no lives left")
        response.set_cookie("text", "You lost #{request.cookies["pet_name"]}")
        response.set_cookie("minion_txt", "POOPAYE...")
        response.set_cookie("emoji", "&#x2620;")
        response.redirect('/game-over')
      end

        response.redirect('/start')
    end
  end

  def self.remove_attention(request, response, attention, attribute, parameter)
    if request.cookies["warning_txt"].start_with?(attention) && request.cookies[attribute].to_i < parameter
      response.set_cookie("warning_txt", "")
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
        response.set_cookie("warning_txt", "Attention! Minion can not sleep. Something bothers him")
        response.redirect('/start')
      end
    else
      Rack::Response.new do |response|
        response.set_cookie("sleep", request.cookies["sleep"] = -5)
      end
      self.passed_time(request, emoji, text, minion_txt)
    end
  end

  def self.go_wc(request, emoji, text, minion_txt)
    Rack::Response.new do |response|
      response.set_cookie("wc", request.cookies["wc"] = -10)
    end
    self.passed_time(request, emoji, text, minion_txt)
  end

  def self.go_walk(request, emoji, text, minion_txt)
    if request.cookies["hunger"].to_i >= 70
      Rack::Response.new do |response|
        response.set_cookie("warning_txt", "Attention! Feed your minion before walk!")
        response.redirect('/start')
      end
    else
      Rack::Response.new do |response|
        response.set_cookie("mood", request.cookies["mood"] = rand(80..105))
        response.set_cookie("wc", request.cookies["wc"] = -10)
        response.set_cookie("hunger", request.cookies["hunger"] = rand(70..90))
        response.set_cookie("text", text)
        response.set_cookie("minion_txt", minion_txt)
        response.set_cookie("emoji", emoji)
      end
      self.passed_time(request, emoji, text, minion_txt)
    end
  end

  def self.die(request, response)
      response.set_cookie("life", request.cookies["life"].to_i - 1)
      response.set_cookie("emoji", "&#x1F631;")
      response.set_cookie("age", 0)
      response.set_cookie("hunger", 0)
      response.set_cookie("mood", 100)
      response.set_cookie("wc", 0)
      response.set_cookie("sleep", 0)
      response.set_cookie("warning_txt", "#{request.cookies["pet_name"]} lost one life, #{request.cookies["life"].to_i - 1} left")
  end
end