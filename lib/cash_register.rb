require 'pry'

class CashRegister

    attr_accessor :total
    attr_reader :discount

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1) 
        @items << {name: title, price: price, quantity: quantity}
        @total += price * quantity
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        end
        @total *= ((100-@discount.to_f)/100)
        return "After the discount, the total comes to $#{@total.to_i}."
    end

    def items
        array = []
        @items.each do |hash|
            hash[:quantity].times do
                array << hash[:name]
            end
        end
        return array
    end

    def void_last_transaction
        removed_item = @items.pop
        @total -= removed_item[:price] * removed_item[:quantity]
        if !@items
            return 0.0
        else
            return @items
        end
    end

end
