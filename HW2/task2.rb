# frozen_string_literal: true

# class Minion
class Minion
  def initialize(name)
    @name = name
    @life = 3
    @age = 0
    @mood = 20
    @hunger = 0
    @sleep = 0
    @wc = 0
    @study = 0
    @poo_poo = 0
    @evolution = false
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
    if @wc >= 7 || @hunger >= 7
      p 'Minion can not sleep. Something bothers him.'
      p "#{@name}: BULAKA"
    else
      p "You put #{@name} to bed."
      p "#{@name}: MUAK MUAK MUAK!"
      @sleep = 0
      2.times{passed_time}
    end
  end

  def go_wc
    p 'Minion goes to the toilet'
    p "#{@name}: PWEDE NA?"
    @wc = 0
    passed_time
  end

  def walk_check
    if @hunger >= 6
      p 'Attention! The walk will take a long time. Recommended to feed minion before walk.'
      p 'Input 1 for walk or 2 for feed minion.'
      walk_choise = gets.chomp.strip
      case walk_choise
      when "1"
        walk
      when "2"
        feed
      else
        p 'Unknown command. Please input 1 or 2.'
      end
    else
      walk
    end
  end

  def study
    p 'You minion is learning Ruby'
    p "#{@name}: WOW! BOBMA!"
    if @mood < 4
      @study += 1
    else
      @study += 2
    end
    passed_time
  end

  def clean_up
    p 'We cleaned up around'
    @poo_poo = 0
    passed_time
  end

  def play
    p 'Print number of game if you want to play:'
    p '1 - die, 2 - rock-scissor-paper'
    game = gets.chomp.strip
    case game
    when '1'
      p '1'
    when '2'
      p '2'
    else
      p 'exit'
    end
  end

  def status
    p '----------------Your minion status-----------------'
    p @name
    p "Age: #{@age}"
    p "Life: #{@life}"
    p "Mood: #{@mood*5}%"
    p "Hunger: #{@hunger*10}%"
    p "Sleep: #{@sleep*5}%"
    p "WC: #{@wc*10}%"
    p "Study: level #{@study}"
    p '---------------------------------------------------'
  end

  def help
    p 'List of available commands:'
    p '1 or help'
    p '2 or status'
    p '3 or feed'
    p '4 or sleep'
    p '5 or wc'
    p '6 or walk'
    p '7 or study'
    p '8 or clean'
    p '9 or play'
    p '10 or exit'
  end

  private

  def passed_time

    @age += 1
    @hunger += 1
    @wc += 1
    @sleep += 1
    @mood -= 1

    # evolution
    unless @evolution
      if @age >= 40 && @study >= 30
        p 'WOWOWOWOWOWOWOWOW!!!!!!'
        p "#{@name} evolve into a Super#{@name}!"
        @name = "Super#{@name}"
        p "#{@name}: BEE DO BEE DO BEE DO!"
        @mood = 50
        @life += 1
        @evolution = true
      end
    end

    # hunger
    if @hunger >=8
      p 'Attention! Feed your minion!'
      p "#{@name}: ME WANT BANANA!"
    end
    if @hunger >= 10
      die
      p 'You did not feed your minion'
      p "#{@name} lost one life, #{@life} left"
      p "#{@name}: TATATA BALA TU!"
    end

    #sleep
    if @sleep >= 16
      @mood -= 1
      p 'Attention! Minion wants to sleep!'
    end
    if @sleep >= 18
      @mood -= 3
      p 'Attention! Minion wants to sleep! Mood gets worse.'
    end

    # wc
    if @wc >= 8
      p 'Attention! Minion wants to go to the toilet!'
      p "#{@name}: STUPA! PEE-PEE!"
    end
    if @wc >= 10
      p 'Your minion went to the toilet in jeans'
      p "#{@name}: OOOPS! BI-DO"
      @poo_poo +=1
      @wc = 0
    end

    # mood
    if @mood <= 3
      p 'Minion is in no mood. Play with him or take for a walk.'
      p "#{@name}: PAPOY.."
    end

    if @poo_poo > 3
      p 'It is too dirty. Please clean around'
      @mood -= 1
    end
    if @poo_poo > 5
      die
      p "#{@name} is sick and lost one life, #{@life} left"
    end

    # life
    if @life.zero?
      p "Minion has no lives left. You lost #{@name}"
      p "#{@name}: POOPAYE..."
      exit
    end
  end

  def walk
    p "You go for a walk with #{@name}"
    p "#{@name}: KAMPAI!"
    @wc = 0
    @mood += 5
    @hunger += 3
    passed_time
  end

  def die
    @life -= 1
    @age = 0
    @mood = 20
    @hunger = 0
    @sleep = 0
    @wc = 0
    @study = 0
    if @evolution
      @name = @name.delete_prefix("Super")
    end
    @evolution = false
  end
end

pet = Minion.new 'Stuard'

command = ''
until command == 'exit'
  p '---------------------------------------------------'
  puts 'Please input command:'
  command = gets.chomp.strip
  case command
  when 'help', '1'
    pet.help
  when 'status', '2'
    pet.status
  when 'feed', '3'
    pet.feed
  when 'sleep', '4'
    pet.sleep
  when 'wc', '5'
    pet.go_wc
  when 'walk', '6'
    pet.walk_check
  when 'study', '7'
    pet.study
  when 'clean', '8'
    pet.clean_up
  when 'play', '9'
    pet.play
  when 'exit', '10'
    exit
  else
    p command + ' unknown command. To get list of commands type help'
  end
end

#
#
# pet.feed
# pet.sleep
# pet.sleep
# pet.status





