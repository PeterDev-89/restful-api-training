# frozen_string_literal: true

class Contact < ApplicationRecord # :nodoc:
  belongs_to :type

  def author
    'Pedro Barbosa'
  end

  def type_description
    type.description
  end

  # Redefines and add options to as_json in a way that all requests will
  # add this lines
  def as_json(_options = {})
    super(root: true, methods: %i[type_description author])
  end
end
