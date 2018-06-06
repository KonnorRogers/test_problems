dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#   => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#   > substrings("below", dictionary)
#   => { "below" => 1, "low" => 1 }

def substrings(input, words_array)
  word_count = {}

  input.downcase!
  string_array = input.split(/\W/)
  #splits at any special character

  string_array.each do |string|
    words_array.each do |word|
      if (string.include?(word)) #checks that the string has the word
        if (!word_count[word].nil?) #checks if the word is already in the has
          word_count[word] += 1
        else
          #if not in the hash, adds the value to the hash
          word_count.store(word, 1)
        end
      end
    end
  end
  puts word_count
end

substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)
