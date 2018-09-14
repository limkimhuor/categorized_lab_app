class CategorySupport
  include CollectiveIdea::Acts::NestedSet::Helper

  def initialize category
    @resource = category
  end

  def options_for_select
    nested_set_options(Category) {|i| "#{'-' * i.level} #{i.name}" }
  end
end
