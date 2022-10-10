require "employee"

class Startup

    def initialize(name, funding, salaries)
        @name, @funding, @salaries, @employees = name, funding, salaries, []

    end

    def name
        @name
    end

    def funding
        @funding 
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        return true if @salaries.has_key?title
        false
    end

    def >(other_startup)
        return true if @funding > other_startup.funding
        false
    end

    def hire(employee_name, title)
        if valid_title?title
            @employees << Employee.new(employee_name, title)
        
        else
            raise ArgumentError.new "THAT TITLE IS INVALID!"
        
        end
    
    end


    def size
        @employees.length
    end

    def pay_employee(employee_inst)

        payment_amt = @salaries[employee_inst.title]

        if @funding - payment_amt < 0
            raise ArgumentError.new "YOU HAVE NO MONEY"
        else
            employee_inst.pay(payment_amt)
            @funding -= payment_amt
        end

    end

    def payday
        @employees.each {|emp| self.pay_employee(emp)}
    end

    def average_salary
        avg_salary = 0
        @employees.each {|i| avg_salary += @salaries[i.title]}
        return avg_salary/@employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        @employees += other_startup.employees

        other_startup.salaries.each{|title, salary| @salaries[title] = salary if !@salaries.has_key?title }
        other_startup.close
    end
end
