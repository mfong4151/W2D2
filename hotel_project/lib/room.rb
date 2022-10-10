class Room

    def initialize(capacity)
        @capacity = capacity
        @occupants = []

    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        return false if @occupants.length < capacity
        true
    end
    
    def available_space
        return @capacity - @occupants.length
    end

    def add_occupant(s)
        if !self.full?
            @occupants << s
            return true
        end
        
        false
    end
end