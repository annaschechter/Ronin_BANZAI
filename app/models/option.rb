class Option

	attr_reader :name

	def initialize(name)
	    @name = name.to_sym
	end
end