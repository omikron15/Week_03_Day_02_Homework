require("pry-byebug")
require_relative("./Space_Cowboys.rb")

SpaceCowboy.delete_all()

cowboy1 = SpaceCowboy.new({
"name" => "Han Solo",
"bounty_value" => 500000,
"homework" => "Corellia",
"last_known_location" => "Tatooine"
  })

cowboy2 = SpaceCowboy.new({
"name" => "Chewie",
"bounty_value" => 250000,
"homework" => "Kashyyyk",
"last_known_location" => "Tatooine"
  })

cowboy3 = SpaceCowboy.new({
"name" => "Malcolm Reynolds",
"bounty_value" => 500000,
"homework" => "Shadow",
"last_known_location" => "Earth"
  })
