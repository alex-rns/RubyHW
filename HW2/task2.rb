# frozen_string_literal: true

# class Minion
class Minion
  def initialize(name)
    @name = name
    @life = 3
    @sleeping = false
    @age = 0
    @mood = 10
    @hunger = 0
    @sleep = 0
    @wc = 0
    @study = 0
    p "Minion #{name} was born."
    p "#{@name}: BELLO!"
  end

  def feed
    p "You give #{@name} his favorite food"
    p @name + [': BANANAA!', ': BA-NA-NA!', ': POTATO!', ': BABLE!', ': GELATO!'].sample.to_s
    @hunger = 0
    passed_time
  end

  def status
    p "Life: #{@life}"
    p "Hunger: #{@hunger}"
    p "Age: #{@age}"
    p "Mood: #{@mood}"
  end

  private

  def passed_time

    @age += 1

    #evolution
    if @age > 50 || @study == 20
      p "#{@name} evolve into a Super#{@name}!"
      @name = "Super#{@name}"
      p "#{@name}: BEE DO BEE DO BEE DO!"
      @mood = 50
      @hunger, @sleep, @wc = -20
      @life += 1
    end

    #hunger
    if @hunger < 10
      @hunger += @hunger
      @wc += @wc
    else
      @life -= 1
      p "#{@name} lost one life, #{@life} left"
      p "#{@name}: TATATA BALA TU!"
    end

    #life
    if @life.zero?
      p "#{@name}: POOPAYE!"
      exit
    end
  end
end

pet = Minion.new 'Stuard'
pet.feed
pet.feed
pet.feed
pet.status
