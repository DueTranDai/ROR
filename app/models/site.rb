class Site < ApplicationRecord
    validates :name, presence: true

    def parse_data
        {
            :id => id,
            :name => name,
        }
    end
end
