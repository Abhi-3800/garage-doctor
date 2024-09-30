class Car < ApplicationRecord
    has_many_attached :images
    enum transmission: {'petrol': 0, 'diesel': 1, 'hybrid': 2}
    enum drive_type: {'manual': 0, 'automatic': 1}
end
