class User < ApplicationRecord
	has_secure_password
	# validates_uniqueness_of :email, :username => true{
	# message: "your email or username has been used please selected please choose another."};
	  # validates :email, uniqueness: true{
		# # 	 message:"{{value}}error" }
		# validates_uniqueness_of :email => :username,
    #   :message=>"{{value}} is already taken"
		validates_uniqueness_of :email, :message => '%{value} has already been taken'
		validates_uniqueness_of :username
end
