module Logic
  def self.passed_time(request, emoji, text, minion_txt)
    Rack::Response.new do |response|
      response.set_cookie("age", request.cookies["age"].to_i + 1)
      response.set_cookie("hunger", request.cookies["hunger"].to_i + 10)
      response.set_cookie("mood", request.cookies["mood"].to_i - 5)
      response.set_cookie("sleep", request.cookies["sleep"].to_i + 5)
      response.set_cookie("wc", request.cookies["wc"].to_i + 10)
      response.set_cookie("study", request.cookies["study"])
      response.set_cookie("poo_poo", request.cookies["poo_poo"])
      response.set_cookie("evolution", request.cookies["evolution"])
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
        die(request, response)
      end

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

      if request.cookies["poo_poo"].to_i >= 3
        response.set_cookie("mood", request.cookies["mood"].to_i - 10)
        response.set_cookie("warning_txt", "Attention! It is too dirty. Please clean around")
      end
      if request.cookies["poo_poo"].to_i >= 5
        response.set_cookie("text", "It's too dirty around")
        die(request, response)
      end

      if request.cookies["mood"].to_i <= 20
        response.set_cookie("warning_txt", "Attention! Minion is in no mood. Learning gets harder.
 Play with him or take for a walk")
        response.set_cookie("minion_txt", "PAPOY..")
        response.set_cookie("emoji", "&#x1F61E;")
      end
      if request.cookies["warning_txt"].start_with?("Attention! Minion is in no mood") && request.cookies["mood"].to_i > 20
        response.set_cookie("warning_txt", "")
      end

      if request.cookies["evolution"].to_i.zero? && request.cookies["age"].to_i >= 40 && request.cookies["study"].to_i >= 30
        response.set_cookie("text", "WOWOWOWOWOWOWOWOW!!!!!! #{request.cookies["pet_name"]} evolve into a Super#{request.cookies["pet_name"]}!")
        response.set_cookie("life", request.cookies["life"].to_i + 1)
        response.set_cookie("pet_name", "Super#{request.cookies["pet_name"]}")
        response.set_cookie("minion_txt", "BULAKA!")
        response.set_cookie("emoji", "&#x1F608;")
        response.set_cookie("evolution", 1)
      end

      response.set_cookie("mood", 0) if request.cookies["mood"].to_i.negative? || request.cookies["mood"].to_i == 0
      response.set_cookie("mood", 100) if request.cookies["mood"].to_i > 100
      response.set_cookie("sleep", 100) if request.cookies["sleep"].to_i > 100

      remove_attention(request, response, "Attention! Minion wants to sleep!", "sleep", 70)
      remove_attention(request, response, "Attention! Minion wants to sleep! Mood gets worse", "sleep", 90)
      remove_attention(request, response, "Attention! Feed your minion!", "hunger", 80)
      remove_attention(request, response, "Attention! Feed your minion before walk!", "hunger", 65)
      remove_attention(request, response, "Attention! Minion wants to go to the toilet!", "wc", 70)
      remove_attention(request, response, "Your minion went to the toilet in jeans", "wc", 90)
      remove_attention(request, response, "#{request.cookies["pet_name"]} lost one life", "age", 1)
      remove_attention(request, response, "Attention! It is too dirty", "poo_poo", 1)

      response.redirect("/start")

      if request.cookies["life"].to_i.zero?
        response.set_cookie("warning_txt", "Minion has no lives left")
        response.set_cookie("text", "You lost #{request.cookies["pet_name"]}")
        response.set_cookie("minion_txt", "POOPAYE...")
        response.set_cookie("emoji", "&#x2620;")
        response.redirect("/game-over")
      end
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
    passed_time(request, emoji, text, minion_txt)
  end

  def self.go_sleep(request, emoji, text, minion_txt)
    if request.cookies["wc"].to_i >= 70 || request.cookies["hunger"].to_i >= 70
      Rack::Response.new do |response|
        response.set_cookie("minion_txt", "BULAKA!")
        response.set_cookie("text", text)
        response.set_cookie("emoji", "&#x1F914;")
        response.set_cookie("warning_txt", "Attention! Minion can not sleep. Something bothers him")
        response.redirect("/start")
      end
    else
      Rack::Response.new do |response|
        response.set_cookie("sleep", request.cookies["sleep"] = -5)
      end
      passed_time(request, emoji, text, minion_txt)
    end
  end

  def self.go_wc(request, emoji, text, minion_txt)
    Rack::Response.new do |response|
      response.set_cookie("wc", request.cookies["wc"] = -10)
    end
    passed_time(request, emoji, text, minion_txt)
  end

  def self.go_walk(request, emoji, text, minion_txt)
    if request.cookies["hunger"].to_i >= 70
      Rack::Response.new do |response|
        response.set_cookie("warning_txt", "Attention! Feed your minion before walk!")
        response.redirect("/start")
      end
    else
      Rack::Response.new do |response|
        response.set_cookie("mood", request.cookies["mood"] = request.cookies["mood"].to_i + rand(30..50))
        response.set_cookie("wc", request.cookies["wc"] = -10)
        response.set_cookie("hunger", request.cookies["hunger"] = request.cookies["hunger"].to_i + rand(10..20))
        response.set_cookie("text", text)
        response.set_cookie("minion_txt", minion_txt)
        response.set_cookie("emoji", emoji)
      end
      passed_time(request, emoji, text, minion_txt)
    end
  end

  def self.clean_up(request, emoji, text, minion_txt)
    if request.cookies["poo_poo"].to_i.zero?
      Rack::Response.new do |response|
        response.set_cookie("text", "There is nothing to clean up")
        response.redirect("/start")
      end
    else
      Rack::Response.new do |response|
        response.set_cookie("poo_poo", request.cookies["poo_poo"] = request.cookies["poo_poo"].to_i - 1)
      end
      passed_time(request, emoji, text, minion_txt)
    end
  end

  def self.teach(request, emoji, text, minion_txt)
    Rack::Response.new do |response|
      if request.cookies["mood"].to_i < 40
        response.set_cookie("study", request.cookies["study"] = request.cookies["study"].to_i + 1)
      else
        response.set_cookie("study", request.cookies["study"] = request.cookies["study"].to_i + 2)
      end
    end
    passed_time(request, emoji, text, minion_txt)
  end

  def self.super_skill(request, emoji, text, minion_txt)
    if request.cookies["evolution"].to_i.zero?
      Rack::Response.new do |response|
        response.set_cookie("text", "Sorry, but you minion has not evolved yet")
        response.set_cookie("minion_txt", "UNDERWEAR…")
        response.set_cookie("emoji", "&#x1F97A;")
        response.redirect("/start")
      end
    else
      Rack::Response.new do |response|
        response.set_cookie("hunger", request.cookies["hunger"] = 0)
        response.set_cookie("wc", request.cookies["wc"] = 0)
        response.set_cookie("sleep", request.cookies["sleep"] = 0)
        response.set_cookie("mood", request.cookies["mood"] = 100)
        response.set_cookie("text", text)
        response.set_cookie("minion_txt", minion_txt)
        response.set_cookie("emoji", emoji)
        response.redirect("/start")
      end
    end
  end

  def self.guess_number_init(emoji, text, minion_txt)
    Rack::Response.new do |response|
      response.set_cookie("text", text)
      response.set_cookie("minion_txt", minion_txt)
      response.set_cookie("emoji", emoji)
      response.set_cookie("guess_number", rand(1..100))
      response.redirect("/guess-number")
    end
  end

  def self.guess_number_game(request)
    guess_number_value = request.params["guess_number_value"].to_i
    number = request.cookies["guess_number"].to_i
    Rack::Response.new do |response|
      if guess_number_value > number
        response.set_cookie("text", "Your number is greater.")
        response.set_cookie("minion_txt", "DUL!")
        response.set_cookie("emoji", "&#x1F609;")
      elsif guess_number_value < number
        response.set_cookie("text", "Your number is less.")
        response.set_cookie("minion_txt", "SAE!")
        response.set_cookie("emoji", "&#x1F643;")
      else
        response.set_cookie("text", "Right! Guess number - #{guess_number_value}")
        response.set_cookie("minion_txt", "TULALILOO TI AMO!")
        response.set_cookie("emoji", "&#x1F61D;")
        response.set_cookie("mood", request.cookies["mood"] = 100)
      end
      response.redirect("/guess-number")
    end
  end

  def self.slot_machine_init(request, emoji, text, minion_txt)
    Rack::Response.new do |response|
      response.set_cookie("text", text)
      response.set_cookie("minion_txt", minion_txt)
      response.set_cookie("emoji", emoji)
      response.set_cookie("slot_machine_money", request.cookies["slot_machine_money"] || 30)
      response.redirect("/slot-machine")
    end
  end

  def self.slot_machine_game(request)
    win_variant = {"700" => 10, "710" => 20, "720" => 30, "730" => 40, "740" => 50,
                   "750" => 60, "760" => 70, "770" => 80, "777" => 10_000}
    random = rand(700..780).to_s
    Rack::Response.new do |response|
      if win_variant[random]
        response.set_cookie("slot_machine_money", request.cookies["slot_machine_money"].to_i + win_variant[random])
        response.set_cookie("mood", request.cookies["mood"] = request.cookies["mood"].to_i + 10)
        response.set_cookie("text", "#{request.cookies["pet_name"]} win #{win_variant[random]} dollars.")
        response.set_cookie("minion_txt", "BEE DO BEE DO BEE DO!")
        response.set_cookie("emoji", "&#x1F911;")
      elsif request.cookies["slot_machine_money"].to_i <= 0
        response.set_cookie("mood", request.cookies["mood"] = request.cookies["mood"].to_i - 50)
        response.set_cookie("text", "#{request.cookies["pet_name"]} lost all the money")
        response.delete_cookie("slot_machine_money")
        response.set_cookie("minion_txt", "SA LA KA!")
        response.set_cookie("emoji", "&#x2639;")
      else
        response.set_cookie("text", "Minion lost 1 dollar.")
        response.set_cookie("minion_txt", "BUTTOM!")
        response.set_cookie("emoji", "&#x1F610;")
        response.set_cookie("slot_machine_money", request.cookies["slot_machine_money"].to_i - 1)
      end
      game_mood(request, response)
      response.set_cookie("warning_txt", "Combination: #{random}.
 Minion balance is #{request.cookies["slot_machine_money"].to_i + win_variant[random].to_i}")
      response.redirect("/slot-machine")
    end
  end

  def self.roll_dice_init(request, emoji, minion_txt)
    Rack::Response.new do |response|
      response.set_cookie("text", "#{request.cookies["pet_name"]} roll the dice: First dice = #{a = roll},
 second dice = #{b = roll}: sum = #{minions_dices = a + b}. Press Roll to roll the dice")
      response.set_cookie("warning_txt", "Minion dices: #{minions_dices}")
      response.set_cookie("minions_dices", minions_dices)
      response.set_cookie("minion_txt", minion_txt)
      response.set_cookie("emoji", emoji)
      response.redirect("/roll-dice")
    end
  end

  def self.roll_dice_game(request)
    minions_dice = request.cookies["minions_dices"].to_i
    mood = request.cookies["mood"]
    Rack::Response.new do |response|
      response.set_cookie("text", "You roll the dice: First dice = #{a = roll},
 second dice = #{b = roll}: sum = #{your_dices = a + b}. Press Roll to roll your dice again")
      if your_dices > minions_dice
        response.set_cookie("warning_txt", "Minion dices - #{minions_dice}, you dices #{your_dices} - You win!")
        response.set_cookie("minion_txt", "UNDERWEAR…")
        response.set_cookie("emoji", "&#x1F620;")
        response.set_cookie("mood", mood = mood.to_i - 10)
      elsif your_dices == minions_dice
        response.set_cookie("warning_txt", "Minion dices - #{minions_dice}, you dices #{your_dices} - Draw!")
        response.set_cookie("emoji", "&#x1F632;")
      else
        response.set_cookie("warning_txt", "Minion dices - #{minions_dice}, you dices #{your_dices} - Minion win!")
        response.set_cookie("minion_txt", "KAMPAI!")
        response.set_cookie("emoji", "&#x1F973;")
        response.set_cookie("mood", mood = mood.to_i + 10)
      end
      game_mood(request, response)
      response.redirect("/roll-dice")
    end
  end

  def self.game_mood(request, response)
    if request.cookies["mood"].to_i >= 100
      response.set_cookie("mood", request.cookies["mood"] = 100)
    end
  end

  def self.roll
    rand(1..6)
  end

  def self.die(request, response)
    response.set_cookie("life", request.cookies["life"].to_i - 1)
    response.set_cookie("emoji", "&#x1F631;")
    response.set_cookie("age", 0)
    response.set_cookie("hunger", 0)
    response.set_cookie("mood", 100)
    response.set_cookie("wc", 0)
    response.set_cookie("study", 0)
    response.set_cookie("sleep", 0)
    response.set_cookie("pet_name", request.cookies["pet_name"].delete_prefix("Super")) if request.cookies["evolution"].to_i == 1
    response.set_cookie("evolution", 0)
    response.set_cookie("warning_txt", "#{request.cookies["pet_name"]} lost one life, #{request.cookies["life"].to_i - 1} left")
  end
end
