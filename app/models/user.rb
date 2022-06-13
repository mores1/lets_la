class User < ApplicationRecord
    
    has_many :spots, dependent: :destroy
    has_secure_password #dbに依存せずpass+confirmpass使用可能に(Gem'bcrypt'で使用できるようになっている)
end
