# Victor's dotfiles

## How to create a symbolic link

### Powershell 7+ (Windows)

- Open an Admin Powershell
- Paste the following command

```pwsh
New-Item -ItemType SymbolicLink -Target "Target" -Path "Link"
```

- Replace `"Target"` with the absolute path of the main file/folder.
- Replace `"Link"` with the absolute path to the symbolic link.

```pwsh
New-Item -ItemType SymbolicLink -Target "C:\Users\<User>\dotfiles\nvim" -Path "C:\Users\<User>\AppData\Local\nvim"
```
