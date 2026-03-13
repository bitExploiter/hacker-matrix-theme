# Hacker Green Theme — Installation Guide

A Matrix/terminal-inspired green-on-black colorscheme for your entire development environment.

## Color Palette

| Token       | Hex       | Usage                          |
|-------------|-----------|--------------------------------|
| `bg`        | `#080e08` | Background (near-black)        |
| `fg`        | `#00ee3a` | Main text (matrix green)       |
| `fg_bright` | `#39ff14` | Neon green (emphasis, bold)    |
| `green1`    | `#00ff41` | Keywords, statements           |
| `green2`    | `#33ff77` | Functions                      |
| `green4`    | `#00993a` | Comments (dim)                 |
| `green5`    | `#ccffcc` | Constants, booleans (pale)     |
| `lime`      | `#aaff00` | Types, class names             |
| `cyan`      | `#00ffaa` | Properties, links              |
| `mint`      | `#7fffd4` | Strings                        |
| `gold`      | `#ffd700` | Numbers                        |
| `amber`     | `#ffaa00` | Special characters, warnings   |
| `red`       | `#ff3333` | Errors                         |
| `pink`      | `#ff66aa` | Diff deleted                   |
| `border`    | `#1a4a1a` | Borders, separators            |

---

## 1. iTerm2

**File:** `hacker-iterm2.itermcolors`

### Automatic install (CLI)

```bash
open hacker-iterm2.itermcolors
```

This imports the color profile into iTerm2 automatically.

### Manual install

1. Open **iTerm2** → `Settings` (⌘ + ,)
2. Go to **Profiles** → select your profile (or create a new one)
3. Click the **Colors** tab
4. In the bottom-right corner, click **Color Presets…** → **Import…**
5. Select `hacker-iterm2.itermcolors` from this folder
6. After importing, click **Color Presets…** again and select **hacker-green** from the list

### Verify

Your terminal background should be near-black with green text. Run `ls` to see colored output.

### Notes

- This theme also affects any CLI tool that uses ANSI colors (Claude Code, git, npm, etc.)
- Claude Code inherits terminal colors — loading this profile is the only way to "theme" Claude Code

---

## 2. Neovim

**File:** `hacker-nvim.lua`

### Install

Copy the theme file to Neovim's colors directory:

```bash
mkdir -p ~/.config/nvim/colors
cp hacker-nvim.lua ~/.config/nvim/colors/hacker-green.lua
```

### Activate

Add to your `init.lua`:

```lua
vim.cmd.colorscheme("hacker-green")
```

Or activate temporarily in Neovim's command mode:

```vim
:colorscheme hacker-green
```

### With a plugin manager (lazy.nvim)

If you prefer to manage it as a local plugin:

```lua
-- In your lazy.nvim config
{
  dir = "~/Develop/themes",
  name = "hacker-green",
  config = function()
    vim.cmd.colorscheme("hacker-green")
  end,
}
```

### Verify

Open any source file. You should see:
- **Green neon keywords** (`if`, `return`, `function`)
- **Aquamarine strings** (clearly distinct from code)
- **Gold numbers**
- **Dim green comments** (italic)
- **Near-black background**

### Requirements

- Neovim 0.8+ (uses `nvim_set_hl` API)
- `termguicolors` must be enabled (the theme sets it automatically)
- A terminal with true-color support (iTerm2, Kitty, WezTerm, Ghostty, Alacritty)

---

## 3. OpenCode

**File:** `hacker-opencode.json`

### Install

Copy the theme file to OpenCode's themes directory:

```bash
mkdir -p ~/.config/opencode/themes
cp hacker-opencode.json ~/.config/opencode/themes/hacker-green.json
```

### Activate

In your OpenCode config file (`~/.config/opencode/config.json` or `opencode.json`), set:

```json
{
  "theme": "hacker-green"
}
```

### Verify

Launch OpenCode. The UI should display the hacker-green color scheme across all panels — dark background, green text, and matching diff/syntax colors.

---

## Full setup (all at once)

Run this from the `themes/` directory to install everything:

```bash
# iTerm2 — import color profile
open hacker-iterm2.itermcolors

# Neovim — copy colorscheme
mkdir -p ~/.config/nvim/colors
cp hacker-nvim.lua ~/.config/nvim/colors/hacker-green.lua

# OpenCode — copy theme
mkdir -p ~/.config/opencode/themes
cp hacker-opencode.json ~/.config/opencode/themes/hacker-green.json

echo "Done! Activate in each tool:"
echo "  iTerm2:   Settings → Profiles → Colors → Color Presets → hacker-green"
echo "  Neovim:   :colorscheme hacker-green"
echo "  OpenCode: set \"theme\": \"hacker-green\" in config"
```

---

## Consistency across tools

All three theme files share the **exact same color palette**, so your environment will look consistent whether you're in the terminal, editing code in Neovim, or using OpenCode. The mappings are:

| Role           | iTerm2 ANSI slot | Neovim highlight    | OpenCode key         |
|----------------|-------------------|---------------------|----------------------|
| Background     | Background Color  | `Normal bg`         | `background`         |
| Main text      | Foreground Color  | `Normal fg`         | `text`               |
| Keywords       | Ansi 10 (bright green) | `@keyword`    | `syntaxKeyword`      |
| Functions      | Ansi 12 (bright blue)  | `@function`   | `syntaxFunction`     |
| Strings        | Ansi 6 (cyan)     | `@string`           | `syntaxString`       |
| Numbers        | Ansi 3 (yellow)   | `@number`           | `syntaxNumber`       |
| Comments       | Ansi 4 (blue)     | `@comment`          | `syntaxComment`      |
| Errors         | Ansi 1/9 (red)    | `DiagnosticError`   | `error`              |
| Diff added     | Ansi 2 (green)    | `diffAdded`         | `diffAdded`          |
| Diff removed   | Ansi 1 (red)      | `diffRemoved`       | `diffRemoved`        |
