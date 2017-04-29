module Tuples

import Base.+, Base.-, Base.*, Base./

export +, -, *, /, upArray, signedArray

abstract signedArray

type upArray{T} <: signedArray
    vals::Array{T, 1}
end

type downArray{T} <: signedArray
    vals::Array{T, 1}
end


+(x::signedArray, y::signedArray) = x.vals + y.vals
-(x::signedArray, y::signedArray) = x.vals - y.vals
*(x::signedArray, y::signedArray) = x.vals * y.vals
/(x::signedArray, y::signedArray) = x.vals / y.vals

function ha()
    return 1
end

end
