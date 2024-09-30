class Car < ApplicationRecord
    has_many_attached :images
    enum transmission: {'Petrol': 0, 'Diesel': 1, 'Hybrid': 2}
    enum drive_type: {'Manual': 0, 'Automatic': 1}
end
