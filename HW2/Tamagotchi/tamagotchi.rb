# frozen_string_literal: true

require 'colorize'

# class Pet creates a pet for game
class Pet
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
".colorize(:light_yellow)
    puts "Minion #{name} came to you!"
    puts "#{@name}: BELLO!".colorize(:light_yellow)
  end

  def feed
    puts "You give #{@name} his favorite food"
    puts @name.colorize(:light_yellow) + [': BANANAA!', ': BA-NA-NA!', ': POTATO!', ': BABLE!', ': GELATO!'].sample.to_s.colorize(:light_yellow)
    @hunger = -1
    passed_time
  end

  def go_sleep
    if @wc >= 7 || @hunger >= 7
      puts 'Attention! Minion can not sleep. Something bothers him.'.colorize(:red)
      puts "#{@name}: BULAKA".colorize(:light_yellow)
    else
      puts "You put #{@name} to bed."
      puts "#{@name}: MUAK MUAK MUAK!".colorize(:light_yellow)
      @sleep = 0
      2.times { passed_time }
    end
  end

  def go_wc
    puts 'Minion goes to the toilet'
    puts "#{@name}: PWEDE NA?".colorize(:light_yellow)
    @wc = 0
    passed_time
  end

  def walk_check
    if @hunger >= 6
      puts 'Attention! The walk will take a long time. Recommended to feed minion before walk.'.colorize(:red)
      puts 'Input 1 for walk or 2 for feed minion.'
      walk_choise = gets.chomp.strip
      case walk_choise
      when '1'
        walk
      when '2'
        feed
      else
        puts 'Unknown command. Please input 1 or 2.'.colorize(:red)
      end
    else
      walk
    end
  end

  def study
    puts 'You minion is learning Ruby'
    puts "#{@name}: WOW! BOBMA!".colorize(:light_yellow)
    if @mood < 4
      @study += 1
    else
      @study += 2
    end
    passed_time
  end

  def clean_up
    puts 'We cleaned up around'
    @poo_poo = 0
    passed_time
  end

  def play
    puts 'Enter number of game if you want to play:'
    puts '1 - Guess Number, 2 - Slot Machine, 3 - Roll The Dice, 4 - exit game list'
    game = gets.chomp.strip
    case game
    when '1'
      game1
    when '2'
      game2
    when '3'
      game3
    when '4'
      status
    else
      puts 'Unknown command. Enter number of game.'
    end
  end

  def super_skill
    if @evolution
      puts 'All parameters are restored!'
      puts "#{@name}: BEE DO BEE DO BEE DO!".colorize(:light_yellow)
      @hunger = 0
      @wc = 0
      @sleep = 0
      @mood = 20
    else
      p 'Sorry, but you minion has not evolved yet'
    end
  end

  def status
    puts '----------------Your minion status-----------------'.colorize(:cyan)
    puts @name.colorize(:light_yellow)
    puts "Age: #{@age}".colorize(:cyan)
    puts "Life: #{@life}".colorize(:cyan)
    puts "Mood: #{@mood * 5}%".colorize(:cyan)
    puts "Hunger: #{@hunger * 10}%".colorize(:cyan)
    puts "Sleep: #{@sleep * 5}%".colorize(:cyan)
    puts "WC: #{@wc * 10}%".colorize(:cyan)
    puts "Study: level #{@study}".colorize(:cyan)
    puts '---------------------------------------------------'.colorize(:cyan)
  end

  def help
    puts 'List of available commands:'
    puts '1 or help'
    puts '2 or status'
    puts '3 or feed'
    puts '4 or sleep'
    puts '5 or wc'
    puts '6 or walk'
    puts '7 or study'
    puts '8 or clean'
    puts '9 or play'
    puts '10 or super-skill'
    puts '11 or exit'
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
      if @age >= 10 && @study >= 10
        puts 'WOWOWOWOWOWOWOWOW!!!!!!'.colorize(:green)
        puts "#{@name} evolve into a Super#{@name}!".colorize(:green)
        @name = "Super#{@name}"
        puts "#{@name}: BULAKA!".colorize(:light_yellow)
        @life += 1
        @evolution = true
      end
    end

    # hunger
    if @hunger >= 8
      puts 'Attention! Feed your minion!'.colorize(:red)
      puts "#{@name}: ME WANT BANANA!".colorize(:light_yellow)
    end
    if @hunger >= 10
      die
      puts 'You did not feed your minion'.colorize(:red)
      puts "#{@name} lost one life, #{@life} left".colorize(:red)
      puts "#{@name}: TATATA BALA TU!".colorize(:light_yellow)
    end

    # sleep
    if @sleep >= 16
      @mood -= 1
      puts 'Attention! Minion wants to sleep!'.colorize(:red)
    end
    if @sleep >= 18
      @mood -= 3
      puts 'Attention! Minion wants to sleep! Mood gets worse.'.colorize(:red)
    end

    # wc
    if @wc >= 8
      puts 'Attention! Minion wants to go to the toilet!'.colorize(:red)
      puts "#{@name}: STUPA! PEE-PEE!".colorize(:light_yellow)
    end
    if @wc >= 10
      puts 'Your minion went to the toilet in jeans'.colorize(:red)
      puts "#{@name}: OOOPS! BI-DO".colorize(:light_yellow)
      @poo_poo += 1
      @wc = 0
    end

    # mood
    if @mood <= 3
      puts 'Attention! Minion is in no mood. Learning gets harder. Play with him or take for a walk.'.colorize(:red)
      puts "#{@name}: PAPOY..".colorize(:light_yellow)
    end

    # poo-poo
    if @poo_poo > 3
      puts 'Attention! It is too dirty. Please clean around'.colorize(:red)
      @mood -= 1
    end
    if @poo_poo > 5
      die
      puts "#{@name} is sick and lost one life, #{@life} left".colorize(:red)
    end

    # life
    if @life.zero?
      puts "Minion has no lives left. You lost #{@name}".colorize(:red)
      puts "#{@name}: POOPAYE...".colorize(:light_yellow)
      exit
    end

    # parameter limit
    @mood = 0 if @mood.negative?
    @mood = 20 if @mood > 20
    @sleep = 10 if @sleep > 10
  end

  def walk
    puts "You go for a walk with #{@name}"
    puts "#{@name}: KAMPAI!".colorize(:light_yellow)
    @wc = 0
    @mood += 5
    @hunger += rand(2..4)
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
    @name = @name.delete_prefix('Super') if @evolution
    @evolution = false
  end

  def game1
    puts "Game 'Guess Number'"
    puts 'The minion thought of a number from 1 to 100, guess the number.'
    number = rand(1..100)
    input = ''
    until input == 'stop'
      puts "Input number or 'stop' to exit game:"
      input = gets.chomp
      if input.to_i > number
        puts 'Your number is greater.'
      elsif input.to_i < number
        puts 'Your number is less.'
      else
        puts "Right! Guess number - #{number}"
        puts "#{@name}: TULALILOO TI AMO!".colorize(:light_yellow)
        @mood += 4
        break
      end
    end
    passed_time
  end

  def game2
    p "Game 'Slot Machine'"
    p 'Minion has 30 dollars. One game on a slot machine costs 50 cent.'
    win_variant = {
      '700' => 10,
      '710' => 20,
      '720' => 30,
      '730' => 40,
      '740' => 50,
      '750' => 60,
      '760' => 70,
      '770' => 80,
      '777' => 10_000
    }
    money = 30
    input = ''
    until input == 'stop'
      puts "Press ENTER for game or 'stop' to exit game"
      input = gets.chomp
      random = rand(700..780).to_s
      if win_variant[random]
        puts "#{@name} win #{win_variant[random]} dollars."
        puts "#{@name}: BEE DO BEE DO BEE DO!".colorize(:light_yellow)
        @mood += 8
        money += win_variant[random]
      elsif money <= 0
        puts "#{@name} lost all the money"
        puts "#{@name}: SA LA KA!".colorize(:light_yellow)
        @mood -= 4
        break
      else
        puts 'Minion lost 50 cent.'
        money -= 0.5
      end
      puts "Combination: #{random}"
      puts "Minion balance is #{money}", ''
    end
    passed_time
  end

  def game3
    puts "Game 'Roll the Dice'"
    sleep 1
    puts "#{@name} roll the dice"
    puts "#{@name}: HANA, DUL, SAE".colorize(:light_yellow)
    puts "First dice = #{a = roll}, second dice = #{b = roll}: sum = #{minions_dices = a + b}"
    puts 'Press ENTER to roll the dice'
    gets
    puts "First dice = #{a = roll}, second dice = #{b = roll}: sum = #{your_dices = a + b}"
    if your_dices > minions_dices
      puts 'You win!'
      puts "#{@name}: UNDERWEAR…".colorize(:light_yellow)
      @mood -= 1
    else
      puts 'Minion win!'
      puts "#{@name}: KAMPAI!".colorize(:light_yellow)
      @mood += 3
    end
    passed_time
  end

  def roll
    rand(1..6)
  end
end
puts 'For colorizing text install gem colorize'
puts '---------------------------------------------------'
puts 'Welcome to the tamagotchi game! Your pet is a minion.'
puts 'Please enter minion\'s name:'
input_name = gets.chomp.strip.capitalize
pet = Pet.new(input_name)
# pet = Pet.new('Stuard')

command = ''
until command == 'exit'
  puts '---------------------------------------------------'
  puts 'Please input command or type help:'
  command = gets.chomp.strip
  case command
  when 'help', '1'
    pet.help
  when 'status', '2'
    pet.status
  when 'feed', '3'
    pet.feed
  when 'sleep', '4'
    pet.go_sleep
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
  when 'super-skill', '10'
    pet.super_skill
  when 'exit', '11'
    exit
  else
    puts "#{command} unknown command. To get list of commands type help"
  end
end
