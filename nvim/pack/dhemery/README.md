# Managing Packages

All of the following
assumes that your current working directory
is the root directory of this dotfiles repository.

## Paths to Package Submodules

The commands below use `<path>`
to refer to the working tree path
where a given package is installed.

There are two directories to install packages:

- `nvim/pack/dhemery/start/<package-name>`
- `nvim/pack/dhemery/opt/<package-name>`

Install a package to the `start` directory
if you want vim to always start the package.
Use the `opt` directory
to make the package optional
(see below).

## Add a Package

    git submodule add <package-repo-url> <path>
    git submodule update --init --recursive <path>
    git commit

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

## Starting an Optional Package

To start an optional package within a vim script:

    :packadd <package-name>

