module HashedIds
  module ClassMethods
    def encode_id(id)
      _hash_id.encode(id)
    end

    def decode_id(id)
      _klass, id = _hash_id.decode(id, fallback: true)
      id
    end

    def find_by_hashid(id)
      find_by(id: _hash_id.decode(id).last)
    end

    def find_by_hashid!(id)
      find_by!(id: _hash_id.decode(id).last)
    end

    def relation
      super.tap { |r| r.extend ClassMethods }
    end

    # rubocop:disable Naming/PredicateName
    def has_many(*args, &block)
      options = args.extract_options!
      options[:extend] = Array(options[:extend]).push(ClassMethods)
      super(*args, **options, &block)
    end
    # rubocop:enable Naming/PredicateName
  end
end
