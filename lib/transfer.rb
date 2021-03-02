class Transfer

  attr_accessor :amount, :status, :sender, :receiver
  attr_reader 

  def initialize(sender, receiver, amount, status="pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    if sender.valid? && receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction    
    if receiver.valid? == true && sender.balance > amount && @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    elsif sender.balance < amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif receiver.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end

end
