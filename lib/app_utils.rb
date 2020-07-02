module AppUtils
  def format_date_time(date_time)
    return date_time.strftime('%Y-%m-%d %H:%M:%S')
  rescue
    return ''
  end
  module_function :format_date_time
end