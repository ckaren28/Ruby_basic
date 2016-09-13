require_relative 'bankaccount'
RSpec.describe BankAccount do
    before do
        @bank = BankAccount.new
    end
    it " has a method for retrieving checking account balance" do
        expect(@bank.account_checking).to eq(100)
    end
    it "has a method that retrieves the total account balance" do
        expect(@bank.account_savings).to eq(100)
    end
    it "has a method that allows the user to withdraw cash" do
        expect(@bank.withdraw(5, 'checking')).to eq("You have withdrawn $5 from your checking's account")
    end
    it "raises an error if a user tries to withdraw more money than they have in the account" do
        expect(@bank.withdraw(1000, 'checking')).to eq("insufficient funds")
    end
    it "raises an error when the user tries to print out how many bank accounts there are" do
        expect{@bank.num_of_accounts}.to raise_error(NoMethodError)
    end
    it "raises an error when the user tries to set the interest rate" do
        expect{@bank.interest_rate(0.01)}.to raise_error(NoMethodError)
    end
    it "raises an error when the user tries to set any attribute" do
        expect{@bank.sbalance(100000000)}.to raise_error(ArgumentError)
    end

end
