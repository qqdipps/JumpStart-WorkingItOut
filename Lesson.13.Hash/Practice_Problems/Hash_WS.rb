# if correct answer == true
person = {
  "first_name" => "ada",
  "last_name" => "lovelace",
  "nickname" => "adie"
}

puts person.length == 3
puts person["last_name"] == "lovelace"


animals = {
  "dog" => "canine",
  "cat" => "feline"
}

animals["cat"] = "feline" 
puts animals["dog"] == "canine"
puts animals["donkey"] == nil


chuck_norris = {
  "punch" => 99,
  "kick" => 98,
  "stops_bullets_with_hands" => false
}

chuck_norris["kick"] = 25
puts chuck_norris["kick"] == 25


menu = {}
menu["ramen"] = "garlic tonkotsu"
menu["burger"] = "bleu sun"
menu["tea"] = "green"
puts menu.length == 3
puts menu["burger"] == "bleu sun"
puts menu["tater_tots"] == nil
