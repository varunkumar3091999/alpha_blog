require 'test_helper'

class ListingCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: 'sprots')
    @category2 = Category.create(name: 'travel')
  end


  test "should show categories listing" do
    get '/categories'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
end
