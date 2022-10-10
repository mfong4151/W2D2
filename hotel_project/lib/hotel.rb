require_relative "room"

class Hotel
  
    def initialize(name, places)
        @name = name
        @rooms = {}
        places.each{|k, v| @rooms[k] = Room.new(v)}

    end


    def name
        @name.split.map!{|s| s[0].upcase + s[1..-1]}.join(' ') 
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        return true if @rooms.has_key?room_name
        false
    end

    def check_in(person, room_name)
        if !self.room_exists?room_name
            p 'sorry, room does not exist'

        else
            
            if @rooms[room_name].add_occupant(person)
                p 'check in successful'

            else
                p 'sorry, room is full'
            end

        end

    end

    def has_vacancy?

        return false if @rooms.all?{|room_name, room_inst| room_inst.full? }
        
        
       
        true

    end

    def list_rooms

        @rooms.each {|room_name, room_inst| puts room_name + ' ' + room_inst.available_space.to_s}

    end

end
