# merge_two_sorted_lists.tcl

proc merge_two_lists {l1 l2} {
    set result {}
    
    # Loop through both lists and merge them
    while {[llength $l1] > 0 && [llength $l2] > 0} {
        if {[lindex $l1 0] < [lindex $l2 0]} {
            lappend result [lindex $l1 0]
            set l1 [lrange $l1 1 end]
        } else {
            lappend result [lindex $l2 0]
            set l2 [lrange $l2 1 end]
        }
    }

    # Append the remaining elements
    set result [concat $result $l1 $l2]
    
    return $result
}

# Example usage
set l1 {1 2 4}
set l2 {1 3 4}

set merged [merge_two_lists $l1 $l2]
puts "Merged List: $merged"
