# PHASE 2
def convert_to_int(str)
  begin 
    Integer(str)
  rescue ArgumentError => e
    e.message
    return nil
  end
end


# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else 
    raise BadError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError
    if maybe_fruit.downcase == "coffee"
      puts "Try again!"
      retry
    end
  rescue BadError
      puts "I don't like this."
  end 
  
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise StandardError.new("We have known each other for less than 5 years :(") if yrs_known < 5
    raise StandardError.new("You have to at least give me your name") if name.empty?
    raise StandardError.new("Tell me our favorite past time?") if fav_pastime.empty?
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

class CoffeeError < StandardError
end

class BadError < StandardError
end

