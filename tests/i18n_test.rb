require "minitest/autorun"

class I18nTest < Minitest::Test
  def test_switching_locale
    item = Item.new
    I18n.locale = 'pl'
    assert !item.valid?
    assert_equal ['nazwa nie może być puste', 'cena musi być liczbą'], item.errors
    I18n.locale = 'en'
    item.valid?
    assert_equal ["name can't be blank", "price must be number"], item.errors
  end
end
