-- Official docs' suggestion - advanced setup:
-- A beginner-friendly setup for fast motion jumping
-- Place this entire file in: ~/.config/nvim/lua/plugins/leap.lua (for lazy.nvim)
-- OR add it to your main config file

return {
  'ggandor/leap.nvim',
  config = function()
    -- Basic keybindings (recommended by Leap)
    -- 's' to leap forward/backward in current window
    vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')

    -- 'S' to leap across all visible windows
    vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')

    -- RECOMMENDED TWEAKS for better experience
    -- These reduce visual noise and make Leap feel smoother

    -- 1. Preview filter: reduces blinking and visual noise
    -- This prevents labels from showing up on whitespace and in the middle of words
    -- You can still jump anywhere, but the preview is cleaner
    require('leap').opts.preview = function (ch0, ch1, ch2)
      return not (
        ch1:match('%s')  -- Exclude whitespace
        or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))  -- Exclude middle of words
      )
    end

    -- 2. Equivalence classes: treat similar characters as the same
    -- For example, searching for '(' will also match '[' and '{'
    require('leap').opts.equivalence_classes = {
      ' \t\r\n',    -- All whitespace is equivalent
      '([{',        -- Opening brackets
      ')]}',        -- Closing brackets
      '\'"`'        -- Quotes
    }

    -- 3. Repeat previous motion easily
    -- Press Enter to repeat the last leap motion
    -- Press Backspace to go backwards through matches
    require('leap.user').set_repeat_keys('<enter>', '<backspace>')

    -- OPTIONAL: Grey out the search area (makes target more visible)
    -- Uncomment the line below if you want this effect:
    -- vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
  end
}

--[[
HOW TO USE LEAP:
1. Press 's' (or your chosen key)
2. Type 2 characters that appear near your target
3. If labels appear, type the label to jump there
4. If no label appears, you're already there!

TIPS:
- Use 's' followed by {char}<space> to jump to end of line
- Use 's' followed by <space><space> to jump to empty lines
- Press <enter> after 's' to repeat your last search
- Press <enter> at any time to jump to the closest match

WHEN YOU'RE READY TO LEARN MORE:
- :help leap - Full documentation
- Experiment with 'S' to leap across multiple windows
- Try using 's' in Visual mode to select text
- Use 's' in Operator-pending mode (e.g., 'd' then 's') to delete until target
]]