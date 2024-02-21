# zi's dotfiles

The idea is to have a folder structure of dotfiles that's easily mapped to in the homedir.

```
/ - .bashrc
  - .custom/
    - bash/
      - bashrc.sh
      - aliases/
        - aliases.sh
      - functions/
        - functions.sh
      - settings/
        - settings.sh
  - install.sh
```

`bashrc.sh` sources all custom config.

`install.sh` should copy and replace config in homedir.
