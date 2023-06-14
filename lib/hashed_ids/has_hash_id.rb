module HashedIds
  module HasHashId
    def has_hash_id(override_find: true, override_param: true, **options)
      class_attribute :_hash_id

      extend HashedIds::ClassMethods
      include HashedIds::InstanceMethods

      extend HashedIds::Finder if override_find
      include HashedIds::ToParam if override_param

      self._hash_id = HashedIds::HashId.new(self, **options)
    end
  end
end

require 'active_support'
ActiveSupport.on_load :active_record do
  extend HashedIds::HasHashId
end
