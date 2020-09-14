module ApplicationHelper
  def devise_error_messages
    return "" if resource.errors.empty?
    html = ""
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="red lighten-3">
          <p style="padding: 20px;">#{msg}</p>
        </div>
      EOF
    end
    html.html_safe
  end

  def current_user?(user)
    user == current_user
  end
end
