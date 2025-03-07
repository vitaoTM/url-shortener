require "open-uri"

class Metadata
  attr_reader :doc

  def initialize(html = nil)
    @doc = Nokogiri::HTML(html)
  end

  def self.update(link)
  end

  def self.retrive_from(url)
    new(URI.open(url))
  rescue
    new
  end

  def attributes
    {
      title: title,
      description: description,
      image: image
    }
  end

  def title
    doc.at_css("title")&.text
  end

  def description
    meta_tag_content "description" # doc.at_css("meta[name='description']")&.attributes&.fetch("content", nil)&.text
  end

  def image
    meta_tag_content "og:image", name_attribute: :property # doc.at_css("meta[name='og:image']")&.attributes&.fetch("content", nil)&.text
  end

  def meta_tag_content(name, name_attribute: :name)
    doc.at_css("meta[#{name_attribute}='#{name}']")&.attributes&.fetch("content", nil)&.text
  end
end
