# frozen_string_literal: true

class Contact < ApplicationRecord # :nodoc:
  belongs_to :type
  has_many :phones

  def author
    'Pedro Barbosa'
  end

  def type_description
    type.description
  end
end
