using Walker2020Sampling
using Documenter

DocMeta.setdocmeta!(Walker2020Sampling, :DocTestSetup, :(using Walker2020Sampling); recursive=true)

makedocs(;
    modules=[Walker2020Sampling],
    authors="Iván Gutiérrez <ivangutierrez1988@gmail.com> and contributors",
    repo="https://github.com/igutierrezm/Walker2020Sampling.jl/blob/{commit}{path}#{line}",
    sitename="Walker2020Sampling.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://igutierrezm.github.io/Walker2020Sampling.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/igutierrezm/Walker2020Sampling.jl",
)
