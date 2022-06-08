class Friend < ApplicationRecord
    belongs_to :user
    belongs_to :room
    validates_presence_of :first_name,:last_name ,:end_date ,:start_date
    validates :end_date, comparison: { greater_than: :start_date }
    validates_format_of :phone , :with => (/\+[3][7][5][\d][\d][\d]{7}/), :on => :create
end
