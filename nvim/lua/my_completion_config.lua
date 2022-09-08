return {
  setup = function()
    require('coq_3p') {
      -- { src = 'nvimlua', short_name = 'nLUA', conf_only = false },
      { src = 'builtin/syntax', short_name = 'SYN' },
      { src = 'vim_dadbod_completion', short_name = 'DB' },
      {
        src = 'repl',
        sh = 'bash',
        shell = {
          p = 'python3',
          n = 'node',
          t = 'deno',
          r = 'ruby',
          sh = 'bash',
        },
        max_lines = 200,
        deadline = 500,
        unsafe = {'rm', 'poweroff', 'mv', 'ssh'},
      },
      { src = 'orgmode', short_name = 'ORG' },
    }

    vim.g.coq_settings.clients = {

    }
  end
}
