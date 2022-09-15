class Raspberry 
	attr_reader :@@states = ["absence", "bloom", "green", "red"]
  
	def initialize(index)
		@index = index
		@state = states[0]
end

	def grow!
		i = states.index('c')
		@state = states[i + 1]
	end

	def ripe?
		if @state == states[3]
			true
		else
			false
		end
	end
end

class RaspberryBush
	def initialize(berries)
		@raspberries = Array.new(berries)
		for i in 0..berries do
			raspberries[i] = Raspberry.new(i)
		end
		@raspberry_bush = raspberries
		@raspberry_bush
	end
  
	def grow_all!
		raspberry_list = initialize(berries)
		for i in @raspberry_list
			@level = raspberry_list[i].states.index('c')
			raspberry_list[i].states[@level + 1]
		end
	end

	def ripe_all?
		raspberry_list = initialize(berries)
		for i in raspberry_list
			if raspberry_list[i].states = "red"
				true
			else
				false
			end
		end
	end

	def give_away_all!(berries)
		berries.clear
		berries
	end
end

class Human 
	def initialize
		@name = name
		@plant = RaspberryBush.new(berries)
	end

	def work!(raspberry_bush)
		raspberry_bush.grow!
	end

	def harvest(berries)
		for i in berries
			while berries[i].@@states == "red" do
				i += 1
			else
				puts "Малина недозрела!"
				break
			end
			give_away_all!(berries)
		end
	end

	def knowledge_base(berries)
		counter_of_red_raspberries = 0
		for i in 0..berries do
			if raspberry_list[i].states == "red"
				counter_of_red_raspberries += 1
			end
		end
		return "Количество спелой малины: " + counter_of_red_raspberries.to_s
	end
end

class Main
	human_1 = Human.new()
	raspberry_1 = Raspberry.new(1)
	raspberry_2 = Raspberry.new(2)
	raspberry_3 = Raspberry.new(3)
	raspberries = RaspberryBush.new(raspberry_1, raspberry_2, raspberry_3)
end

#tab
