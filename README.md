# Dale's Dot Files

I take a "delegation" approach to dot files:

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

## Installation

The `.home` directory
contains all of my "standard" configuration files.

The `.install` script
simply copies each file in and below `.home`
to the corresponding location in `$HOME`,
creating intermediate directories as required.

So…

1. **Read the files in `.home`,**
  to make sure
  you want them all copied to your `$HOME` directory.
1. Read the files in `.home` **at least one more time,**
  to make **doubly** sure
  you want them all copied to your `$HOME` directory.
1. Run: `.install`

