require './lib/pacman/cli'
require './lib/pacman/command'
require './lib/pacman/grid'
require './lib/pacman/simulator'
require './lib/pacman/version'
require './lib/pacman/yellow_pacman'

cli = Pacman::CLI.new
commands_file = File.open('commands.txt')

begin 

  puts 'Welcome to the pacman simulator! We\'re currently processing your commands...'

  sleep(3)

  commands = cli.load_commands(commands_file)
  cli.run(commands)

  sleep(2)

  puts 'Exiting simulator...goodbye!'

  sleep(3)
end 
