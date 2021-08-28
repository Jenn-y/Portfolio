module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(styles)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}, please feel free to #{link_to 'contact me', contact_path} if you are interested in working together!"
      content_tag(:div, greeting.html_safe, class: styles)
    end
  end

  def copyright_generator
    @copyright = DjulovicViewTool::Renderer.copyright '', 'All rights reserved'
  end

  def nav_items
    [
      {
        url: root_path,
        title: "Home"
      },
      {
        url: about_me_path,
        title: "About me"
      },
      {
        url: contact_path,
        title: "Contact"
      },
      {
        url: portfolios_path,
        title: "Portfolio"
      }
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end
end

module DjulovicViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | #{msg}".html_safe
    end
  end
end
