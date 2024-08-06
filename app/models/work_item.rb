class WorkItem < ApplicationRecord
  belongs_to :work
  has_many :assignment_item, dependent: :destroy  

  def to_label
    if (I18n.locale == :zh) then
      "#{code} #{local_name}"
    else
      "#{code} #{name}"
    end
  end

  def display_name
    if (I18n.locale == :zh) then
        "#{code} #{local_name}"
    else
        "#{code} #{name}"
    end
  end

end
