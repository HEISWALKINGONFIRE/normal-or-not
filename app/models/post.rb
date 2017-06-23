class Post < ApplicationRecord
 has_many :comment
 has_many :notifications, dependent: :destroy
 acts_as_votable
end
