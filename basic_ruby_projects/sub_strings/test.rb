require './basic_ruby_projects/sub_strings/main'

dictionary = %w[below down go going horn how howdy it i low own part partner sit].freeze

puts substrings('below', dictionary)
puts substrings("Howdy partner, sit down! How's it gogoinggo?", dictionary)
