module ApplicationHelper
  include Pagy::Frontend
  def translate_enum(model, enum_key, key)
    model.human_attribute_name("#{enum_key}.#{key}")
 end
 
end
