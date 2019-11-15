# Pacman

## Table of contents:

* [Description](./README.md#description)
  * [Constraints](./README.md#constraints)
  * [Example Input and Output](./README.md#example-input-and-output)
  * [Deliverables](./README.md#deliverables)
* [Setup](./README.md#setup)
* [Running the app](./README.md#running-the-app)
* [Running the tests](./README.md#running-the-tests)
* [Consideration about the development](./README.md#considerations-about-the-development)
* [Examples of use](./test_data/test_data.txt)
* [Contributing](./README.md#contributing)


## Description

* The application is a simulation of Pacman moving on in a grid, of dimensions 5 units x 5 units.
* There are no other obstructions on the grid.
* Pacman is free to roam around the surface of the grid, but must be prevented from moving off the grid. Any movement that would result in Pacman moving off the grid must  be prevented, however further valid movement commands must still be allowed.
* Create an application that can read in commands of the following form -

```
PLACE X,Y,F

MOVE

LEFT

RIGHT

REPORT
```

* PLACE will put the Pacman on the grid in positon X,Y and facing NORTH,SOUTH, EAST or WEST.
* The origin (0,0) can be considered the SOUTH WEST most corner.
* The first valid command to Pacman is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.
* MOVE will move Pacman one unit forward in the direction it is currently facing.
* LEFT and RIGHT will rotate Pacman 90 degrees in the specified direction without changing the position of Pacman.
* REPORT will announce the X,Y and F of Pacman. This can be in any form, but standard output is sufficient.
* Pacman that is not on the grid can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.
* Input can be from a file, or from standard input, as the developer chooses.
* Provide test data to exercise the application.

### Constraints

* Pacman must not move off the grid during movement. This also includes the initial placement of Pacman.
* Any move that would cause Pacman to fall must be ignored.

### Example Input and Output:
```
a)
PLACE 0,0,NORTH

MOVE

REPORT

Output: 0,1,NORTH
```
```
b)

PLACE 0,0,NORTH

LEFT

REPORT

Output: 0,0,WEST
```
```
c)

PLACE 1,2,EAST

MOVE

MOVE

LEFT

MOVE

REPORT

Output: 3,3,NORTH
```

### Deliverables
* Spend as little or as much time as you like on the challenge.
* The code you produce can be in any language
* *It is not required to provide any graphical output* showing the movement of Pacman.
* The output of the efforts *must be committed back into a Public Repo in Github* and the URL shared back for review.
* Proving your code works via unit testing is highly encouraged

## Setup

1. Make sure you have Ruby 2.6.4 installed in your machine. If you need help installing Ruby, take a look at the [official installation guide](https://www.ruby-lang.org/en/documentation/installation/).

2. Install the [bundler gem](http://bundler.io/) by running:

    ```gem install bundler```

3. Clone this repo:

    ```git clone git@github.com:enitschorn/pacman.git```

4. Change to the app directory:

    ```cd pacman```

5. Install dependencies:

    ```bundle install```

And you're ready to go!

### Running the app
```ruby app.rb```
To modify the commands input, you can update the commands.txt file.

### Running the tests
```bundle exec rspec```
or
```rspec```

### Considerations about the development


### Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pacman.
