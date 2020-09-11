class Patient < ApplicationRecord
    #  attr_accessor :nama, :no_kamar, :no_rm

    # def attr_names
    #   [nama, no_kamar, no_rm]
    # end

    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
            csv << column_names
            all.each do |patient|
                csv << patient.attributes.values_at(*column_names)
            end
        end
    end

    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |i|
          row = Hash[[header, spreadsheet.row(i)].transpose]
          patient = find_by_id(row["id"]) || new
          patient.attributes = row.to_hash.slice(*row.to_hash.keys)
          patient.save!
        end
      end
      
      def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
         when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
         when '.xls' then Roo::Excel.new(file.path,  packed: nil, file_warning: :ignore)
         when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
         else raise "Unknown file type: #{file.original_filename}"
        end
      end

        # CSV.foreach(file.path, headers: true) do |row|
        #     patient = find_by_id(row["id"]) || new
        #     patient.attributes = row.to_hash.slice(*accessible_attributes)
        #     patient.save!
        # end

end
