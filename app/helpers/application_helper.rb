module ApplicationHelper

  def member_of?(user: current_user, group: group)
    user.groups.include?(group) if user
  end

end
