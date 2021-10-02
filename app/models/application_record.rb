class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.where_by_scope(scope)
    self.where("#{self.table_name}.#{self.primary_key} IN (SELECT id FROM (#{self.send(scope).to_sql}) as #{self.table_name})")
  end
end
