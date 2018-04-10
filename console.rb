require("pry-byebug")
require_relative("./Space_Cowboys.rb")

#Comment in once delete all is made
#SpaceCowboy.delete_all()

cowboy1 = SpaceCowboy.new({
"name" => "Han Solo",
"bounty_value" => 500000,
"homeworld" => "Corellia",
"last_known_location" => "Tatooine"
  })

cowboy2 = SpaceCowboy.new({
"name" => "Chewie",
"bounty_value" => 250000,
"homeworld" => "Kashyyyk",
"last_known_location" => "Tatooine"
  })

cowboy3 = SpaceCowboy.new({
"name" => "Malcolm Reynolds",
"bounty_value" => 500000,
"homeworld" => "Shadow",
"last_known_location" => "Earth"
  })

cowboy1.save()
cowboy2.save()
cowboy3.save()
