class User < ApplicationRecord
  include Kiqr::Models::User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
