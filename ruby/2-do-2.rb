puts "The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface."
puts "Let the initializer accept a nested structure with hashes and arrays."
puts "You should be able to specify a tree like this:"
puts "     {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }."

class Tree
	attr_accessor :node_name, :children

	def initialize(tree)
		puts "Initializing " + tree.keys[0]
		# presume that there is always a single top-level key
		@node_name = tree.keys[0]
		@children = tree[node_name].collect do |k, v|
			Tree.new({k => tree[node_name][k]})
		end
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

ruby_tree = Tree.new({'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } })

puts "Visit a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "Visit entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
puts
