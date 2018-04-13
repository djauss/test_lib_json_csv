require 'csv'
require 'json'

# methode get all keys from the hash
def get_all_keys hash, pirm_key=""
  hash.each_with_object([]) do |(k,v), keys|
    key = (pirm_key=="")? k : "#{pirm_key}.#{k}"
    if v.is_a? Hash
      keys.concat(get_all_keys(v, "#{key}"))
    else
      keys << key
    end
  end
end

# methode get all values from the hash
def get_all_values hash
  hash.each_with_object([]) do |(k,v), values|
    if v.is_a? Hash
      values.concat(get_all_values(v))
    elsif v.is_a? Array
      values << v.join(",")
    else
      values << v
    end
  end
end

# methode convert json file to csv file
def convert_json_to_csv json_file, csv_name
  CSV.open(csv_name, "wb", col_sep: ";") do |csv|
    json_file.each_with_index do |hash, index|
      # header csv
      if index == 0
        csv << get_all_keys(hash)
      end
      # data csv
      csv << get_all_values(hash)
    end
  end
end
