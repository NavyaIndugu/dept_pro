class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable


    #login_name must be unique
    has_one :profile, dependent: :destroy


    ## Nested Forms ##
    accepts_nested_attributes_for :profile,  allow_destroy: true
end
