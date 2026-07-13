local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14.0

-- ═══════════════════════════════════════
-- smart-splits: Ctrl+h/j/k/l 无缝跳转
-- ═══════════════════════════════════════
-- 当 Neovim 在前台时，Ctrl+h/j/k/l 转发给 Neovim（由 smart-splits.nvim 处理）
-- 当不在 Neovim 时，Ctrl+h/j/k/l 切换 WezTerm 窗格

local function is_nvim(pane)
  return pane:get_foreground_process_name():find("nvim") ~= nil
end

-- Ctrl+h/j/k/l: Neovim 内跳分屏，否则跳 WezTerm 窗格
config.keys = {
  {
    key = "h",
    mods = "CTRL",
    action = wezterm.action_callback(function(win, pane)
      if is_nvim(pane) then
        win:perform_action({ SendKey = { key = "h", mods = "CTRL" } }, pane)
      else
        win:perform_action(wezterm.action.ActivatePaneDirection("Left"), pane)
      end
    end),
  },
  {
    key = "j",
    mods = "CTRL",
    action = wezterm.action_callback(function(win, pane)
      if is_nvim(pane) then
        win:perform_action({ SendKey = { key = "j", mods = "CTRL" } }, pane)
      else
        win:perform_action(wezterm.action.ActivatePaneDirection("Down"), pane)
      end
    end),
  },
  {
    key = "k",
    mods = "CTRL",
    action = wezterm.action_callback(function(win, pane)
      if is_nvim(pane) then
        win:perform_action({ SendKey = { key = "k", mods = "CTRL" } }, pane)
      else
        win:perform_action(wezterm.action.ActivatePaneDirection("Up"), pane)
      end
    end),
  },
  {
    key = "l",
    mods = "CTRL",
    action = wezterm.action_callback(function(win, pane)
      if is_nvim(pane) then
        win:perform_action({ SendKey = { key = "l", mods = "CTRL" } }, pane)
      else
        win:perform_action(wezterm.action.ActivatePaneDirection("Right"), pane)
      end
    end),
  },
  -- Ctrl+Alt+h/j/k/l: Neovim 内调整分屏大小，否则调整 WezTerm 窗格大小
  {
    key = "h",
    mods = "CTRL|ALT",
    action = wezterm.action_callback(function(win, pane)
      if is_nvim(pane) then
        win:perform_action({ SendKey = { key = "h", mods = "CTRL|ALT" } }, pane)
      else
        win:perform_action(wezterm.action.AdjustPaneSize({ "Left", 3 }), pane)
      end
    end),
  },
  {
    key = "j",
    mods = "CTRL|ALT",
    action = wezterm.action_callback(function(win, pane)
      if is_nvim(pane) then
        win:perform_action({ SendKey = { key = "j", mods = "CTRL|ALT" } }, pane)
      else
        win:perform_action(wezterm.action.AdjustPaneSize({ "Down", 3 }), pane)
      end
    end),
  },
  {
    key = "k",
    mods = "CTRL|ALT",
    action = wezterm.action_callback(function(win, pane)
      if is_nvim(pane) then
        win:perform_action({ SendKey = { key = "k", mods = "CTRL|ALT" } }, pane)
      else
        win:perform_action(wezterm.action.AdjustPaneSize({ "Up", 3 }), pane)
      end
    end),
  },
  {
    key = "l",
    mods = "CTRL|ALT",
    action = wezterm.action_callback(function(win, pane)
      if is_nvim(pane) then
        win:perform_action({ SendKey = { key = "l", mods = "CTRL|ALT" } }, pane)
      else
        win:perform_action(wezterm.action.AdjustPaneSize({ "Right", 3 }), pane)
      end
    end),
  },
}

return config
