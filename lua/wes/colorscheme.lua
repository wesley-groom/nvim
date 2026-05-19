-- 1. Check if colorbuddy and warped are actually installed/available
local colorbuddy_ok, _ = pcall(require, "colorbuddy")
local warped_ok, warped = pcall(require, "warped")

-- 2. If they aren't ready yet (e.g., Packer hasn't built them), exit quietly without crashing Neovim
if not (colorbuddy_ok and warped_ok) then
    return
end

-- 3. Run the setup first so the theme groups compile correctly
warped.setup()

-- 4. Apply the colorscheme safely
pcall(vim.cmd, "colorscheme colorbuddy")

