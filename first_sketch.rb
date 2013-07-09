require 'ruby-processing'
class FirstSketch < Processing::App

	def setup
		background(0,0,0)
	end

	def draw
		if @size.nil? || @size == rand(200)
			@size = rand(100)
		end
		fill(rand(255), rand(255), rand(255))
		@size = @size + rand(2)

		#rect(10,10,200,200)
		rect(rand(210.8),rand(10),rand(200),rand(200))
		rect(rand(412),rand(10),rand(200),rand(200))
		rect(rand(10),rand(500),rand(200),rand(200))
		rect(rand(10),rand(250),rand(200),rand(200))


		#rect(rand(@size),rand(@size),rand(@size),rand(@size))
		#rect(rand(@size),rand(@size),rand(@size),rand(@size))
		#oval(rand(@size),rand(@size),rand(@size),rand(@size))
		#triangle(rand(@size),rand(@size),rand(@size),rand(@size),rand(@size),rand(@size))
	end
end

FirstSketch.new(:width => 800, :height => 800, :title => "FirstSketch", :full_screen => false)