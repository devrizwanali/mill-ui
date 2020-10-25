# frozen_string_literal: true

class Folder < ApplicationRecord
  belongs_to :profile
  has_many_attached :files
end
