module Walker2020Sampling

import Base:
    rand

using Random:
    AbstractRNG

using Distributions:
    Exponential

export 
    rand,
    Walker2020Sampler

"""
    Walker2020Sampler(; θ::Float64 = 20, lb::FLoat64 = -Inf, ub::Float64 = Inf)

The sampler proposed by Li & Walker (2020), with parameter `θ`, for a target distribution with support `[lb, ub]`.
"""
Base.@kwdef struct Walker2020Sampler
    lb::Float64 = -Inf
    ub::Float64 = +Inf
    θ::Float64  = 20.0
end

"""
    rand(rng::AbstractRNG, s::Walker2014Sampler, q::Function, y0, z0)

Draw the next value in a MCMC with target unnormalized log-pdf `q` using the sampler `s`, assuming that the current values of the main and auxiliary variables are `y0` and `z0`, respectively. Both `rng` and `s` are modified in the process.
"""
function rand(
        rng::AbstractRNG, 
        s::Walker2020Sampler, 
        q::Function, 
        y0::Float64, 
        z0::Float64
    )
    logw = log(rand(rng)) + q(y0)
    l1 = rand(rng) * z0 + (y0 - z0 / 2)
    z1 = 2 * abs(l1 - y0) + rand(rng, Exponential(s.θ))
    a1 = max(s.lb, l1 - z1 / 2)
    b1 = min(s.ub, l1 + z1 / 2)
    y1 = rand(rng) * (b1 - a1) + a1
    while q(y1) < logw
        if y1 < y0
            a1 = max(a1, y1)
        else
            b1 = min(b1, y1)
        end
        y1 = rand(rng) * (b1 - a1) + a1
    end
    return y1, z1
end

end # module