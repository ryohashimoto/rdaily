module Rdaily
  class CategorizationBuilderException < StandardError; end
end

class CategorizationBuilder
  def initialize(model)
    raise Rdaily::CategorizationBuilderException unless model.categorizations
    @model = model
  end
  
  def build_from(category_ids)
    return unless category_ids
    check_category_ids(category_ids)
    category_ids.each do |category_id|
      raise Rdaily::CategorizationBuilderException unless category_id.is_a?(Integer) && Category.find(category_id)
      categorization = @model.categorizations.build
      categorization.category_id = category_id
      categorization.save!
    end
  end
  
  def update_from(category_ids)
    prev_category_ids = @model.categories.map(&:id)
    (category_ids - prev_category_ids).each do |category_id|
      categorization = @model.categorizations.build
      categorization.category_id = category_id
      categorization.save!
    end
    (prev_category_ids - category_ids).each do |category_id|
      categorization = @model.categorizations.find_by_category_id(category_id)
      categorization.destroy
    end
  end
  
  private
  def check_category_ids(category_ids)
    raise Rdaily::CategorizationBuilderException unless category_ids.instance_of?(Array)
  end
end