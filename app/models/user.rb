class User < ApplicationRecord
  
  has_secure_password #passと確認をdbに依存しないでもたせられる(Gem'bcrypt'で使用できるように)
  
end
