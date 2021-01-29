# Julia Artifacts Experiments

This project is an experimental project for learning more about how binary for different architectures is dealt with in Julia. It is not setup how a normal project would be used. For instance the `Artifacts.toml` file is intentionally empty so you can learn how to create one.

The way this is used is that you run the following code first:

    $ julia create-artifacts.jl
    
This will fill in the correct information in the `Artifacts.toml` file, for different architectures. Only when this is done will the `greet()` function in the ArchExeperiments module work.

     julia> greet()
     Hello macOS user!

The message you get will depend on the operating system you are on.

# How Does This Work?
Instead of binaries for different architectures I am simply making different text files meant for each architecture. E.g. the `macdata/msg.txt` file contains a message meant for mac users, while the `lindata/msg.txt` contains a message meant for Linux users.

However we don't load these directly. Why not? Because these are meant to mimic large binaries you would not normally place in your git repo, but somewhere else. The `create-artifacts.jl` script is basically what a package creator would run to setup an `Artifacts.toml` file to fetch external binaries. However in our case instead of setting up a URL online where binaries are fetched, we are actually fetching them locally.

Of course that is rather pointless but useful for educational purposes.