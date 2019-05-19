class Template < OpenStruct

  def self.render(template, locals)
    path = File.expand_path(File.join(PROJECT_ROOT, "views", template))
    raw_html = ErbWithLocals.new(locals).render(File.read(path))
    return Template.new(raw_html)
  end

  def initialize(raw_html)
    @raw_html = raw_html
  end

  def find(selector)
    return Nokogiri::HTML(@raw_html).css(selector)
  end

  class ErbWithLocals < OpenStruct

    def render(erb_template)
      ERB.new(erb_template).result(binding)
    end

  end

end
