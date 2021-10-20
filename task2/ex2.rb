class Hash
  def safe_invert
    each_with_object({}) { |(key, value), out|
      out[value] ||= []
      out[value] << key
    }
  end
end

