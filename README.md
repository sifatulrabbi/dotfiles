# My dotfile and configs

# Neovim

My Neovim configs are in another [repo](https://github.com/sifatulrabbi/nvim)

# Tmux

## Tmux keymaps I often use:

> These are default keymaps

1. Create new tmux window -> `prefix` + `c`
2. Navigate between windows -> `prefix` + `[window #no]`
3. Cycle through tmux windows -> `prefix` + `n` | `prefix + p`
4. Rename current tmux window -> `prefix` + `,`
4. Rename current tmux session -> `prefix` + `$`
5. See all windows -> `prefix` + `w`
5. See all sessions -> `prefix` + `s`
6. Copy mode -> `prefix` + `[`
7. Copy mode -> `q`
8. Split the current pane vertically -> `prefix` + `%`
9. Split the current pane horizontally -> `prefix` + `"`
10. Detach from the current session -> `prefix` + `d`
11. Show pane indexes -> `prefix` + `q` then select a pane using `0-9`

## Tmux commands I often use:

> Remove the `tmux` prefix from the commands when using from tmux command bar.

1. Create a new session:
```bash
tmux new-session -s [session_name]
```

2. Attach to the last tmux session
```bash
tmux a
```

3. Attach to a specific session with session name
```bash
tmux attach -t [session_name]
```

4. Swap window order (in tmux command mode)
```bash
swap-window -s [window no#] -t [window no#]
```

5. Swap session order (in tmux command mode)
```bash
swap-session -s [session no#] -t [session no#]
```
