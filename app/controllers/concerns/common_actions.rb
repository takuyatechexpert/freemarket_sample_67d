module CommonActions
  extend ActiveSupport::Concern

  def get_categories
  @category = Category.all.order("id ASC").limit(13)
  end

end
