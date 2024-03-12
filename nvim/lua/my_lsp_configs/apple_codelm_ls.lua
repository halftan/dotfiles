return {
  default_config = {
    cmd = {
      'apple-codelm-ls',
      'start',
      '--code-completion-max-prompt-tokens',
      '2000',
      -- server arguments go here (view args with `apple-codelm-ls start --help`)
      -- ex:
      '--max-completion-lines',
      '10',
      '--max-completion-tokens',
      '100',
      '--max-code-action-lines',
      '20',
      '--max-code-action-tokens',
      '500',
      'stdio',
    },
    filetypes = {
      -- code formats
      'c',
      'cplusplus',
      'csharp',
      'go',
      'java',
      'javascript',
      'objective-c',
      'objective-cpp',
      'php',
      'python',
      'ruby',
      'swift',
      'typescript',
      'lua',
      'vimscript',
      -- text formats
      'text',
      'markdown',
    },
    single_file_support = true,
  },
  docs = {
    description = [[
      LSP server providing completions from CodeLM
    ]],
  },
  settings = {},
}
