require "tty-prompt"
require "http"
require "tty-font"
require "pastel"
require "tty-spinner"

system "clear"

pastel = Pastel.new
font = TTY::Font.new(:doom)
puts pastel.cyan(font.write("NEWS YOU CAN USE", letter_spacing: 2))
prompt = TTY::Prompt.new(active_color: :magenta)
input_news = prompt.select("🌟pick your topic🌟", %w(Cybersecurity Octopuses Soccer))

if input_news == "Cybersecurity"
  response = HTTP.get("https://newsapi.org/v2/everything?q=#{input_news}&apiKey=9b61b158304d4bdd843e941147535552")
  symbol = "💻"
elsif input_news == "Octopuses"
  response = HTTP.get("https://newsapi.org/v2/everything?q=#{input_news}&apiKey=9b61b158304d4bdd843e941147535552")
  symbol = "🐙"
elsif input_news == "Soccer"
  response = HTTP.get("https://newsapi.org/v2/everything?q=#{input_news}&apiKey=9b61b158304d4bdd843e941147535552")
  symbol = "⚽"
end
puts "Total articles on #{input_news.downcase}: #{response.parse(:json)["totalResults"]}"
puts "Top article source: #{response.parse(:json)["articles"][0]["source"]["name"]}"
puts "Top article description: #{response.parse(:json)["articles"][0]["description"]}"
puts "Top article url: #{response.parse(:json)["articles"][0]["url"]}"

puts pastel.cyan("---  ---  ---  ---  --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
puts pastel.cyan("#{symbol} --- #{symbol} --- #{symbol} --- #{symbol} --- #{symbol} --- #{symbol}")
puts pastel.cyan("---  ---  ---  ---  --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")

puts "🪩 pick a number 🪩!"
number = gets.chomp
prompt = TTY::Prompt.new(active_color: :green)
input_type = prompt.select("🔮pick your category🔮", %w(Trivia Math))

if input_type == "Trivia"
  response = HTTP.get("http://numbersapi.com/#{number}/#{input_type.downcase}?json")
elsif input_type == "Math"
  response = HTTP.get("http://numbersapi.com/#{number}/#{input_type.downcase}?json")
end
puts response.parse(:json)["text"]

puts pastel.cyan("---  ---  ---  ---  --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
puts pastel.cyan("#{symbol} --- #{symbol} --- #{symbol} --- #{symbol} --- #{symbol} --- #{symbol}")
puts pastel.cyan("---  ---  ---  ---  --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")

prompt = TTY::Prompt.new(active_color: :black)
input_quote = prompt.select("🩸pick your poison🩸", %w(Advice Stoicism Jargon))
spinner = TTY::Spinner.new("[:spinner] Loading Wisdom ...", format: :pulse_2)
spinner.auto_spin
sleep(2)
spinner.stop("Done!")
if input_quote == "Advice"
  response = HTTP.get("https://api.adviceslip.com/advice")
  puts response.parse(:json)["slip"]["advice"]
elsif input_quote == "Stoicism"
  response = HTTP.get("https://api.themotivate365.com/stoic-quote")
  author = response.parse(:json)["author"]
  quote = response.parse(:json)["quote"]
  puts "'#{quote}' -- #{author}"
elsif input_quote == "Jargon"
  response = HTTP.get("https://techy-api.vercel.app/api/json")
  puts response.parse(:json)["message"]
end
sleep(1.5)
puts pastel.cyan(font.write("TILL NEXT TIME", letter_spacing: 2))
