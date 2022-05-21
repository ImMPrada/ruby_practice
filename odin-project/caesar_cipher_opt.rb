# https://www.theodinproject.com/lessons/ruby-caesar-cipher
require 'debug'

def cipher(s, gap)
  alphabet = *('a'..'z')
  max_index = alphabet.size - 1
  found = {}

  cipher = s.chars.reduce('')  do |s_cipher, letter|
    if letter == ' '

      s_cipher + letter
    else

      is_upper = false
      is_upper = true if letter.match(/[[:upper:]]/)
      
      letter = letter.downcase if is_upper

      letter_cipher = found[letter.to_sym]
      if !letter_cipher
        index_cipher = alphabet.find_index(letter) + gap
        index_cipher -= (max_index + 1) if index_cipher > max_index
  
        letter_cipher = alphabet[index_cipher]
        found[letter.to_sym] = letter_cipher
      end
      letter_cipher = letter_cipher.upcase if is_upper

      s_cipher + letter_cipher
    end
  end

  cipher
end

puts(cipher('Ey holaholaholaholaholahola e', 5))
puts(cipher('Eeeeeeeeeeeeey holaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholaholahola e', 5))
puts(cipher('Ey hola como estas', 5))