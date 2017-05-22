class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_format_of :email, with: /\@kipusystems\.com/,
                              message: "You need a kipusystems.com email!"
end
