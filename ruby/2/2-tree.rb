class Tree
	attr_accessor :node_name, :children

	def initialize(name, children=[])
		@node_name = name
		@children = children
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

ruby_tree = Tree.new("Ruby", [Tree.new("Reia"), Tree.new("MacRuby")])

puts "Visit a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "Visit entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
puts
