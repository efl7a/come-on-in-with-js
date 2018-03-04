class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :rememberable, :trackable, :validatable,
  #:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable

end
