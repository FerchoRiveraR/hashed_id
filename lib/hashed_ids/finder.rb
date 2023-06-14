module HashedIds
  module Finder
    def find(*ids)
      super(*ids.map { |id| _hash_id.decode(id, fallback: true).last })
    end
  end
end
