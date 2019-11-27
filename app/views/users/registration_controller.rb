def confirm_email
end

def after_inactive_sign_up_path_for(resource)
  confirm_email_path
end