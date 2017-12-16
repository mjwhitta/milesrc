## The infamous milesrc

The milesrc is a combination of my shell, tmux, and vim configs. Once
installed, the shell function `milesrc` will provide some more info:

```
$ milesrc
Configuration via files
    ~/.git.nostatus
        Prompt will not show any git status for paths in
        this file. One path per line.
    ~/.milesrc.local
        Sourced last. Put your custom bash/zsh settings
        here.
    ~/.proj
        Created by save alias. Stores a directory to be
        used by j alias.
    ~/.ssh-agent
        If it exists, milesrc will automatically create and
        handle your ssh-agent.

Configuration via ENV vars
    MILESRC_ACKNOWLEDGE_MACOS_IS_DUMB
        If set, hide warnings about missing gnu utilities
        on macOS
    MILESRC_LS_AFTER_CD
        If set, ls will be automatically run after each cd.
        You likely don't want this if you're looking at
        large directory trees with numerous files in each
        directory.
    MILESRC_PROMPT_EMOTICONS
        If set, the prompt will use emoticons to show exit
        status of the last command. If set to
        "unsupported" the prompt will use more emoticons
        to show exit status of the last command. However,
        they don't all work unless you properly configure
        your locales.
    MILESRC_THEME_PROMPT
        If set, will theme the prompt. Unsetting should
        immediately untheme the prompt.
```

Below are some commands to install or uninstall my configs.

#### Clone

Put configs in `$HOME/.milesrc`:

```
$ git clone git@gitlab.com:mjwhitta/milesrc.git $HOME/.milesrc
$ cd $HOME/.milesrc
```

#### Install

This will make backups of existing configs and install tmux/vim
plugins:

```
$ ./installer link
```

#### Force install

This will NOT make backups of existing configs:

```
$ ./installer -f link
```

#### Unintall

This will restore any backups that exist or create empty
directories/files if not:

```
$ ./installer unlink
```

#### Configure

To configure, simply copy `files.default` to `files` and comment or
delete the entries you don't want. Deleting all vim related entries
will prevent vim plugins from automatically being installed.
