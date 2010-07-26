def create_user_session
  UserSession.create Factory(:user)
end

def destroy_user_session
  if user_session = UserSession.find
    user_session.destroy
  end
end
