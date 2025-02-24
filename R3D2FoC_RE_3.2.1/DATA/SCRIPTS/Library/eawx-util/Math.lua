function simple_power(base, exponent)
	if exponent == 0 then
		return 1
	end

	local result = 1

	for i = 1, exponent do
		result = result * base
	end

	return result
end

function factorial(n)
	if n == 0 then
		return 1
	else
		return n * factorial(n - 1)
	end
end

function exp_approx(a, N)
	local result = 0

	for k = 0, N do
		result = result + simple_power(a, k) / factorial(k)
	end

	return result
end

function ln_approx(x)
	local gamma = 0.5772156649 -- Euler-Mascheroni constant
	local result = 0

	for n = 1, x do
		result = result + 1 / n
	end

	return -gamma + result
end

function power(base, exponent)
	if base < 10 then
		scaled_approx = 1/4 * ln_approx(simple_power(base, 4))
	else
		scaled_approx = ln_approx(base)
	end
	return exp_approx(exponent * scaled_approx, 20)
end

-- returns the probability curve for an event that will occur
-- 50% of the time at mean_time, and tends towards 100% chance
-- at infinite time. 
-- best practice: set mean_time as an integer number of cycles
-- check current_time once per cycle or less.
function MeanTimeToHappenChance(current_time, mean_time)
	if current_time / mean_time > 9 then
		return 1 - 1 / simple_power(2, current_time / mean_time)
	else
		return 1 - power(2, -current_time / mean_time)
	end
end