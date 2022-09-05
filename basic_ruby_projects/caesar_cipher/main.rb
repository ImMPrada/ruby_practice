# https://www.theodinproject.com/lessons/ruby-caesar-cipher

puts 'Caesar Cipher'

ALPHABET = ('a'..'z').to_a
MEMORY = {}

def change_letter(letter, shift)
  return MEMORY[letter] if MEMORY.key?(letter)

  current_index = ALPHABET.find_index(letter)
  new_index = (current_index + shift) % 26
  new_letter = ALPHABET[new_index]
  MEMORY[letter] = new_letter

  new_letter
end

def caesar_cipher(string, shift)
  string.split('').map do |char|
    if ALPHABET.include?(char)
      change_letter(char, shift)
    else
      char
    end
  end.join
end
