require 'hashids'

require 'hashed_ids/version'
require 'hashed_ids/class_methods'
require 'hashed_ids/finder'
require 'hashed_ids/has_hash_id'
require 'hashed_ids/hash_id'
require 'hashed_ids/instance_methods'
require 'hashed_ids/to_param'

module HashedIds
  extend ActiveSupport::Autoload

  class Error < StandardError; end

  mattr_accessor :_hash_id
  mattr_accessor :minimum_length, default: 24
  mattr_accessor :models, default: {}
  mattr_accessor :salt, default: ''

  def self.find(id)
    self._hash_id = HashId.new if _hash_id.nil?
    klass, decoded_id = _hash_id.decode(id)
    klass&.find_by(id: decoded_id)
  end
end
