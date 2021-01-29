module ArtifactsPlay

export greet

using Pkg.Artifacts

function greet()
    # hash = artifact_hash("foobar", "Artifacts.toml")
    # if isnothing(hash)
    #    println("Unable to lookup 'foobar' artifact")
    #    if !artifact_exists(hash)
    #       println("Artifact 'foobar' not yet installed")
    #    end
    # end
    path = joinpath(artifact"foobar", "msg.txt")
    println(read(path, String))
end

end