module HomeHelper


  def render_major_errors(member)
    member.errors.full_messages.map do |message|
      if message == 'Email has already been taken'
        "<div id='error_explanation' class='alert alert-warning'>" +
        form_tag(request_token_email_path, method: "post") do
          "#{hidden_field_tag(:email, member.email)}
          #{member.email} is already taken by a member in our database. If this is you we can email you a link so you can alter your details: #{submit_tag("Request Email")}".html_safe
        end + "</div>"
      end
    end.join.html_safe
  end

end
