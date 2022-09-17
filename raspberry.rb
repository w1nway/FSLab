class Raspberry
  @@states = %w[absence bloom green red]

  def initialize(index)
    @index = index
    @state = @@states.first
  end

  def grow!
    i = @@states.index(@state)
    if i == 3
      puts "Малина уже созрела!"
    else
      @state = @@states[i + 1]
    end
  end

  def ripe?
    @state.eql?(@@states[3])
  end
end

class RaspberryBush

  def initialize(raspberries_amount)
    @raspberry_bash = Array.new(raspberries_amount)
    (0..raspberries_amount).each { |i|
      @raspberry_bash[i] = Raspberry.new(i)
    }
  end

  def grow_all!
    counter = 0
    while counter < @raspberry_bash.length do
      @raspberry_bash[counter].grow!
      counter += 1
    end
  end

  def ripe_all?
    counter = 0
    flag = true
    while counter < @raspberry_bash.length do
      flag = @raspberry_bash[counter].ripe?
      counter += 1
      unless flag
        break
      end
    end
    flag
  end

  def give_away_all!
    @raspberry_bash.clear
  end
end

class Human
  private(attr_reader :plant)

  def initialize(name)
    @name = name
    @plant = RaspberryBush.new(1)
  end

  def work!
    @plant.grow_all!
  end

  def harvest
    if @plant.ripe_all?
      @plant.give_away_all!
      "Congratulations, you won"
    else
      "The harvest is not ripe"
    end
  end

  def self.knowledge_base
    puts "Оh, something for a long time you were not in the garden, it's time to restore beauty"
  end
end

if __FILE__ == $PROGRAM_NAME
  Human.knowledge_base
  raspberry = RaspberryBush.new(10)
  jack_wilson = Human.new("Jack")
  jack_wilson.work!
  while jack_wilson.harvest.eql?("The harvest is not ripe") do
    jack_wilson.work!
  end
  puts jack_wilson.harvest

  #additional task
  puts "Hello, friend. What's your name?"
  name_of_user = gets.chomp

  puts "Okay, " + name_of_user.to_s + ". You can enter:"
  puts '1. To harvest raspberries if they are ripe.'
  puts '2. To work that grow up your plants.'
  puts '3. To know your knowledge base.'
  puts '4. To finish work on the garden'

  name_of_user = Human.new(name_of_user.to_s)
  loop do
    choice = gets.chomp

    if choice == '3'
      Human.knowledge_base
    elsif choice == '2'
      name_of_user.work!
      puts "Good job! Keep going!"
    elsif choice == '4'
      puts "Goodbye!"
      exit
    elsif choice == '1'
      puts name_of_user.harvest
      exit
    else
      puts "Enter a number from 1 to 4, please"
    end
  end
end

