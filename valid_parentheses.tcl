# valid_parentheses.tcl

proc is_valid {s} {
    set stack {}
    # Hash to match closing and opening brackets
    array set pairs {')' '(' '}' '{' ']' '['}
    
    foreach char [split $s ""] {
        if {[lsearch [array names pairs] $char] >= 0} {
            # If closing bracket, check if it matches the last opened one
            if {[llength $stack] == 0 || [lindex $stack end] ne [dict get $pairs $char]} {
                return "false"
            }
            # Pop the last element (match found)
            lpop stack
        } else {
            # If opening bracket, push it to the stack
            lappend stack $char
        }
    }
    
    return [expr {[llength $stack] == 0 ? "true" : "false"}]
}

# Example usage
set s "([{}])"
puts "Is valid? [is_valid $s]"  # Should return "true"
