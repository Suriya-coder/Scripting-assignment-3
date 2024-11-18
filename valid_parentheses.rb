# valid_parentheses.rb

def is_valid(s)
  stack = []
  # Hash to match opening and closing brackets
  pairs = { ')' => '(', '}' => '{', ']' => '[' }
  
  s.chars.each do |char|
    if pairs.values.include?(char)
      stack.push(char)  # If it's an opening bracket, push to stack
    elsif pairs.keys.include?(char)
      # If it's a closing bracket, check if it matches the last opened one
      return false if stack.empty? || stack.pop != pairs[char]
    end
  end
  
  stack.empty?  # Valid if no unmatched opening brackets remain
end

# Example usage
s = "([{}])"
puts "Is valid? #{is_valid(s)}"  # Should return true
