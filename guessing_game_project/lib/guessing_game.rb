class GuessingGame
    def initialize(mn, mx)
        @secret_num = rand(mn..mx)
        @num_attempts = 0
        @game_over = false

    end


    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end
     
    def check_num(num)
        @num_attempts += 1

        if num == @secret_num
            p 'you win'
            @game_over = true
        
        elsif num > @secret_num
            p 'too big'

        else
            p 'too small'
        end
    end

    def ask_user
        p 'enter a number'
        ui = gets.chomp.to_i
        check_num(ui)

    end

end
