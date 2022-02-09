class User < ActiveRecord::Base

  before_validation 

  validates_uniqueness_of :email, :case_sensitive => false
  has_secure_password
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: {minimum: 3}
  def self.authenticate_with_credentials(email, password)
    striped_email = email.strip
    user = User.where('lower(email) = ?', striped_email.downcase).first
    puts "ref to user #{user}"
    if(user)
      if(!user.authenticate(password))
        user = nil
      end
    end
    return user
  end

end
