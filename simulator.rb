class Goat

attr_accessor :pokes, :milk_in_udders, :name, :age, :moody
attr_writer :age, :name, :pokes, :milk_in_udders, :moody

  def initialize(age, name)
      @age = age
      @name = name
      @pokes = 0
      @milk_in_udders = 1
      @moody = false
  end

  def poke
    self.pokes = self.pokes + 1
    if self.pokes < 3
      puts "baa."
    elsif self.pokes < 9
      puts "BAAAAAAAA GO AWAY!!"
      puts "Now your goat is moody."
      puts "Let it rest for 10 seconds and it won't be moody, but it may lose some milk..."
      self.moody = true
      sleep 10
      oldmilk = self.milk_in_udders
      self.milk_in_udders = self.milk_in_udders - (0.2 * self.milk_in_udders)
      puts "Your goat has #{self.milk_in_udders} liters of milk, down from #{oldmilk} liters before you made it moody."
      self.moody = false
    else
      puts "Your goat was so annoyed at your poking (9 times!) it ran away. (sob) Try to be nicer to your farm animals :[."
    end
  end
  def milk
    self.milk_in_udders = self.milk_in_udders / 2.0
    puts "You have milked #{self.milk_in_udders} liters of milk from #{self.name}'s original #{self.milk_in_udders * 2} liters of milk."
  end
  def feed(type)
    if type.downcase == "grass"
      self.milk_in_udders = self.milk_in_udders + 0.3
      puts "Fed #{self.name} some grass, gained .3 Liters of milk."
    elsif type.downcase == "muesli"
      self.milk_in_udders = self.milk_in_udders + 0.4
      puts "Fed #{self.name} some muesli, gained .4 Liters of milk."
    elsif type.downcase == "tofurkey"
      puts "Fed #{self.name} some tofurkey, gained .3 Liters of milk."
      self.milk_in_udders = self.milk_in_udders + 0.3
    else
      self.milk_in_udders = self.milk_in_udders - (self.milk_in_udders * 0.1)
      puts "You fed your goat #{type}, which made it throw up and lose .1 liters of milk! Next time feed it grass, muesli, or tofurkey, the only three foods it eats."
  end
  puts "#{self.milk_in_udders} L of milk is ready to be milked."
