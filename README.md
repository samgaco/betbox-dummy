# Betbox-dummy

The purpose of this project is to create a system to score boxing matches.


## Structure

In the /bin/ folder we can find the iu.rb ,scrip that executes the whole project.

In /lib/ we can find the following classes

* *scorer* This class will be the one in charge of the scoring
* *boxing_match* This will refer to the boxing matches themselves
* *user* A class for the users scoring the matches
* *schedule* A class that will deal with the data of the matches (when do they start, etc.)
* *round* A class for each round of a boxing match (thinking about suprresing this one)


## Deployment

Clone the project and execute it going into the bin folder and writting the following line into your terminal:

`````
ruby iu.rb
`````

## Technologies

This project has been build with ruby 2.6.1
