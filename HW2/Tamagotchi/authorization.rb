require 'yaml'

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

def authorization
  role = ''
  authorization = ""
  until authorization == "exit" || role != ""
    puts "Please enter your username and password to start"
    puts "Enter your name:"
    login_name = gets.chomp
    exit if login_name == "exit"
    puts "Enter your password:"
    login_pass = gets.chomp

    user = USERDATA.find { |f| f[:name] == login_name && f[:pass] == login_pass }
    if user.nil?
      puts "Wrong name or password. Input correct data or enter 'exit' to leave program"
    else
      role = user[:role]
      save_data = { title: "Tamagotchi Minion",
                    # characteristics: [{life: pet.life,
                    #                    age: pet.age,
                    #                    mood: pet.mood,
                    #                    hunger: pet.hunger,
                    #                    sleep: pet.sleep,
                    #                    wc: pet.wc,
                    #                    study: pet.study,
                    #                    poo_poo: pet.poo_poo,
                    #                    evolution: pet.evolution}],
                    user: user }

      File.open("user.yml", "w") { |file| file.write(save_data.to_yaml) }
      puts "You logged in as #{role}"
    end
  end
end