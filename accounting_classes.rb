class Accounts
  attr_reader :balance #accessor method 'balance'
  
  def initialize(checking, savings)
    @checking = cheking
    @savings = savings
  end
  
  protected :balance
  
  def greater_balance_than(other)
    return @balance > other.balance
  end
  
  private
    def debit(account, amount)
      account.balance -= amount
    end
    def credit(account, amount)
      account.balance += amount
    end
    
  public
    #...
    def transfer_to_savings(amount)
      debit(@cheking, amount)
      credit(@savings, amount)
    end
    
  
  
end