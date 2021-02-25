# Display a menu in the console for the user to interact with.
# Create a default array of hashes that represent items at a grocery store.
# Create a menu option to add items to a user's grocery cart.
# Create a menu option to display all the items in the cart.
# Create a menu option to remove an item from the users cart.
# Create a menu option to show the total cost of all the items in the user's cart.
# Add new items to the grocery store.
# Zip it up and turn it in!

@groceries = [
  {key:1, name: "apple", price: 2},
  {key:2, name: "orange", price: 3},
  {key:3, name: "banana", price: 1}
]

@options = [
  {key:1, name: "View groceries"},
  {key:2, name: "Add grocery to cart"},
  {key:3, name: "View cart"},
  {key:4, name: "Checkout"},
  {key:5, name: "Remove item"},
  {key:6, name: "Exit"}
]

@my_cart = [

]


def display_options
  @options.each_with_index do | option, index |
    puts " #{option[:key]}) #{option[:name]}"
  end
end

def view_groceries
  @groceries.each_with_index do | grocery, index |
    puts "#{grocery[:key]}) #{grocery[:name]}, $#{grocery[:price]}"
  end
end

def add_groceries
  basket = {}
  puts "What would you like to add?"
  view_groceries
  selection = gets.chomp.to_i
  basket[:name] = @groceries[selection -1] [:name]
  basket[:price] = @groceries[selection -1] [:price]
  @my_cart << basket
  puts "You are adding 1 #{basket[:name]} to your cart."
end

def view_cart
  @my_cart.each_with_index do | item, index |
    puts "#{index + 1}) #{item[:name]}, $#{item[:price]}"
  end
end

def remove_item
  puts "What would you like to remove?"
  delete_item = gets.chomp.to_i
  @my_cart.delete_at(delete_item -1)
  view_cart
end

def checkout
  total = 0
  @my_cart.each do |item|
    total += item[:price].to_i
  end
  puts "Your total is $#{total}"
end

def display_menu
  puts "---------------------------"
  puts "What would you like to do?"
  display_options
  choice = gets.chomp.to_i

  case choice
    when 1
      puts
      view_groceries
      puts
      display_menu
    when 2
      puts
      add_groceries
      puts
      display_menu
    when 3
      puts
      view_cart
      puts
      display_menu
    when 4
      puts
      view_cart
      checkout
      puts
    when 5
      puts
      view_cart
      remove_item
      puts
      display_menu
    when 6
      puts
      puts "Goodbye"
      puts
      exit
    else
      puts
      puts "That is not an option: try again"
      puts
      display_menu
  end

end

display_menu