class Room < ApplicationRecord
    has_many :friend, dependent: :delete_all
    validates_presence_of :price ,:tip,:description,:picture
    validates :price, numericality: { greater_than: 0 }
    
      # self.set_table_name "Цена"
    

    
    def self.search(search)
        if search
          where("tip LIKE?","%#{search}%")
        else
          all
        end
      end
end