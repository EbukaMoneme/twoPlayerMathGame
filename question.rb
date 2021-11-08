class Question
	attr_accessor :first_val, :second_val, :answer
	def initialize()
		@first_val = rand(10)
		@second_val = rand(10)
		@answer = @first_val + @second_val
	end
end