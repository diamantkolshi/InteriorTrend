module InertiaErrors
  def inertia_errors
    ret = {}
    self.errors.details.each do |key, value|
      res = self.errors.details[key].first
      if res[:value]
        if res[:value].instance_of? Array
          ret[key] = res[:value].map { |el|
            if el.class.method_defined? :inertia_errors
              el.inertia_errors
            elsif el.class.method_defined? :errors
              el.errors.messages
            else
              nil
            end
          }
        elsif res[:value].is_a? String
          ret[key] = self.errors.messages[key]
        elsif res[:value].class.method_defined? :errors
          ret[key] = res[:value].errors.messages
        end
      else
        ret[key] = self.errors.messages[key]
      end
    end
    ret
  end
end
