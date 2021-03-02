class BankAccount

    attr_accessor :balance, :status, :deposit, :valid, :withdraw
    attr_reader :name 

    @@all = []

    def initialize(name, balance=1000, status="open")
        @name = name
        @balance = balance
        @status = status

        @@all << self
    end

    def deposit(deposit)
        @balance += deposit
    end

    def withdraw(withdraw)
        @balance -= withdraw
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.balance > 0 && self.status == "open"
            true
        else 
            false
        end
    end

    def close_account
        self.status = "closed"
    end

    def self.all
        @@all
    end

end
