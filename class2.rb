class Customer
   @@no_of_customers=1
   def initialize(id, name, addr)
      @cust_id=id
      @cust_name=name
      @cust_addr=addr
   end
   def display_details()
      puts "고객 id는 #@cust_id 이고 고객 이름은 #@cust_name 고객 주소는 #@cust_addr"

    end
    def total_no_of_customers()
       @@no_of_customers += 1
       puts "Total number of customers: #@@no_of_customers"
    end
end

cust1=Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
cust2=Customer.new("2", "Poul", "New Empire road, Khandala")
new3 = Customer.new("3","Jane","MSG, Korea")
puts "cust1 action"
cust1.display_details()
puts "cust2 action"
cust2.total_no_of_customers()
puts "cust3 action"
new3.display_details()