# Using Stow

## Git Upload

```bash
brew bundle dump --describe --all -f
rm -rf .git
git init .
git add .
git commit -m "Default"
git remote add origin git@github.com:alperenunlu/.dotfiles.git
git push -uf origin master
```

## Stow apply

```bash
git pull
stow --dotfiles .
```
