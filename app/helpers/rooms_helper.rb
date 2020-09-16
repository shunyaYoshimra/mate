module RoomsHelper
  def opponent_user(room)
    entry = room.entries.where.not(user_id: current_user)
    user = entry[0].user
  end
end
