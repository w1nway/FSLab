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
    @plant = RaspberryBush.new(5)
  end

  def work!
    @plant.grow_all!
  end

  def harvest
    if @plant.ripe_all?
      @plant.give_away_all!
      "Gardener finished work"
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
end

