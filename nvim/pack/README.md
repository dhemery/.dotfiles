# Managing Packages

All of the following
assumes that your current working directory
is the root directory of this dotfiles repository.

## Paths to Package Submodules

The commands below use `<path>`
to refer to the working tree path
where a given package is installed.

There are patterns of paths I use
to install packages:

- `nvim/pack/<author>/start/<package>`
- `nvim/pack/<author>/opt/<package>`

where `<author>` is
the name of the package's author
and `<package>` is
the name of the package.

Use the "start" form
if you want vim to always start the package.
Use the "opt" form
to make the package optional
(see below).

## Add a Package

    git submodule add <package-repo-url> <path>
    git submodule update --init --recursive <path>
    git commit

Or use the `.bin/padd` command,
which will add the package,
but not commit the addition:

    padd <author> <package>

## Update a Package

    git submodule update --remote --merge <path>
    git commit

## Update All Packages

    git submodule update --remote --merge
    git commit

## Remove a Package

    git submodule deinit <path>
    git rm <path>
    rm -rf .git/modules/<path>
    git commit

Or use the `.bin/prm` command,
which will remove the package,
but not commit the removal:

    prm <author> <package>

## Starting an Optional Package

To start an optional package within a vim script:

    :packadd <package-name>

