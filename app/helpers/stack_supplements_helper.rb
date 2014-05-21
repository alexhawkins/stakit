module StackSupplementsHelper

  def x_editable_helper(pk, model, name, url, title)
    'data-xeditable="true" data-pk=#{pk} data-model=#{model} data-name=#{name} data-url=#{url} data-title=#{title}>'
  end
end