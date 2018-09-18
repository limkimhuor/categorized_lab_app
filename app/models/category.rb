class Category < ApplicationRecord
  acts_as_nested_set

  UPDATABLE_ATTRIBUTES = [:parent_id, :name]
end
