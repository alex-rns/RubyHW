# **Project "BANANA" (or Tamagotchi minion)**

By Oleksandr Bielodubrovskyi

![minion_screen](https://user-images.githubusercontent.com/23439223/99804939-6f4cb280-2b44-11eb-9cf1-7aa48d0bc772.png)


## Description:
This project was created to practice object-oriented ruby.

## Requirements 

- Ruby 2.3.0
- git (optional)
- ruby gem "colorize" (optional)
- ruby gem "display_content" (optional)

## Download

Clone this repository into your computer:
```sh
$ git clone https://github.com/alex-rns/RubyHW/
```
or download from [git](https://github.com/alex-rns/RubyHW)

Optional clone gem "display_content":

```sh
$ git clone https://github.com/display_content
```
or download from [git](https://github.com/alex-rns/display_content)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'display_content'
gem 'colorize'
```
And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install colorize

To install "display_content" ```cd display_content``` and

    $ gem build display_content.gemspec
    $ gem install display_content

## How to start playing

- Go```$ cd HW2/Tamagotchi ``` and run ```pet.rb```
- If you have installed the "display_content" gem run ```index.html```, that was created in folder.
- Create new user or log into one of the existing: 
  - **as user**:  name: "qwe" - pass: "qwe";
  - **as admin:**  name: "admin" - pass: "123";
  - **as superadmin**: name: "super" - pass: "12345"
- Enter the name of you pet.

## Specification

- When the user start playing he needs to enter Tamagotchi's name.
- The Minion appears and you can start playing with him. 
- The Minion has basic characteristics that the user can see by entering the appropriate command. This characteristics are: **age**, **life**, **mood**, **hunger**, **sleep**, **WC**, **study**. Minion status for this moment can be viewed by entering `status`
- Minion's characteristics change after each interaction with him. There is no time limit in the world of Tamagotchi. The Minion will live as long as the user takes care of it.
- The user can interact with the Minion using the commands: `feed`, `sleep`, `wc`, `walk`, `study`, `clean` and `play`. After executing these commands, the characteristics of the Minion changes. All commands can be viewed by entering `help`
- The Minion has 3 lifes that he can lose under certain conditions, which the Minion and the system will warn the user about.
- When the Minion dies, the base characteristics are reset and 1 life is spent. With the loss of all lives, the game ends.
- The color of regular messages from the system is white, the system alerts are red, and the Minion's responses are yellow.(With installed [gem colorize](https://github.com/fazibear/colorize))
- Bonus: Under certain circumstances, Minion can evolve.

The aim is to look after your pet by feeding him and keeping him entertained.

### Minion's dictionary
| Minion's language | English |
| ------ | ------ |
| BA-NA-NA | Banana |
| BABBLES | Apples |
| BEE DO BEE DO BEE DO | Fire |
| BELLO | Hello |
| BI-DO | Sorry |
| BOMBA | Bomb |
| BULAKA | What's happening? |
| BUTTOM | Down |
| GELATO | Ice cream |
| HANA, DUL, SAE | One, two, three |
| KAMPAI | Hooray |
| LUK AT TU | Look at you |
| ME WANT BANANA | I am hungry |
| MUAK MUAK MUAK | Kiss |
| PAPOY | Toy |
| PARA TU | For you |
| PO KA | What |
| POOPAYE | Googbye |
| POTATO | Potato |
| PWEDE NA? | Let's begin? |
| SA LA KA! | How dare you? |
| STUPA | Stop |
| TANK YU | Thank you |
| TATATA BALA TU | Hate you |
| TULALILOO TI AMO | I love you |
| UNDERWEAR… | Swear |


## Technologies Used

- ruby
- gem colorized
- gem display_content

License
----

MIT

