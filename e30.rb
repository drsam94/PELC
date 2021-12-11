def sumDigiFifthPowers(x)
	ret = 0
	(1..(x.to_s.length)).each {|i|
	ret += ((x % (10 ** i)) / (10 ** (i - 1))) ** 5 }
	return ret
end

ans = 0
#upper bound is sumDigiFifthPowers(999999) as it is 5 digits
#nothing less than it can have the desired property
(100..354294).each {|num| 
	if num == sumDigiFifthPowers(num)
		ans += num
	end
} 
print ans