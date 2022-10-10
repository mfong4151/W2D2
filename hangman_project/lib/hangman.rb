class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    return DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5

  end 

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(c)
    return true if @attempted_chars.include?c
    false
  end
  def get_matching_indices(c)
    (0...@secret_word.length).to_a.select{|i| @secret_word[i] == c}

  end

  def fill_indices(c, arr)
    arr.each{|i| @guess_word[i] = c}

  end


  def try_guess(c)
    if already_attempted?(c)
      p 'that has already been attempted'
      return false
    end
    @attempted_chars << c

    fills = self.get_matching_indices(c)
    self.fill_indices(c, fills)

    @remaining_incorrect_guesses -= 1 if fills == []
    true

  end

  def ask_user_for_guess
    p'Enter a char:'
    ui = gets.chomp
    return self.try_guess(ui)
    
  end

  def win?
    if @guess_word.join('') == @secret_word
      p 'WIN'
      return true
    end
  
    false
  end

  def lose?

    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    end
    false

  end

  def game_over?
    if self.win? or self.lose?
      p @secret_word
      return true
    end
    false
  end
  
end