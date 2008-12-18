require 'test_helper'

class FaqTest < ActiveSupport::TestCase
  fixtures :faqs
  # Replace this with your real tests.
  def test_truth
    assert true
  end
  
  def setup
    @valid_faq = faqs(:valid_faq)
  end
  
  def test_max_lengths
    Faq::QUESTIONS.each do |question|
      assert_length :max, @valid_faq, question, DB_TEXT_MAX_LENGTH
    end
  end  
end
