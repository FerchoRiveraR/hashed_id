module HashedIds
  module ToParam
    def to_param
      _hash_id.encode(id)
    end
  end
end
