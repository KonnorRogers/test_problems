# .map will create a new array with numbers instead of letters

def caesar_cipher(input, shift)
  final_string = ''
  ascii_values = input.chars.map(&:ord)
  # creates an array of chars
  # converts each letter to an array of ascii values

  ascii_values.each do |ascii_value|
    final_string += shift_logic(ascii_value, shift)
    # shift & then convert to char
  end

  final_string
end

def shift_logic(letter_value, shift_amount)
  new_letter_value = letter_value
  # account for the case of blank spaces, exclamations etc

  # converts "a" - "z" shift amounts
  if letter_value >= 97 && letter_value <= 122
    new_letter_value = if letter_value + shift_amount > 122
                         letter_value + shift_amount - 25
                       # only works if shift amount < 25
                       else
                         letter_value + shift_amount
                       end
  end

  # converts "A" - "Z" shifts
  if letter_value >= 65 && letter_value <= 90
    new_letter_value = if letter_value + shift_amount > 90
                         letter_value + shift_amount - 25

                       # only works with shift amounts < 25
                       else
                         letter_value + shift_amount
                       end
  end

  # p new_letter_value.chr
  new_letter_value.chr
end

ciphered_string = ''

puts 'Word to shift'
input = gets.chomp.to_s

puts 'Amount to shift'
loop do
  shift_amount = gets.chomp.to_i
  if shift_amount.is_a?(Integer)
    if shift_amount < 26
      ciphered_string = caesar_cipher(input, shift_amount)
      break
    else
      puts 'Please enter values 25 & under'
    end
  else
    puts 'Improper input, enter an integer'
  end
end

puts ciphered_string
