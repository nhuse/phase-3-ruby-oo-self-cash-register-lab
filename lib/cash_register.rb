require 'pry'

class CashRegister
    attr_accessor :total, :discount, :last_item

    def initialize(discount=0)
        @total = 0
        @itemsArr = []
        @discount = discount
    end

    def add_item(title, price, quantity=1)
        @last_item = title
        @price = price
        i = 0
        while i < quantity
            @itemsArr.push(title)
            i += 1
        end

        self.total = @total += price*quantity
    end

    def apply_discount
        self.total = total - (@total * (@discount.to_f / 100))
        @discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{@total.to_int}."
    end

    def items
        @itemsArr
    end

    def void_last_transaction
        self.total = @total - @price
        new_arr = @itemsArr.filter do |item|
            !(item == @last_item)
        end
        if new_arr.length == 0
            @total = 0.0
        end
    end
end