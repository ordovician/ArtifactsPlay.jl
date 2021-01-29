using Pkg.Artifacts
using Pkg.BinaryPlatforms # provides platform_key_abi()

hash = artifact_hash("foobar", "Artifacts.toml")

if !isnothing(hash) && artifact_exists(hash)
    return
end

# Create MacOS Resources
mac_hash = create_artifact() do dir
   cp("macdata/msg.txt", joinpath(dir, "msg.txt"))
   cp("macdata/os.txt", joinpath(dir, "os.txt"))
end

mac_tar_hash = archive_artifact(mac_hash, "foobar-mac.tar.gz")
mac_path = joinpath(pwd(), "foobar-mac.tar.gz")

bind_artifact!("Artifacts.toml", "foobar", mac_hash,
    platform=MacOS(:x86_64),
    download_info=[("file:" * mac_path, mac_tar_hash)])


# Create Linux Resources
lin_hash = create_artifact() do dir
   cp("lindata/msg.txt", joinpath(dir, "msg.txt"))
   cp("lindata/os.txt", joinpath(dir, "os.txt"))
end

lin_tar_hash = archive_artifact(lin_hash, "foobar-lin.tar.gz")
lin_path = joinpath(pwd(), "foobar-lin.tar.gz")

bind_artifact!("Artifacts.toml", "foobar", lin_hash,
    platform=Linux(:x86_64),
    download_info=[("file:" * lin_path, lin_tar_hash)])

# Create Windows Resources
win_hash = create_artifact() do dir
   cp("windata/msg.txt", joinpath(dir, "msg.txt"))
   cp("windata/os.txt", joinpath(dir, "os.txt"))
end

win_tar_hash = archive_artifact(win_hash, "foobar-win.tar.gz")
win_path = joinpath(pwd(), "foobar-win.tar.gz")

bind_artifact!("Artifacts.toml", "foobar", win_hash,
    platform=Windows(:x86_64),
    download_info=[("file:" * win_path, win_tar_hash)])
