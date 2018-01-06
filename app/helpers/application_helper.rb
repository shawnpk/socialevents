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
end
