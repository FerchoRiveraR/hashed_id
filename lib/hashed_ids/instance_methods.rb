module HashedIds
  module InstanceMethods
    def hashid
      self.class.encode_id(id)
    end
  end
end
