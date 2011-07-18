module ApplicationHelper

  def page_title(name)
    if name.blank?
      content_for(:title) { "Your Career" }
      #content_tag("h1", name)      
    else
      content_for(:title) { "Your Career | " + name }
      #content_tag("h1", name)
      
    end
  end
  
  
end
