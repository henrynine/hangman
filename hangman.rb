def get_random_word
  word_pool = File.readlines('hangman_words.txt')
  word_pool[rand(0..word_pool.length)].chomp
end

class Game
  def initialize
    @guesses = 10
    @word = get_random_word
    @revealed = Array.new
    @guessed = Array.new
  end

  #gets a legitimate guess from the user
  def get_guess
    loop do
      puts "Enter your guess: "
      letter = gets.chomp.downcase
      if letter.length != 1 || !(letter =~ /[a-z]/)
        puts "Please enter a single letter."
      elsif @guessed.include? letter
        puts "Please a letter you have not already guessed."
      else#valid input
        @guessed.push letter
        @guesses -= 1
        return letter
      end
    end
  end

end
