
max = 0
(100..999).each {|x| (100..999).each{|y| 
    if (x*y).to_s.reverse == (x*y).to_s
        max = max < (x*y) ? x*y : max
    end
    }}
print max.to_s
