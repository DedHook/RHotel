class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :room
    validates_presence_of :first_name,:last_name ,:end_date ,:start_date
    validates :end_date, comparison: { greater_than: :start_date }
    validates_format_of :phone , :with => (/\+[3][7][5][\d][\d][\d]{7}/), :on => :create
    validates :user_id, :phone, uniqueness: true
    

    

    def self.check(start_date)
        if start_date
          where("start_date >","%#{Date.parse(start_date)}%")
        end
    end
    
end
