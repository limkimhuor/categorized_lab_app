# Create root node
root = FactoryBot.create :category, name: "root"
# Create child nodes
child1 = root.children.create name: "child1"
child2 = root.children.create name: "child2"
# Create node and connect to child node
grandchild = FactoryBot.create :category, name: "grandchild1"
grandchild.move_to_child_of child1
