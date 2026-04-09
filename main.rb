
#When a new game is started, your script should load 
#in the dictionary and randomly select a word between 
#5 and 12 characters long for the secret word.

googleWords = []

File.foreach("data/google-10000-english-no-swears.txt") do |line|
  word = line.chomp
  if word.length > 4 and word.length < 13
    googleWords.push(word)
  end
end

secretWord = googleWords.sample
p secretWord

#You don’t need to draw an actual stick figure (though 
#you can if you want to!), but do display some sort of 
#count so the player knows how many more incorrect guesses 
#they have before the game ends. You should also display 
#which correct letters have already been chosen (and their 
#position in the word, e.g. _ r o g r a _ _ i n g) and 
#which incorrect letters have already been chosen.

#   convert secretWord to array
secretChars = secretWord.chars  #"laundry" -> ["l", "a", "u", "n", "d", "r", "y"]
userCorrectGuesses = secretChars.map {|c| "_" }

unusedLetters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
usedLetters = []

#get the user guess (alhpanumeric only)
def get_user_guess(usedLetters)
  while true do
    print "Guess: "
    currGuess = gets.chomp
    if currGuess.length > 1 || !currGuess.match?(/[a-zA-Z]/)
      puts "Invalid ~"
    elsif usedLetters.include?(currGuess)
      puts "Already used letter ~"
    else
      return currGuess.downcase
    end
  end
end

currGuess = get_user_guess(usedLetters)
puts currGuess