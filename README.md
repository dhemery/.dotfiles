# Dale's Dot Files

## Dot File Delegation

I use a "delegation" approach to dot files:

- Put configuration files in "standard" places.
  That is,
  use the tools' favored locations and file names.
  The files are where the tools naturally look for them.
- Don't put those standard configuration files
  into version control,
  because sometimes tools want to edit the configuration files,
  and I don't always want to track those edits.
- Write each standard configuration file
  to do as little direct configuration as possible,
  but instead to simply _delegate_
  to my custom, version-controlled configuration files,
  using whatever _include_ mechanism
  the standard configuration file offers.
- Use two levels of custom configuration files:
    1. **Shared configuration**
      that I am likely to want on any computer.
    1. **Local configuration**
      that might differ from one computer to another
      or that I don't want to publish
      in a public repository.
- In each standard configuration file,
  load my shared and local custom configuration files
  in whatever order
  causes the local configuration
  to override the shared configuration.

This delegation style of configuration
requires more setup than I prefer to do
(see below),
but for now it feels less cumbersome
and more manageable
than symbolic links and bare git repositories.

## Setup

1. Clone this repository to `~/.dotfiles/shared`:

    ```
    mkdir ~/.dotfiles
    git clone git@github.com:dhemery/.dotfiles ~/.dotfiles/shared
    ```

1. Add local configuration files to `~/.dotfiles/local` as desired.
1. Create the standard configuration files
  that delegate to my shared and local configuration files.

### The Standard "Delegating" Configuration Files

See the `./setup` folder in this repo
for the content that I start with
for these files.

`~/.zshenv`
: Sets up a few key shell variables,
  then loads my custom `zshenv` files.
  This file does a bit more direct configuration
  than the others, mainly exporting environment variables
  that identify where to find
  my custom configuration files.

`~/.config/git/config`
: Declares `include.path` values
  to include my custom git config files.
  Alas, git config files do not expand environment variables,
  so I had to hard-code the paths
  to my custom git config files.

`~/.config/nvim/init.vim`
: Loads my custom `init.vim` files.

`~/.config/zsh/.zshrc`
: Loads my custom `zshrc` files.

