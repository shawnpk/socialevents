module ApplicationHelper
  def full_title(page_title)
    default_title = 'SocialEvents'
    if page_title.empty?
      default_title
    else
      "#{page_title} - #{default_title}"
    end
  end

  def format_date(date)
    date.strftime('%A, %d %b %Y %I:%M %p')
  end

  def event_status(event)
    if event.end_date <= Date.today
      content_tag(:span, '', class: 'past')
    else
      content_tag(:span, '', class: 'upcoming')
    end
  end
end
