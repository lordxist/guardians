class NoManualChangesValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    msg = "mustn't be changed manually"
    record.errors[attribute] << msg if record.changed.include?(attribute)
  end
end
