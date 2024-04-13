"""
    Promax(; kappa = 4)

The *Promax* factor rotation.

## Details
The *Promax* is an oblique rotation method performed in two steps:
  1. initial [`Varimax`](@ref) rotation
  2. a secondary oblique target rotation of the `Varimax` loadings (``\\Lambda_{\\mathrhm{Varimax}}``)
     that uses ``\\Lambda_{\\mathrhm{Varimax}}^{\\kappa-1}`` as the target

## Examples
### Setting up the criterion
```jldoctest
julia> Promax()
Promax{Int64}(4)
```

```jldoctest; filter = r"(\\d*)\\.(\\d{4})\\d+" => s"\\1.\\2"
$(DEFINITION_L)
julia> L_promax = rotate(L, Promax())
FactorRotation{Float64} with loading matrix:
8×2 Matrix{Float64}:
  0.892333    0.0546838
  0.95446    -0.0247797
  0.929976   -0.0480287
  0.877246    0.0323215
  0.0111204   0.92621
 -0.0195781   0.822373
 -0.054627    0.766053
  0.0840406   0.683889
```
"""
struct Promax{T} <: RotationMethod{Orthogonal}
    kappa::T

    function Promax(; kappa::T = 4) where {T<:Real}
        kappa >= 0 || throw(ArgumentError("kappa must be non-negative"))
        return new{T}(kappa)
    end
end
