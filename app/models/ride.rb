class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if (user.tickets < attraction.tickets) && (user.height < attraction.min_height)
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    end

    tickets_left = user.tickets - attraction.tickets
    nausea_left = user.nausea + attraction.nausea_rating
    happiness_left = user.happiness + attraction.happiness_rating
    user.update(
      :tickets => tickets_left,
      :nausea => nausea_left,
      :happiness => happiness_left
    )

    return "Thanks for riding the #{attraction.name}!"
  end
end
