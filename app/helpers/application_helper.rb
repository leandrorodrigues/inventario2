module ApplicationHelper

  def menu_item(name, icon = nil, options = nil, html_options = nil, &block)
    html_options ||= {}

    html_options[:class] ||= ""
    html_options[:class] += " nav-link"

    if icon.present?
      name = fa_icon icon, :text => name
    end

    active_link_to(name, options, html_options, &block)
  end

  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    html_options ||= {}

    html_options[:class] ||= ""

    html_options[:class] += " active" if current_page?(options)

    link_to(name, options, html_options, &block)
  end

end
