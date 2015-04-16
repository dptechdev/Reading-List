module POODR
	class Gear
		attr_reader :chainring, :cog, :rim, :tire
		def initialize(chainring, cog, rim, tire)
			@chainring = chainring
			@cog = cog
			@rim = rim
			@tire = tire
		end

		def ratio
			@chainring / @cog.to_f
		end

		def gear_inches
			#tire goes around rim twice for diameter
			ratio * (rim + (tire * 2))
		end
	end
end

puts POODR::Gear.new(52, 11, 26, 1.5).gear_inches

require 'minitest/autorun'
require 'minitest/pride'

class GearTest < Minitest::Test 
	def setup
		@gear = POODR::Gear.new(52, 11, 26, 1.5)
	end

	def test_that_properties_are_read_only
		assert_equal 52, @gear.chainring
		assert_raises(NoMethodError){@gear.chainring = 52}
	end

	def test_that_ratio_is_calculated
		assert_equal 4.7272727272727275, @gear.ratio
	end

	def test_that_gear_inches_is_calculated
		assert_equal 137.0909090909091, @gear.gear_inches
	end
end