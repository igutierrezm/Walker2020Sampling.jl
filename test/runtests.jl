using Walker2020Sampling
using Distributions
using Random
using Test

@testset "Walker2020Sampling.jl" begin
    s = Walker2020Sampler(lb = 0.0, ub = 1.0)
    rng = MersenneTwister(1)
    y0, z0 = 1.0, 1.0
    for i = 1:100
        y0, z0 = rand(rng, s, x -> logpdf(Exponential(1.0), x), y0, z0)
        @test y0 ≥ 0.0
        @test y0 ≤ 1.0 
    end
end
