return {
  {
    'ThePrimeagen/99',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'github/copilot.vim',
    },
    config = function()
      local _99 = require '99'

      -- For logging that is to a file if you wish to trace through requests
      -- for reporting bugs, i would not rely on this, but instead the provided
      -- logging mechanisms within 99.  This is for more debugging purposes
      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)
      _99.setup {
        provider = require('99').Providers.OpenCodeProvider,
        model = 'openai/gpt-5.3-codex',
        logger = {
          level = _99.DEBUG,
          path = '/tmp/' .. basename .. '.99.debug',
          print_on_error = true,
        },
        -- When setting this to something that is not inside the CWD tools
        -- such as claude code or opencode will have permission issues
        -- and generation will fail refer to tool documentation to resolve
        -- https://opencode.ai/docs/permissions/#external-directories
        -- https://code.claude.com/docs/en/permissions#read-and-edit
        tmp_dir = './tmp',

        --- Completions: #rules and @files in the prompt buffer
        completion = {
          custom_rules = {
            '~/.skills/skills/',
          },
          source = 'blink', -- "native" (default), "cmp", or "blink"
        },

        --- WARNING: if you change cwd then this is likely broken
        --- ill likely fix this in a later change
        ---
        --- md_files is a list of files to look for and auto add based on the location
        --- of the originating request.  That means if you are at /foo/bar/baz.lua
        --- the system will automagically look for:
        --- /foo/bar/AGENT.md
        --- /foo/AGENT.md
        --- assuming that /foo is project root (based on cwd)
        md_files = {
          'AGENT.md',
        },
      }

      -- take extra note that i have visual selection only in v mode
      -- technically whatever your last visual selection is, will be used
      -- so i have this set to visual mode so i dont screw up and use an
      -- old visual selection
      --
      -- likely ill add a mode check and assert on required visual mode
      -- so just prepare for it now
      vim.keymap.set('v', '<leader>9v', function() _99.visual() end, { desc = '99 visual selection' })

      --- if you have a request you dont want to make any changes, just cancel it
      vim.keymap.set('n', '<leader>9x', function() _99.stop_all_requests() end, { desc = '99 stop all requests' })

      vim.keymap.set('n', '<leader>9s', function() _99.search() end, { desc = '99 search' })

      -- vim.keymap.set('v', '<leader>9vv', function() _99.visual() end, { desc = '99 visual selection with rules' })
      -- vim.keymap.set('v', '<leader>9vp', function() _99.visual_prompt() end, { desc = '99 visual selection with prompt' })
      -- vim.keymap.set('n', '<leader>9x', function() _99.stop_all_requests() end, { desc = '99 stop all requests' })
      -- vim.keymap.set('n', '<leader>9i', function() _99.info() end, { desc = '99 info' })
      -- vim.keymap.set('n', '<leader>9l', function() _99.view_logs() end, { desc = '99 view logs' })
      -- vim.keymap.set('n', '<leader>9n', function() _99.next_request_logs() end, { desc = '99 next request logs' })
      -- vim.keymap.set('n', '<leader>9p', function() _99.prev_request_logs() end, { desc = '99 previous request logs' })
    end,
  },
}
