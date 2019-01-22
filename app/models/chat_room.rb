class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  accepts_nested_attributes_for :messages
  #accepts_nested_attributes_for :screenshots, :reject_if => lambda { |a| a[:body].blank? }, :allow_destroy => true


end
