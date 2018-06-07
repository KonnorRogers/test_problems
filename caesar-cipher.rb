# .map will create a new array with numbers instead of letters
class CaesarCipher
  def caesar_cipher(input:, shift:)
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
    # account for the case of blank spaces, exclamations etc

    # converts "a" - "z" shift amounts
    if letter_value >= 97 && letter_value <= 122
      shift_amount -= 26 until shift_amount <= 26 && shift_amount >= 1

      letter_value += shift_amount
    end

    # converts "A" - "Z" shifts
    if letter_value >= 65 && letter_value <= 90
      shift_amount -= 26 until shift_amount <= 26 && shift_amount >= 1

      letter_value += shift_amount
    end

    # p new_letter_value.chr
    letter_value.chr
  end

  def create_word(input: nil, shift_amount: nil)
    ciphered_string = ''

    puts 'Word to shift'
    input = gets.chomp.to_s if input.nil?

    puts 'Amount to shift'
    loop do
      shift_amount ||= gets.chomp.to_i
      if shift_amount.is_a?(Integer)
        if shift_amount < 26
          return ciphered_string = caesar_cipher(input: input, shift: shift_amount)
        end
      else
        puts 'Improper input, enter an integer'
      end
    end
  end
end

# word = CaesarCipher.new
# puts word.create_word

# how to shift the word from the command line
# uncomment the above 2 lines and the code will ask for a word and will shift the word
