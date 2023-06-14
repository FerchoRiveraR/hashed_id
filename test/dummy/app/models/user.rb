class User < ApplicationRecord
  has_many :posts

  has_hash_id
end
