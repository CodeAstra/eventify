class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events

  def attending?(event)
    Rsvp.where(user_id: self.id, event_id: event.id).any?
  end

  def rsvp_for(event)
    Rsvp.where(user_id: self.id, event_id: event.id).first
  end
end
