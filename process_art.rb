# INSTRUCTIONS/KEY #
# B = BACKGROUND   #
# F = FILL COLOR   #
# S1 = RECTANGLE   #
# S2 = OVAL        #
# S3 = PLUS SIGN   #
# ---------------- #
# WHEN BOOTED START BY CLICKING ANY SHAPES #

require 'ruby-processing'
class ProcessArtist < Processing::App

	def setup
		stroke(255,255,255)
		background(0,0,0)
		@pix_size
		if @pix_size.nil?
			@pix_size = 20
		end
	end

	def draw
		#nil
	end

	def key_pressed
		warn "A key was pressed! #{key.inspect.downcase}"
		if @queue.nil?
			@queue = ""
		end
		if key == "+"
			@pix_size = @pix_size + 1
		elsif key == "-"
			if @pix_size == 1
				@pix_size == 2
			else
				@pix_size = @pix_size - 1
			end
		end
		if key != "\n"
			@queue = @queue + key.downcase
		else
			warn "Time to run the command: #{@queue}"
			run_command(@queue)
			@shape = @queue.chomp
			@queue = ""
		end
	end

	def run_command(command)
		puts "Running command #{command}"
		color = command.slice(1,command.length-1)
		letters = color.split(',')
		@stroke
		if command.start_with?('b') || command.start_with?('B')
			background(letters[0].to_i,letters[1].to_i,letters[2].to_i)
		end
		if command.start_with?('f') || command.start_with?('F')
			stroke(letters[0].to_i, letters[1].to_i, letters[2].to_i)
			fill(letters[0].to_i, letters[1].to_i, letters[2].to_i)
		end
		if command.start_with?('c')
			background(letters[0].to_i,letters[1].to_i,letters[2].to_i)
		end
	end

	def mouse_pressed
		case @shape
		when "s1" then rect(mouse_x, mouse_y, @pix_size, @pix_size)
		when "s2" then oval(mouse_x, mouse_y, @pix_size, @pix_size)
		when "s3" then rect(mouse_x,25 + mouse_y, 50 + @pix_size, @pix_size)
									 rect(25 + mouse_x,mouse_y, @pix_size, 50 + @pix_size)
		else
			puts "I don't know that command"
		end
	end

	def mouse_dragged
		case @shape
		when "s1" then rect(mouse_x, mouse_y, @pix_size, @pix_size)
		when "s2" then oval(mouse_x, mouse_y, @pix_size, @pix_size)
		when "s3" then rect(mouse_x,25 + mouse_y, 50 + @pix_size, @pix_size)
									 rect(25 + mouse_x,mouse_y, @pix_size, 50 + @pix_size)
		else
			puts "I don't know that command"
		end
	end
end

ProcessArtist.new(:width => 500, :height => 500, :title => "ProcessArtist", :full_screen => false)