end



  def input
    sleep 2
  puts "What's next?"
  puts "0. End program."
  puts "1. Poke your goat."
  puts "2. Milk your goat."
  puts "3. Feed your goat."
  puts "4. Let your goat run around."
  puts "5. Let your goat take a nap."
  puts "6. Check your goat's status."
  input = gets.chomp
  if input == "1"
    # poke the goat
    self.poke
  elsif input == "2"
    # milk the goat
    self.milk
  elsif input == "3"
    # feed the goat
    puts "What kind of food do you want to feed #{self.name}? (S)he likes grass, muesli, and tofurkey."
    food = gets.chomp
    self.feed(food)
  elsif input == "0"
    # end the program, retire the goat.
    puts "#{self.name} lived a happy goat life and has retired out to pasture. You may be sad, but remember: your goat was amazing. Thanks for playing this mini text-based goat simulator."
    return
  elsif input == "4"
    # let the goat run around and do stuff.
    puts "Your goat is running around, it'll be back soon though."
    sleep 2
    puts "Meanwhile, entertain yourself with some gifs."
    sleep 0.2
    puts "Here's one amazing goat gif: i.imgur.com/JyJEZ8l.gif (copy and paste that to your browser)."
    sleep 11
    puts "Goat gif number two here: i.imgur.com/fGZ3jIU.gif"
    sleep 10
    puts "And here's your last goat gif... bit.ly/294hFnl"
    sleep 7
    puts "Goat approaching..."
    sleep 9
    self.milk_in_udders = self.milk_in_udders + 0.5
    self.moody = false
    self.pokes = 0
    puts "#{self.name} has returned. You gained a half-liter of milk, bringing your current milk count to #{self.milk_in_udders} liters. Your goat is happy now, too, and it forgot about those times you poked it."
  elsif input == "5"
    # let the goat nap.
    puts "Your goat is taking a nap. Give it at least 15 seconds, or it might get moody (hint: pull out that dusty stopwatch...or just your computer's clock)!"
    start_time = Time.now
    end_time = start_time + 15
    sleep 1
    puts "Type \"wake up\" when you want to poke #{self.name} to awaken it."
    wakeup = gets.chomp
    while Time.now < end_time
      if wakeup != ""
        wakeup = ""
        puts "Meeeehh!!"
        sleep 0.5
        puts "BAAAAAAAAAAA!"
        sleep 0.2
        puts "Now your goat is moody."
        puts "Let it rest for another 10 seconds and it won't be moody any more."
        self.moody = true
        sleep 10
        oldmilk = self.milk_in_udders
        self.milk_in_udders = self.milk_in_udders - (0.25 * self.milk_in_udders)
        puts "Your goat is done resting, but it lost a little bit of milk from the shock of being awakened. Your goat has #{self.milk_in_udders} liters of milk, down from #{oldmilk} liters before you made it moody."
        self.moody = false
      end
    end
  while Time.now > end_time
      if wakeup != ""
        wakeup = ""
        puts "You let your goat have a good nap. It gained a little bit of milk."
        self.milk_in_udders = self.milk_in_udders + 0.1
      break
    end
  end
  elsif input == "6"
    # check the goat's status
    goatmoodiness = ""
    if self.moody == false
      goatmoodiness = "it is not moody."
    else
      goatmoodiness = "is moody right now."
    end
    puts "Your new goat is named #{self.name}, is #{self.age} years old, and has been poked #{self.pokes} times. It has #{self.milk_in_udders.to_f} liters of milk ready for milking, and #{goatmoodiness}"
  else
    # user didn't type in one of those numbers, aka an invalid input.
    puts "INVALID INPUT"
  end
  self.input
  end

end

puts "Want the backstory? Yes or no."
yesorno = gets.chomp
if yesorno.include? "y"
puts "You walk up to a flea market. You are surrounded by stalls selling sewing kits, clothing, lamps, small furniture, and useless knicknacks."
sleep 3.9
puts "You think, \"Why am I here?\""
sleep 3
puts "And that is when your eye catches on the lone stand in the back-left corner of the market."
sleep 3.5
puts "As you walk over, you get the feeling that someone is watching you..."
sleep 3.9
puts "You turn around."
sleep 2.7
puts "Your eye catches sight of the gleaming eyes: brown, milky..."
sleep 2.5
puts "The ears..."
sleep 2.5
puts "[a dense fog has settled in, and you can barely see it]"
sleep 2.9
puts "...and that's when you put the pieces together, and make out the tail..."
sleep 2.9
puts "It's a goat, and it's yours."
sleep 3.2
puts "Will you take it?"
sleep 2.1
puts "[rhetorical question, of course you will]"
sleep 2.6
puts "Where do you take it?"
sleep 2.3
puts "[to your ranch, because of course you're an aspiring farmer. Or maybe it's just your country home. Either way...]"
sleep 5
else
  #skip that story.
end
puts "So what do you name your new goat?"
name = gets.chomp
puts "And how old is #{name}?"
age = gets.chomp
new_age = age.scan(/\d/).join('')
puts "Congratulations on your new goat. You take it to the ranch, and inspect it. It's not sick! Here's your new goat's bio:"
newgoat = Goat.new(new_age, name)
goatmoodiness = ""
if newgoat.moody == false
  goatmoodiness = "it is not moody."
else
  goatmoodiness = "is moody right now."
end
puts "Your new goat is named #{newgoat.name}, is #{newgoat.age} years old, and has been poked #{newgoat.pokes} times. It has #{newgoat.milk_in_udders.to_f} liters of milk ready for milking, and #{goatmoodiness}."
puts "Now that you're back at your ranch, it's time to interact with #{newgoat.name}."

newgoat.input
