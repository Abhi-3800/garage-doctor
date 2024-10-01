class Car < ApplicationRecord
  has_many_attached :images

  validate :mgf_year_condition
  enum transmission: {'Petrol': 0, 'Diesel': 1, 'Hybrid': 2}
  enum drive_type: {'Manual': 0, 'Automatic': 1}

  def self.ransackable_attributes(auth_object = nil)
    ["mfg_company", "car_model", "mfg_year", "car_description", "horse_power", "top_speed", "transmission", "drive_type", "car_price"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
  end

  private

  def mgf_year_condition
    if mfg_year.present? && mgf_year < Date.new(2015)
      errors.add(:mfg_year, 'must be greater than 2015')
    end
  end
end
