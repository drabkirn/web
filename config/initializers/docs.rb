# Autoloading DocsRenderer or any constant will be depreciated
## in future versions, so we need to require this
## Reloading will not reboot the app!
require "#{Rails.root}/app/lib/docs_renderer"

# Get location of all the MD files
all_md_files = Dir[Dir.pwd + "/app/views/ui/docs/markdown_files/*.md"].sort!

# MD redcarpet init
md_renderer_options = {
  hard_wrap: true
}

md_extensions = {
  fenced_code_blocks: true
}

md_renderer = DocsRenderer.new(md_renderer_options)
markdown = Redcarpet::Markdown.new(md_renderer, md_extensions)


# Iterate over all MD src files, convert them into HTML, push them into an array
htmls_text_content = []

all_md_files.each do |md_file|
  md_text_file = File.open(md_file, 'r')
  md_text = md_text_file.read

  htmls_text_content << markdown.render(md_text)
end

$DOCS_BODY_CONTENT = htmls_text_content.join("\n<hr />\n")