require 'test_helper'

class HashedIdsTest < ActiveSupport::TestCase
  test 'it has a version number' do
    assert HashedIds::VERSION
  end

  test 'default minimum length' do
    assert_equal 24, HashedIds.minimum_length
  end

  test 'default salt' do
    assert_equal '', HashedIds.salt
  end

  test 'hash ID' do
    user = users(:three)
    assert_equal 'L1B6PwmloejQcndQMGAD9J0Y', user.hashid
  end

  test 'encode ID' do
    user = users(:three)
    assert_equal user.hashid, User.encode_id(user.id)
  end

  test 'decode ID' do
    user = users(:three)
    assert_equal user.id, User.decode_id('L1B6PwmloejQcndQMGAD9J0Y')
  end

  test 'to param' do
    user = users(:one)
    assert_equal user.hashid, user.to_param
  end

  test 'can look up by hash ID' do
    user = users(:one)
    assert_equal user, User.find_by_hashid(user.hashid)
  end

  test 'can look up by hash ID with find_by_hashid!' do
    user = users(:one)
    assert_equal user, User.find_by_hashid!(user.hashid)
  end

  test 'can look up by hash ID with exception' do
    assert_raise ActiveRecord::RecordNotFound do
      User.find_by_hashid!('unknown')
    end
  end

  test 'overriden finders' do
    user = users(:one)
    assert_equal user, User.find(user.hashid)
  end

  test 'overriden finders with multiple args' do
    user = users(:one)
    user2 = users(:two)
    assert_equal [user, user2], User.find(user.hashid, user2.hashid)
  end

  test 'find looks up the correct model' do
    user = users(:one)
    assert_equal user, HashedIds.find(user.hashid)
  end

  test 'find with invalid hash ID' do
    assert_nil HashedIds.find('unknown')
  end

  test 'can use a custom salt' do
    default_encoder = HashedIds::HashId.new(User)
    custom_encoder = HashedIds::HashId.new(User, salt: 'colibrí')

    default = default_encoder.encode(1)
    custom = custom_encoder.encode(1)

    assert_not_equal default, custom
    assert_equal default_encoder.decode(default), custom_encoder.decode(custom)
  end
end
