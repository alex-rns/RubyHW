# **Project "BANANA" (or Tamagotchi minion)**

By Oleksandr Bielodubrovskyi

## Description:
This project was created to practice object-oriented ruby.

## Requirements 

- Ruby 2.0
- git (optional)
- ruby gem colorize (optional)

## Download

Clone this repository into your computer:
```sh
$ git clone https://github.com/alex-rns/RubyHW/
```
or download from [git](https://github.com/alex-rns/RubyHW)

To install gem colorize:
```sh
$ gem install colorize
```

## How to start playing

- Go```$ cd HW2/Tamagotchi ``` and run ```tamagotchi.rb```
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
| Hana | One |
| Dul | Two |
| Sae | Three |
| Bello | Hello |
| Poopaye | Googbye |
| Bi-do | Sorry |
| Pwede na? | Let's begin? |
| Tatata bala tu | Hate you |
| Underwear… | Swear |
| Me want banana | I am hungry |
| Luk at tu | Look at you |
| Para tu | For you |
| Tank yu | Thank you |
| Sa la ka! | How dare you? |
| Bulaka | What's happening? |
| Tulaliloo ti amo | I love you |
| Ba-na-na | Banana |
| Potato | Potato |
| Babbles | Apples |
| Gelato | Ice cream |
| Buttom | Down |
| Kampai | Hooray |
| BEE DO BEE DO BEE DO | Fire |
| Muak Muak Muak | Kiss |
| Stupa | Stop |
| Bomba | Bomb |
| Papoy | Toy |
| Bananonina | Ugly |
| Po ka | What |


## Technologies Used

- ruby
- gem colorize

License
----

MIT

