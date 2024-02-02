module ApplicationHelper
  def render_stars(rating)
    content_tag(:div, class: 'star-rating') do
      if rating.present? && rating.positive?
        rating.times do
          concat content_tag(:span, '★', class: 'star')
        end
      else
        concat content_tag(:span, 'No rating available', class: 'no-rating')
      end
    end
  end
end
