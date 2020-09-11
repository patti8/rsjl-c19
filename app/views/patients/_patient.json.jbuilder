json.extract! patient, :id, :nama, :no_kamar, :no_rm, :created_at, :updated_at
json.url patient_url(patient, format: :json)
