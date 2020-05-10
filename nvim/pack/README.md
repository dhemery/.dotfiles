# Adding plugins

To install a plugin so that it runs when nvim starts:

    mkdir -p <my-name-for-plugin>/start
    git clone <plugin-repository-url> <my-name-for-plugin>/start
    # … or …
    git clone <plugin-repository-url> <my-name-for-plugin>/start/<dirname>

To install a plugin so that it does not run when nvim starts,
create an `.../opt` directory instead of a `.../start` directory.
Then to run the plugin:

    :packadd <dirname>

where `<dirname>`
is the name of the directory
that git created when it cloned the repository.
