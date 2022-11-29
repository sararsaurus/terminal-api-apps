require "tty-prompt"
require "http"
require "tty-font"
require "pastel"

system "clear"

pastel = Pastel.new
font = TTY::Font.new(:doom)
puts pastel.cyan(font.write("NEWS YOU CAN USE", letter_spacing: 2))
prompt = TTY::Prompt.new(active_color: :magenta)
input = prompt.select("🌟pick your topic🌟", %w(Cybersecurity Octopuses Soccer))

1.times do
  if input == "Cybersecurity"
    response = HTTP.get("https://newsapi.org/v2/everything?q=#{input}&apiKey=9b61b158304d4bdd843e941147535552")
  elsif input == "Octopuses"
    response = HTTP.get("https://newsapi.org/v2/everything?q=#{input}&apiKey=9b61b158304d4bdd843e941147535552")
  elsif input == "Soccer"
    response = HTTP.get("https://newsapi.org/v2/everything?q=#{input}&apiKey=9b61b158304d4bdd843e941147535552")
  end
  puts "Total articles on #{input.downcase}: #{response.parse(:json)["totalResults"]}"
  puts "Top article source: #{response.parse(:json)["articles"][0]["source"]["name"]}"
  puts "Top article description: #{response.parse(:json)["articles"][0]["description"]}"
  puts "Top article url: #{response.parse(:json)["articles"][0]["url"]}"
end
