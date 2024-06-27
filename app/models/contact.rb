# frozen_string_literal: true

class Contact < ApplicationRecord # :nodoc:
  def author
    'Pedro Barbosa'
  end

  # Redefines and add options to as_json in a way that all requests will
  # add this lines
  def as_json(_options = {})
    super(methods: :author, root: true)
  end
end
