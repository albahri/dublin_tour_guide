class BasicGuide
	def initialize(cost, place, date, time, language)
		@cost = 50
		@place = place
		@date = date
		@time = time
		@language = language
	end

	#getter method
	def cost
		return @cost
	end 

	def place
		return @place
	end

	
end

#decorator class -- this serves as the superclass for all the concrete decorators
class GuideDecorator
	def initialize(real_guide)
		@real_guide = real_guide
		@extra_cost = 0
	end

	def place
		return @real_guide.place
	end

	def cost
		return  @extra_cost + @real_guide.cost
	end

	
end 

#a concrete decorator
class  AudioGuideDecorator < GuideDecorator
	def initialize(real_guide)
		super(real_guide)
		@extra_cost = 10
	end 

end


