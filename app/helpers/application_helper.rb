# coding: UTF-8
module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper

  def meta_description

    default =<<-DESC
      Feminismo, Movimento Social e Transformação são as razões de ser da Sempreviva Organização Feminista, uma organização não-governamental feminista em funcionamento desde 1963, com sede na cidade de São Paulo e atuação em âmbito nacional.
    DESC

    descr = @meta_description ? to_text(@meta_description)[0..255] : default

    title = @meta_title ? to_text(@meta_title) : "Sempreviva Organização Feminista"

    tag =<<-TAG
      <meta name="title" content="#{title}" />
      <link rel="canonical" href="#{request.url}" />
      <meta name="description" content="#{descr}" />
    TAG

  end

  def to_text(html)
    html.gsub(/<\/?[^>]*>/, ' ').gsub(/\n\n+/, " ").gsub(/^\n|\n$/, ' ')
  end
end
