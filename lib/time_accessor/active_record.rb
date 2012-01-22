ActiveRecord::Base.class_eval do
  
  cattr_accessor :time_accessors
  self.time_accessors ||= []
  
  def self.time_accessor(*accessor_names)    
    accessor_names.each do |method_name|
      self.time_accessors = time_accessors.push(method_name)
      attr_accessor method_name
      (1..6).to_a do |i|
        attr_accessor "#{method_name}(#{i}i)"
      end
    end
  end
  
  # => Patch assign_multiparameter_attributes to handle our new attributes.
  def assign_multiparameter_attributes(pairs)
    
    time_accessors.each do |method_name|
      multiparameters = pairs.select{ |item| item[0].match(/#{method_name}\(\di\)/) }
      unless multiparameters.blank?
        
        # => set time attribute
        send("#{method_name}=", Time.utc(*multiparameters.map{ |item| item[1] }))

        # => remove multiparameters from pairs
        multiparameters.each{ |item| pairs.reject!{ |i| i == item } }
        
      end
    end
    
    execute_callstack_for_multiparameter_attributes(
      extract_callstack_for_multiparameter_attributes(pairs)
    )
  end
        
end