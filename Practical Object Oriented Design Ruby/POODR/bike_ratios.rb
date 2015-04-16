module GearRatio
	class RatioConstructor

		attr_accessor :chainring, :cog
		attr_reader :results

		def initialize(chainring, cog)
			@chainring = chainring
			@cog = cog
			@results = Array.new
		end

		def calculate_ratio
			ratio = @chainring / @cog.to_f
			#TODO - store ratio in array
		end
	end
end


require 'minitest/autorun'
require 'minitest/pride'


class RatioConstructorTest < Minitest::Test 

	def setup
		@ratio_constructor = 
		GearRatio::RatioConstructor.new(52, 11)
	end

	def test_that_properties_are_accessible
		assert_equal @ratio_constructor.chainring, 52
		assert_equal @ratio_constructor.cog, 11
		assert_instance_of Array, @ratio_constructor.results
	end

	def can_calculate_ratios
		test_number = 4.72727272727273
		assert_equal @ratio_constructor.calculate_ratio, test_number
	end

	def can_store_ratios
		#TODO
	end

end