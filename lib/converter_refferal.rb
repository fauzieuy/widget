class ConverterRefferal
  def self.proccess(file, target_uri)
    doc = Nokogiri::HTML(file)
    doc.css("a").each do |link|
    original_uri = link.attributes["href"]
    get_uri = URI.parse(original_uri) rescue nil
        next if get_uri.nil?
        if  get_uri.host == URI.parse(target_uri).host
            params = Rack::Utils.parse_query URI(link["href"]).query
            params = params.merge({partner: 'widget co'})
            link['href'] = "#{link['href'][/[^\?]+/]}#{params.map{|k, v| "#{k}=#{v}" }.join('&')}"
        end
    end
    return doc.to_html
  end
end
