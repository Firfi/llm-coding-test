require 'open-uri'
require 'open_uri_redirections'

class ParseUrlContentJob < ApplicationJob
  queue_as :default

  def perform(url)
    doc = Nokogiri::HTML(open(url, :allow_redirections => :safe))
    url_contents = doc.css('h1,h2,h3').map(&:content).concat(
        doc.css('a').map {|l| l['href']}.select(&:present?)
    ).map(&:strip)
    Url.transaction do
      url_model = Url.find_or_create_by(url: url)
      UrlContent.transaction do
        UrlContent.where(url: url_model).destroy_all
        UrlContent.import! url_contents.map {|content| UrlContent.new({content: content, url: url_model})}
      end
    end

  end
end
