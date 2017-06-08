require 'byebug'
class PolyTreeNode
  attr_reader :children, :value, :parent

  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end

  def children=(arr_of_nodes)
    @children = arr_of_nodes
  end

  def parent=(node)
    self.parent.children.delete(self) if self.parent

    if node && !node.children.include?(self)
      node.children += [self]
    end

    @parent = node
  end

  def remove_child(child_node)
    if child_node.parent.nil?
      raise "Specified Node has no parent"
    end
    child_node.parent = nil
  end

  def add_child(child_node)
    unless @children.include?(child_node)
      child_node.parent = self
    end
  end

  def dfs(target_value)
    return self if self.value == target_value
    children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if target_value == node.value
      queue.concat(node.children)
    end
    nil
  end

end

if __FILE__ == $PROGRAM_NAME
  p a_node = PolyTreeNode.new("a")
  p my_node = PolyTreeNode.new("f")
  p their_node = PolyTreeNode.new("g")
  p top_node = PolyTreeNode.new("alpha_soup")
  p my_node.parent = top_node
end
