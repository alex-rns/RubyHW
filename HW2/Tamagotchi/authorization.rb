require "yaml"

module Authorization
  USERDATA = [
    {
      name: "qwe",
      pass: "qwe",
      role: "user"
    },
    {
      name: "asd",
      pass: "asd",
      role: "user"
    },
    {
      name: "admin",
      pass: "123",
      role: "admin"
    },
    {
      name: "super",
      pass: "12345",
      role: "superadmin"
    }
  ]

  def self.get_input
    puts "Enter your name:"
    @login_name = gets.chomp
    exit if @login_name == "exit"
    puts "Enter your password:"
    @login_pass = gets.chomp
  end

  def self.save_data(pet, user)
    pet.owner = user[:role]
    save_data = {title: "Tamagotchi Minion",
                 characteristics: [{life: pet.life,
                                    age: pet.age,
                                    mood: pet.mood,
                                    hunger: pet.hunger,
                                    sleep: pet.sleep,
                                    wc: pet.wc,
                                    study: pet.study,
                                    poo_poo: pet.poo_poo,
                                    evolution: pet.evolution}],
                 user: user}

    File.open("user.yml", "w") { |file| file.write(save_data.to_yaml) }
  end

  def self.authorization(pet)
    authorization = ""
    until authorization == "exit" || pet.owner != ""
      puts "Please enter your username and password to start"
      get_input
      user = USERDATA.find { |f| f[:name] == @login_name && f[:pass] == @login_pass }
      if @login_name == "new"
        puts "Create new user:"
        get_input
        user = {name: @login_name, pass: @login_pass, role: "user"}
        save_data(pet, user)
      elsif user.nil?
        puts "Wrong name or password.
 Input correct data / enter 'new' to create new user / enter 'exit' to leave program"
      else
        save_data(pet, user)
        puts "You logged in as #{pet.owner}"
      end
    end
  end
end
