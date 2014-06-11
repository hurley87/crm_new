class Contact
	attr_accessor :id, :first_name, :last_name, :email, :note, :rating
	def initialize(first_name, last_name, email, note, rating)
	    @first_name = first_name
	    @last_name = last_name
	    @email = email
	    @note = note
	    @rating = rating
  	end
end