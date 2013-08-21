class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # 
  # 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :token_authenticatable,          
         :lockable, :timeoutable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :cell, :aboutme, :year

has_many :rides
has_many :requests
has_many :profiles, :dependent => :destroy
has_and_belongs_to_many :roles

def role?(role)
   return !!self.roles.find_by_name(role.to_s)
 end

 before_create :setup_role
private
def setup_role
  if self.role_ids.empty?
    self.role_ids = [2]
  end
end
end
