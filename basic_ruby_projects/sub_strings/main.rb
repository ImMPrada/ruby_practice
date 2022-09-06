# https://www.theodinproject.com/lessons/ruby-sub-strings

puts 'Sub strings'

def substrings(text, dictionary)
  matches = {}

  dictionary.each do |key|
    matches_count = text.scan(/(#{key})/ix).size

    matches[key] = (matches[key] || 0) + matches_count if matches_count.positive?
  end

  matches
end
