# Walker2020Sampling

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://igutierrezm.github.io/Walker2020Sampling.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://igutierrezm.github.io/Walker2020Sampling.jl/dev)
[![Build Status](https://github.com/igutierrezm/Walker2020Sampling.jl/workflows/CI/badge.svg)](https://github.com/igutierrezm/Walker2020Sampling.jl/actions)
[![codecov](https://codecov.io/gh/igutierrezm/Walker2020Sampling.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/igutierrezm/Walker2020Sampling.jl)

Sampling from a univariate unnormalized [pdf](https://en.wikipedia.org/wiki/Probability_density_function) in Julia using Li \& Walker's MCMC algorithm, see [1] for details.

## Installation

Install with the Julia package manager Pkg:

```julia
# Press ']' to enter the Pkg REPL mode.
pkg> add https://github.com/igutierrezm/Walker2020Sampling.jl  
```

or

```julia
julia> using Pkg; 
julia> Pkg.add("https://github.com/igutierrezm/Walker2020Sampling.jl")
```

## Usage

Suppose we want to draw the next state in a [MCMC](https://en.wikipedia.org/wiki/Markov_chain_Monte_Carlo) with target (unnormalized) log-pdf `q()` using Li \& Walker's algorithm with parameter `θ`. Suppose further that the support of `q()` is `[lb, ub]`, the current state of the main variable is `y0`, and the current state of the auxiliary variable is `z0`.

The first step is to set up the environment:

```julia
using Random, Walker2020Sampling
rng = MersenneTwister(1)
```

Then, we create a sampler `s` using `Walker2020Sampler()`:

```julia
s = Walker2020Sampler(θ; lb, ub);
``` 

Finally, we draw the next state of the main and auxiliary variables using `rand()`:

```julia
y1, z1 = rand(rng, s, q, y0, z0);
``` 

Be aware that both `rng` and `s` are modified in the process. 

## References

[1] Li, Y. and Walker, S. G. (2020). A latent slice sampling  algorithm. arXiv e-prints, page arXiv:[2010.08509](https://arxiv.org/abs/2010.08509).
