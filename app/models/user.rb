class User < ActiveRecord::Base
	
	validates :email, presence:true, uniqueness:true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
	validates :password, length: {in: 6..20}
	validates :role, inclusion: {in: %w(admin student teacher)}
	
	has_secure_password

	has_many :notes, foreign_key:"author_id"

	ROLES = %w(admin student teacher)

end
