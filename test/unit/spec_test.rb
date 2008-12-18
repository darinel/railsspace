require 'test_helper'

class SpecTest < ActiveSupport::TestCase
  def setup
    @error_messages = ActiveRecord::Errors.default_error_messages
    @valid_user = users(:valid_user)
    @invalid_user = users(:invalid_user)
    @valid_spec = specs(:valid_spec)
    @invalid_spec = specs(:invalid_spec)
  end
  
  # Test saving blank spec
  def test_blank
    blank = Spec.new(:user_id => 0)
    assert blank.save, blank.errors.full_messages.join("\n")
  end
  
  def test_spec_validity
    assert @valid_spec.valid?
  end
  
  # This spec should be invalid by construstion
  def test_spec_invalidity
    assert !@invalid_spec.valid?
    attributes = [:gender, :zip_code]
    attributes.each do |attr|
      assert @invalid_spec.errors.invalid?(attr)
    end
  end
  
  # TODO: Add more spec tests!
end
