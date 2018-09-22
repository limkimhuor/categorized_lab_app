class Category < ApplicationRecord
  acts_as_nested_set

  UPDATABLE_ATTRIBUTES = [:parent_id, :name, :new_postion]

  def parent_id= parent_id
    if parent_id == "#"
      move_to_root
    else
      super parent_id
    end
  end

  def new_postion= new_postion
    if parent.blank?
      prev_node = root.siblings[new_postion.to_i - 1]
      move_to_right_of prev_node
    else
      move_to_child_with_index parent, new_postion.to_i
    end
  end
end
