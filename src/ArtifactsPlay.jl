module ArtifactsPlay

export greet

using Pkg.Artifacts

function greet()
    path = joinpath(artifact"foobar", "msg.txt")
    println(read(path, String))
end

end