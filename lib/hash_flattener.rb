require 'pry-byebug'
class Hash
  # This method extends the Hash class
  # It flattens a nested hash by joining parents key with dots
  def flatten
    self.each_with_object({}) do |(k, v), h|
      if v.is_a? Hash
        v.flatten.map do |nested_k, nested_v|
          h["#{k}.#{nested_k}".to_sym] = nested_v
        end
      elsif (v.is_a? Array)
        h[k] = v.map(&:to_s).join(', ')
      else
        h[k] = v
      end
    end
  end
end