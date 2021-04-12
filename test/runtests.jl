using Walker2020Sampling
using Distributions
using Random
using Test

@testset "Walker2020Sampling.jl" begin
    s = Walker2020Sampler(lb = -0.5, ub = +0.5)
    rng = MersenneTwister(1)
    y0, z0 = 0.0, 0.1
    for i = 1:1000
        y0, z0 = rand(rng, s, x -> logpdf(Normal(), x), y0, z0)
        @test y0 ≥ -0.5
        @test y0 ≤ +0.5
    end
end
