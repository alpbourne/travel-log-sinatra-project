class Activity < ActiveRecord::Base
  belongs_to :destination
  delegate :user, to: :destination
end
