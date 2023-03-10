module TablerHelper
  def alert_variant_class(type)
    { alert: 'alert-warning', notice: 'alert-success' }[type.to_sym] || type.to_s
  end

  def breadcrumb(items)
    content_tag(:ol, class: 'breadcrumb breadcrumb-arrows') do
      safe_join(
        items.map do |item|
          title, path = item
          content_tag(:li, class: 'breadcrumb-item') do
            content_tag(:a, href: path) do
              title
            end
          end
        end
      )
    end
  end
end
