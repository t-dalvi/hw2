# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
#
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
#
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======
# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========
# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Represented by agent
# ====================
# Christian Bale

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

if ActiveRecord::Base.connection.table_exists?('movies')
  Role.destroy_all
  Movie.destroy_all
  Actor.destroy_all
  Studio.destroy_all
  Agent.destroy_all
end

# Generate models and tables, according to the domain model.
# TODO!

class Studio < ApplicationRecord; end
class Movie < ApplicationRecord; end
class Actor < ApplicationRecord; end
class Role < ApplicationRecord; end
class Agent < ApplicationRecord; end

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# 1. Studios
warner = Studio.create({ "name" => "Warner Bros." })

# 2. Movies
begins      = Movie.create({ "title" => "Batman Begins", "year_released" => 2005, "rated" => "PG-13", "studio_id" => warner.id })
dark_knight = Movie.create({ "title" => "The Dark Knight", "year_released" => 2008, "rated" => "PG-13", "studio_id" => warner.id })
rises       = Movie.create({ "title" => "The Dark Knight Rises", "year_released" => 2012, "rated" => "PG-13", "studio_id" => warner.id })

# 3. Actors
bale       = Actor.create({ "name" => "Christian Bale" })
caine      = Actor.create({ "name" => "Michael Caine" })
neeson     = Actor.create({ "name" => "Liam Neeson" })
holmes     = Actor.create({ "name" => "Katie Holmes" })
oldman     = Actor.create({ "name" => "Gary Oldman" })
ledger     = Actor.create({ "name" => "Heath Ledger" })
eckhart    = Actor.create({ "name" => "Aaron Eckhart" })
gyllenhaal = Actor.create({ "name" => "Maggie Gyllenhaal" })
hardy      = Actor.create({ "name" => "Tom Hardy" })
levitt     = Actor.create({ "name" => "Joseph Gordon-Levitt" })
hathaway   = Actor.create({ "name" => "Anne Hathaway" })

# 4. Roles
# Batman Begins
Role.create({ "movie_id" => begins.id, "actor_id" => bale.id, "character_name" => "Bruce Wayne" })
Role.create({ "movie_id" => begins.id, "actor_id" => caine.id, "character_name" => "Alfred" })
Role.create({ "movie_id" => begins.id, "actor_id" => neeson.id, "character_name" => "Ra's Al Ghul" })
Role.create({ "movie_id" => begins.id, "actor_id" => holmes.id, "character_name" => "Rachel Dawes" })
Role.create({ "movie_id" => begins.id, "actor_id" => oldman.id, "character_name" => "Commissioner Gordon" })

# The Dark Knight
Role.create({ "movie_id" => dark_knight.id, "actor_id" => bale.id, "character_name" => "Bruce Wayne" })
Role.create({ "movie_id" => dark_knight.id, "actor_id" => ledger.id, "character_name" => "Joker" })
Role.create({ "movie_id" => dark_knight.id, "actor_id" => eckhart.id, "character_name" => "Harvey Dent" })
Role.create({ "movie_id" => dark_knight.id, "actor_id" => caine.id, "character_name" => "Alfred" })
Role.create({ "movie_id" => dark_knight.id, "actor_id" => gyllenhaal.id, "character_name" => "Rachel Dawes" })

# The Dark Knight Rises
Role.create({ "movie_id" => rises.id, "actor_id" => bale.id, "character_name" => "Bruce Wayne" })
Role.create({ "movie_id" => rises.id, "actor_id" => oldman.id, "character_name" => "Commissioner Gordon" })
Role.create({ "movie_id" => rises.id, "actor_id" => hardy.id, "character_name" => "Bane" })
Role.create({ "movie_id" => rises.id, "actor_id" => levitt.id, "character_name" => "John Blake" })
Role.create({ "movie_id" => rises.id, "actor_id" => hathaway.id, "character_name" => "Selina Kyle" })

# 5. Agents & Actor updates
tejas = Agent.create({ "name" => "Tejas Dalvi" })
bale.update({ "agent_id" => tejas.id })

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
movies = Movie.all
for movie in movies
  studio = Studio.find_by({ "id" => movie["studio_id"] })
  puts "#{movie["title"]} #{movie["year_released"]} #{movie["rated"]} #{studio["name"]}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
roles = Role.all
for role in roles
  movie = Movie.find_by({ "id" => role["movie_id"] })
  actor = Actor.find_by({ "id" => role["actor_id"] })
  puts "#{movie["title"]} #{actor["name"]} #{role["character_name"]}"
end

# Prints a header for the agent's list of represented actors output
puts ""
puts "Represented by agent"
puts "===================="
puts ""

# Query the actor data and loop through the results to display the agent's list of represented actors output.
# TODO!
agent = Agent.find_by({ "name" => "Tejas Dalvi" })
represented_actors = Actor.where({ "agent_id" => agent.id })

for actor in represented_actors
  puts actor["name"]
end