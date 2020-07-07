module AppUtils
  def format_date_time(date_time)
    return date_time.strftime('%Y-%m-%d %H:%M:%S')
  rescue
    return ''
  end
  def escape_search_query(query)
    debugger
    return '' if query.blank?
    debugger
    search_str = escape_elastic_search_query(query)
    return '%' + search_str.gsub(' ', '%') + '%'
  end

  def escape_elastic_search_query(query)
    return '' if query.blank?

    specials_chars = '\+\-&|!(){}[]^"~*?:\\/'
    query.to_s.tr(specials_chars, ' ')
  end
  module_function :format_date_time
  module_function :escape_search_query
  module_function :escape_elastic_search_query
end