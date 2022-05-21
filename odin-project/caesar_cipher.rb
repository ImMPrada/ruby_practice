# https://www.theodinproject.com/lessons/ruby-caesar-cipher
require 'debug'

def cipher(s, gap)
  alphabet = *('a'..'z')
  max_index = alphabet.size - 1

  cipher = s.chars.reduce('')  do |s_cipher, letter|
    if letter == ' '
      s_cipher + letter
    else

      is_upper = false
      is_upper = true if /[[:upper:]]/.match(letter)

      letter.downcase! if is_upper

      index_cipher = alphabet.find_index(letter) + gap
      index_cipher -= (max_index + 1) if index_cipher > max_index

      letter_cipher = alphabet[index_cipher]
      letter_cipher.upcase! if is_upper

      s_cipher + letter_cipher
    end
  end

  cipher
end

puts(cipher('Ey hola', 5))
puts(cipher('Ey hola', 6))
puts(cipher('Ey hola', 0))
puts(cipher('Ey hola', 2))