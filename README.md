# zi's dotfiles

The idea is to have a folder structure of dotfiles that's easily mapped to in the homedir.

```
/ - .bashrc
  - .custom/
    - bash/
      - .custom_bashrc
      - alias/
        - aliases.sh
      - functions/
        - functions.sh
      - settings/
        - settings.sh
  - install.sh
```

`.custom_bashrc` sources all custom config.

`install.sh` should create symlinks in homedir.
