# Autoloading DocsRenderer or any constant will be depreciated
## in future versions, so we need to require this
## Reloading will not reboot the app!
require "#{Rails.root}/app/lib/markdown_renderer"

# Get location of all the MD files
pp_md_file = Dir[Dir.pwd + "/app/views/ui/legal/markdown_files/privacy_policy.md"][0]

# MD redcarpet init
md_renderer_options = {
  hard_wrap: true
}

md_extensions = {
  fenced_code_blocks: true
}

md_renderer = MarkdownRenderer.new(md_renderer_options)
markdown = Redcarpet::Markdown.new(md_renderer, md_extensions)


pp_md_text_file = File.open(pp_md_file, 'r')
pp_md_text = pp_md_text_file.read
$LEGAL_PP_BODY_CONTENT = markdown.render(pp_md_text)