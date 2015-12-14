# Julia port of https://cran.r-project.org/web/packages/entropy/
#
# entropy.MillerMadow.R
#
# Miller-Madow entropy estimator (1955)

export getentropymillermadow

"""
Calculates the Miller Madow estimate for the entropy from the
observed counts.

Parameters:

counts - dxn Array{Float64,2} - The observed counts.

base - Int - The base of the logarithm, i.e. the units.
"""
function getentropymillermadow(counts::Array{Float64,2}, base=2)
	probabilities = getprobabilitiesmaximumlikelihood(getfrequencies(counts))
	constant = (countnz(probabilities) - 1) / (2 * length(probabilities))
	return applyentropyformula(probabilities, base) + constant
end
