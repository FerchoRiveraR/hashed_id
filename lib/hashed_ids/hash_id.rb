module HashedIds
  class HashId
    attr_reader :hashids, :name

    def initialize(model = nil, salt: HashedIds.salt, minimum_length: HashedIds.minimum_length, **_options)
      @name = HashedIds.models[model.name] if model&.name.present?
      @hashids = Hashids.new(salt, minimum_length)
    end

    def encode(id)
      numbers = [id]
      numbers.unshift(@name) if @name
      @hashids.encode(numbers)
    end

    def decode(id, fallback: false)
      fallback_value = fallback ? id : nil
      return [nil, fallback_value] unless id.is_a? String

      name, decoded_id = @hashids.decode(id)
      return [nil, fallback_value] if name.nil? && decoded_id.nil?

      klass = HashedIds.models.invert[name]&.constantize

      [klass, decoded_id || fallback_value]
    end
  end
end
