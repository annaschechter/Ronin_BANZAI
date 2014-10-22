require_relative 'option'

class Player
	attr_accessor :name
	attr_reader :option

	def initialize
		@name
		@option = nil
	end

	def pick(option)
        @option = option
    end

    def has_played?
    	!@option.nil?
    end
end