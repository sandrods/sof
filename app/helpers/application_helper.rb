module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper

  def meta_description

    default =<<-DESC
      Feminismo, Movimento Social e Transformação são as razões de ser da Sempreviva Organização Feminista, uma organização não-governamental feminista em funcionamento desde 1963, com sede na cidade de São Paulo e atuação em âmbito nacional.
    DESC

    descr = @meta_description ? @meta_description.gsub(/<\/?[^>]*>/, ' ').gsub(/\n\n+/, " ").gsub(/^\n|\n$/, ' ')[0..150] : default

    tag =<<-TAG
      <link rel="canonical" href="#{request.url}" />
      <meta name="description" content="#{descr}" />
    TAG

  end

end
