## The infamous milesrc

The milesrc is a combination of my shell, tmux, and vim configs. Once
installed, the shell function `milesrc` will provide some more info:

```
Configuration via files

    ~/.git.nostatus
        Prompt will not show any git status for paths in
        this file. One path per line.
    ~/.milesrc/local/local
        Sourced last. Put your custom bash/zsh settings
        here.
    ~/.milesrc/local/pre
        Sourced first. Put specified ENV vars here (see
        below)

Configuration via ENV vars (put in ~/.milesrc/local/local
unless otherwise specified)

    MILESRC_LS_AFTER_CD
        If set, and you alias cd to mycd, ls will be
        automatically run after each cd. You likely don't
        want this if you're looking at large directory
        trees with numerous files in each directory.
    MILESRC_PROMPT
        Should be an array, and, if set, will theme the
        prompt. Unsetting should immediately untheme the
        prompt. Example below:
            delcare -a MILESRC_PROMPT
            MILESRC_PROMPT=(
                "host;white;blue;root;white;160"
                "venv;white;166"
                "git;light_black;white"
                "cwd;white;light_black"
                "vi_ins;white;green;vi_cmd;white;blue"
                "newline"
                "exit;white;red"
                "prompt;white;light_black"
            )
            export MILESRC_PROMPT
        These are generally of the form:
            section;fg_color;bg_color
        where section is one of:
            cwd, exit, git, host, newline, prompt, venv,
            or vi_ins|vi_cmd
        and valid colors are:
            black, red, green, yellow, blue, magenta, cyan,
            white, light_black, light_red, light_green,
            light_yellow, light_blue, light_magenta,
            light_cyan, light_white, or any number in 0-255
    MILESRC_SSH_AGENT
        If set (in ~/.milesrc/local/pre), start an
        ssh-agent.
    MILESRC_TMUX
        If set (in ~/.milesrc/local/pre), attach to tmux
        session.
    MILESRC_VI_BINDINGS
        If set (in ~/.milesrc/local/pre), use vi
        keybindings.
```

Below are some commands to install or uninstall my configs.

#### Clone

Put configs in `$HOME/.milesrc`:

```
$ git clone git@github.com:mjwhitta/milesrc.git $HOME/.milesrc
$ cd $HOME/.milesrc
```

#### Install

This will make backups of existing configs and install tmux/vim
plugins:

```
$ ./installer -v link
```

#### Force install

This will NOT make backups of existing configs:

```
$ ./installer -f -v link
```

#### Uninstall

This will unlink configs and restore any backups that exist:

```
$ ./installer unlink
```

#### Configure

To configure, simply copy `files.default` to `files` and comment or
delete the entries you don't want.
