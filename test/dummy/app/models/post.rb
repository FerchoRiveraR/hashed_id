class Post < ApplicationRecord
  belongs_to :user

  has_hash_id
end
