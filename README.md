# BrainInBlack/homebrew-tap

Homebrew formulae for [BrainInBlack](https://github.com/BrainInBlack) projects.

## Install

```sh
brew install BrainInBlack/tap/ssh-deploy
```

or tap first, then install by name:

```sh
brew tap BrainInBlack/tap
brew install ssh-deploy
```

## Formulae

| Formula | Description |
| ------- | ----------- |
| [`ssh-deploy`](Formula/ssh-deploy.rb) | Push a local script to an SSH host and run it there as root. ([repo](https://github.com/BrainInBlack/ssh-deploy)) |

## Notes

- `ssh-deploy`'s fuzzy host picker uses [`fzf`](https://github.com/junegunn/fzf);
  install it (`brew install fzf`) for the richer picker, otherwise a numbered-menu
  fallback is used.
