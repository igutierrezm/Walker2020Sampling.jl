using Walker2020Sampling
using Distributions
using Random
using Test

@testset "Walker2020Sampling.jl" begin
    s = Walker2020Sampler(lb = 0.0, ub = 1.0)
    rng = MersenneTwister(1)
    y1, z1 = rand(rng, s, x -> logpdf(Exponential(1.0), x), 1.0, 1.0)
    @test y1 ≥ 0.0
    @test y1 ≤ 1.0 
end
