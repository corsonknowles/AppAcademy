class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      new_var = "@#{name}".to_sym  # star >> :@star
      define_method(name) do
        instance_variable_get(new_var)
      end
      assign_var = "#{name}=".to_sym   # star=
      define_method(assign_var) do |value|
        instance_variable_set(new_var, value)  #star = value
      end
    end
  end

end
