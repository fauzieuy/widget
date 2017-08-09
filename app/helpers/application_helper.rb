module ApplicationHelper
  def flash_message(code, message)
    aclass = ''
    case code
    when 1, 'success'
      aclass = 'success'
    when 0, 'error'
      aclass = 'danger'
    end

    content_tag(:div, class: "alert alert-#{aclass} alert-dimissible", role: 'alert') do
      link_to('x', '#', class: 'close', data: { dismiss: 'alert' }, 'aria-hidden': 'true') <<
      message
    end
  end
end
