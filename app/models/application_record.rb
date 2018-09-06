class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(query)
    if query.nil? || query.empty?
      return self.all
    end

    case self.verify_type query
    when :integer
      integers_fields = self.fields_by_type ActiveModel::Type::Integer

      where_str = "1=0 "
      integers_fields.each {|field| where_str += " OR #{field} = #{query}"}
      return self.where(where_str)
    when :text
      text_fields = self.fields_by_type ActiveModel::Type::String
      where_str = "1=0 "
      text_fields.each {|field| where_str += " OR #{field} LIKE \"%#{query}%\""}
      return self.where(where_str)
    end

  end

  private
    def self.fields_by_type (type)
      self.attribute_types.select {|attr, attrtype| attrtype.is_a?(type)}.keys;
    end

    def self.verify_type(str)
      return case str
        when /^([0-9]*)?$/ then :integer
        else :text
      end
    end

end
