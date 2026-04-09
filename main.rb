
#When a new game is started, your script should load 
#in the dictionary and randomly select a word between 
#5 and 12 characters long for the secret word.

googleWords = []

File.foreach("data/google-10000-english-no-swears.txt") do |line|
  if line.length > 4 and line.length < 12
    googleWords.push(line)
  end
end

secretWord = googleWords.sample

puts secretWord