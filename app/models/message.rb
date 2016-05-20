class Message < ActiveRecord::Base
  belongs_to :user
  acts_as_disqusable
end
