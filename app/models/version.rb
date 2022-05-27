class Version < ApplicationRecord


  def self.to_csv
    attributes = %w{num_version date_version new_version support_version}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |version|
        csv << version.attributes.values_at(*attributes)
      end
    end
  end
end
