class MarkdownRenderer < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants

  def block_code(code, language)
    %(<pre class="pre-code"><span class="pre-code-span">#{language}</span><code><xmp>#{code}</xmp></code></pre>)
  end

  def codespan(code)
    %(<code class="code-inline">#{code}</code>)
  end

  def list(contents, list_type)
    if list_type == :ordered
      if contents.match /^(<li>\(ollowerlatin\))/
        contents = contents.gsub(/(\(ollowerlatin\))/, "")
        return %(<ol class="ol-lower-latin">#{contents}</ol>)
      elsif contents.match /^(<li>\(ollowerroman\))/
        contents = contents.gsub(/(\(ollowerroman\))/, "")
        return %(<ol class="ol-lower-roman">#{contents}</ol>)
      else
        return %(<ol>#{contents}</ol>)
      end
    end
    if list_type == :unordered
      if contents.match /^(<li>\(ulsquare\))/
        contents = contents.gsub(/(\(ulsquare\))/, "")
        return %(<ul class="ul-square">#{contents}</ul>)
      else
        return %(<ul class="ul-circle">#{contents}</ul>)
      end
    end
  end

  def header(text, header_level)
    chain_text = text.split(" ").join("-").downcase

    %(<h#{header_level} id=#{chain_text}>#{text}</h#{header_level}>)
  end

  def paragraph(text)
    if text == "<br />"
      return %(<p class="fs-1">#{text}</p>)
    end
    %(<p>#{text}</p>)
  end

  def emphasis(text)
    if text.match /^(\(ignoreem\))/
      text = text.gsub(/(\(ignoreem\))/, "")
      return %(_#{text}_)
    else
      return %(<em>#{text}</em>)
    end
  end

  def link(link, title, content)
    # If link starts it http
    if link.match /^(http)/i
      # if it includes whitelist domain
      if link.include? ("cdadityang.xyz")
        return %(<a href="#{link}" title="#{title}">#{content}</a>)
      else
        # If not whitelisted, open in new tab
        return %(<a href="#{link}" title="#{title}" target="_blank" rel="noopener noreferrer">#{content}</a>)
      end
    # If link starts with /, then it's internal link
    elsif link.match /^(\/)/
      return %(<a href="#{link}" title="#{title}">#{content}</a>)
    else
      return %(<a href="#{link}" title="#{title}">#{content}</a>)
    end
  end
end