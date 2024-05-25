vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {})
vim.keymap.set("t", "<C-g><C-g>", 
                    "<C-\\><C-n><C-w><C-w>", 
                {desc = "Exit terminal mode and switch splits."})
vim.keymap.set("n", "<leader>at", 
                    "<C-w><C-w>GA",
                {desc = "Switch splits and enter terminal mode"})

