# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string
#  name        :string
#  sex         :string(1)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    COLORS = ["orange", "black", "white", "brown"]

    validates :sex, inclusion: { in: ["F", "M"] }
    validates :color, inclusion: { in: COLORS }


    def age
        age = Date.today.year - Cat.birth_date.year
        age -= 1 if Date.today < Cat.birth_date + age.years 
    end
    
end
