module GriffinMarkdown
  def markdown_html(text, options = {})
    return '' if text.blank?

    options.reverse_merge!({
      tags: %w(strong em sup del),
      tags_add: [],
      tags_remove: [],
    })

    tags = Array(options[:tags])
    tags += Array(options[:tags_add])
    tags -= Array(options[:tags_remove])
    tags = tags.map(&:to_s)

    @markdown_renderer ||= Redcarpet::Render::XHTML.new(escape_html: true, no_images: true)
    @markdown ||= Redcarpet::Markdown.new(@markdown_renderer,
                                          no_intra_emphasis: true,
                                          strikethrough: true,
                                          superscript: true)
    @coder ||= HTMLEntities.new
    ActionController::Base.helpers.sanitize(@coder.decode(@markdown.render(text.strip)), tags: tags).gsub("'", "&#39;").strip.html_safe
  end
  
  def markdown_pdf(text, options = {})
    return '' if text.blank?

    options.reverse_merge!({
      tags: %w(strong em sup del),
      tags_add: [],
      tags_remove: [],
    })

    tags = Array(options[:tags])
    tags += Array(options[:tags_add])
    tags -= Array(options[:tags_remove])
    tags = tags.map(&:to_s)

    @markdown_renderer ||= Redcarpet::Render::XHTML.new(escape_html: true, no_images: true)
    @markdown ||= Redcarpet::Markdown.new(@markdown_renderer,
                                          no_intra_emphasis: true,
                                          strikethrough: true,
                                          superscript: true)
    @coder ||= HTMLEntities.new
    ActionController::Base.helpers.sanitize(@coder.decode(@markdown.render(text.strip)), tags: tags).strip.html_safe
  end
end
