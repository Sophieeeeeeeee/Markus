module MainHelper

  protected

  # Sets current user for this session
  def current_user=(user)
    session[:uid] = (user.blank? || !user.kind_of?(User)) ? nil : user.id
  end

  def get_blank_message(blank_login, blank_password)
    return '' unless blank_login || blank_password

    if blank_login && blank_password
      I18n.t('main.username_and_password_not_blank')
    elsif blank_login
      I18n.t('main.username_not_blank')
    elsif blank_password
      I18n.t('main.password_not_blank')
    end

  end

  def due_date_color(assignment)
    Time.current > assignment.due_date ? 'after' : 'before'
  end

end
