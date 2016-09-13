class BankAccount
    attr_reader :sbalance, :cbalance, :account_num
    @@num_of_accounts
    def initialize
        @cbalance = 100
        @sbalance = 100
        @account_num = rand.to_s[2..11]
        @interest_rate = 0.10
        @@num_of_accounts = 1
    end

    private
    def account_num
        puts @account_num
        self
    end
    public
    def deposit(x, type)
        if x < 0
            returns false
        end
        if type.downcase == "checking"
            @cbalance += x
        elsif type.downcase == "savings"
            @sbalance += x
        else
            puts "no such account"
        end
        puts "You have deposited $#{x} in your #{type}'s  account."
    end
    def withdraw(x, type)
        if type.downcase == 'checking'
            if x <= @cbalance
                @cbalance -= x
                "You have withdrawn $#{x} from your #{type}'s account"
            else
                "insufficient funds"
            end
        elsif type.downcase =='savings'
            if x <= @cbalance
                @cbalance -= x
                "You have withdrawn $#{x} from your #{type}'s account"
            else
                "insufficient funds"
            end
        else
            puts "cannot do transaction"
        end
    end

    def account_information
        total = @sbalance + @cbalance * @interest_rate
        puts "account number: " + @account_num.to_s
        puts "total money: $ #{total}"
        puts "savings balance: $"+ @sbalance.to_s
        puts "checking balcnce: $"+ @cbalance.to_s
        puts "interest rate: "+ @interest_rate.to_s
    end
    def account_savings
        @sbalance
    end
    def account_checking
        @cbalance
    end
end

sam = BankAccount.new
sam.withdraw(1000, 'checking')
