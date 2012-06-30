module ApplicationHelper
  def title
    base = "GreenIceCube"
    if @title.blank?
      base
    else
      "#{base} | #{@title}"
    end
  end

  def logo
    image_tag "green-ice-cube-logo.png"
  end

  def banner
    image_tag "gree-ice-cube-banner.png", alt: title
  end
end
