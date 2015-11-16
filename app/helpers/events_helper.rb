module EventsHelper
  def event_time_tag(event)
    if event.single_day?
      content_tag(:div, class: "common_date") do
        content_tag(:h3, event.start_time.strftime("%b %-d, %Y")) +
          content_tag(:p, "#{event.start_time.strftime("%l:%M %P")} to #{event.end_time.strftime("%l:%M %P")}")
      end
    else
      content_tag(:div, class: "diff_date") do
        content_tag(:h3, event.start_time.strftime("%l:%M %P %b %-d, %Y")) +
          content_tag(:p, "to") +
          content_tag(:h3, event.end_time.strftime("%l:%M %P %b %-d, %Y"))
      end
    end
  end
end
