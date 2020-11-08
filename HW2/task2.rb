# frozen_string_literal: true

# class Minion
class Minion
  def initialize(name)
    @name = name
    @life = 3
    @age = 0
    @mood = 10
    @hunger = 0
    @sleep = 0
    @wc = 0
    @study = 0
    p "Minion #{name} came to you!"
    print "
────────▄▀▀═════════════▀▀▄
───────█═══════════════════█
──────█═════════════════════█
─────█═══▄▄▄▄▄▄▄═══▄▄▄▄▄▄▄═══█
────█═══█████████═█████████═══█
────█══██▀────▀█████▀────▀██══█
───██████──█▀█──███──█▀█──██████
───██████──▀▀▀──███──▀▀▀──██████
────█══▀█▄────▄██─██▄────▄█▀══█
────█════▀█████▀───▀█████▀════█
────█═════════════════════════█
────█═════════════════════════█
────█═══════▀▄▄▄▄▄▄▄▄▄▀═══════█
────█═════════════════════════█
───▐▓▓▌═════════════════════▐▓▓▌
───▐▐▓▓▌▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▐▓▓▌▌
───█══▐▓▄▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▄▓▌══█
──█══█═▐▓▓▓▓▓▓▐██▀██▌▓▓▓▓▓▓▌═█══█
──█══█═▐▓▓▓▓▓▓▓▀▀▀▀▀▓▓▓▓▓▓▓▌═█══█
─▄█══█▐▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▌█══█▄
─█████▐▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▌─█████
─██████▐▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▌─██████
──▀█▀█──▐▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▌───█▀█▀
─────────▐▓▓▓▓▓▓▌▐▓▓▓▓▓▓▌
──────────▐▓▓▓▓▌──▐▓▓▓▓▌
─────────▄████▀────▀████▄ ❤
"
    p "#{@name}: BELLO!"
  end

  def feed
    p "You give #{@name} his favorite food"
    p @name + [': BANANAA!', ': BA-NA-NA!', ': POTATO!', ': BABLE!', ': GELATO!'].sample.to_s
    @hunger = 0
    passed_time
  end

  def sleep
    if @wc >= 8 || @hunger >= 8
      p 'Minion cannot sleep. Something bothers him.'
      p "#{@name}: BULAKA"
    else
      p "You put #{@name} to bed."
      p "#{@name}: MUAK MUAK MUAK!"
      @sleep = 0
    end
  end

  def go_wc
    p 'Minion goes to the toilet'
    p "#{@name}: PWEDE NA?"
    @wc = 0
  end

  def status
    p '----------------Your minion status-----------------'
    p @name
    p "Age: #{@age}"
    p "Life: #{@life}"
    p "Mood: #{@mood}"
    p "Hunger: #{@hunger}"
    p "Sleep: #{@sleep}"
    p "WC: #{@wc}"
    p "Study: #{@study}"
    p '---------------------------------------------------'
  end

  def help
    p 'List of available commands:'
    p '1 or help'
    p '2 or status'
    p '3 or feed'
    p '4 or sleep'
    p '5 or wc'
    # p 'walk'
    p '10 or exit'
  end

  private


  def passed_time

    @age += 1
    @hunger += 1
    @wc += 1
    @sleep += 1

    # evolution
    if @age > 50 || @study == 20
      p "#{@name} evolve into a Super#{@name}!"
      @name = "Super#{@name}"
      p "#{@name}: BEE DO BEE DO BEE DO!"
      @mood = 50
      @hunger, @sleep, @wc = -20
      @life += 1
    end

    # hunger
    if @hunger >=8
      p 'Attention! Feed your minion!'
      p "#{@name}: ME WANT BANANA!"
    end
    if @hunger >= 10
      @life -= 1
      p 'You didn\'t feed your minion'
      p "#{@name} lost one life, #{@life} left"
      p "#{@name}: TATATA BALA TU!"
    end

    #sleep
    if @sleep >= 12
      @mood -= 1
      p 'Attention! Minion wants to sleep! Mood gets worse.'
    end
    if @sleep >= 15
      @mood -= 3
    end

    # wc
    if @wc >= 8
      p 'Attention! Minion wants to go to the toilet!'
      p "#{@name}: STUPA! PEE-PEE!"
    end
    if @wc >= 10
      p 'Your minion went to the toilet in jeans'
      p "#{@name}: OOOPS! BI-DO"
      @wc = 0
    end

    # life
    if @life.zero?
      p "You lost #{@name}"
      p "#{@name}: POOPAYE..."
      exit
    end
  end

end

pet = Minion.new 'Stuard'

command = ''

# until command == 'exit'
#   p '---------------------------------------------------'
#   puts 'Please input command:'
#   command = gets.chomp.strip
#   case command
#   when 'help', '1'
#     pet.help
#   when 'status', '2'
#     pet.status
#   when 'feed', '3'
#     pet.feed
#   when 'sleep', '4'
#     pet.sleep
#   when 'wc', '5'
#     pet.go_wc
#   when 'exit', '10'
#     exit
#   else
#     p command + ' unknown command. To get list of commands type help'
#   end
# end



pet.feed
pet.feed
pet.feed
pet.feed
pet.feed
pet.feed
pet.feed
pet.feed
pet.sleep

pet.status





