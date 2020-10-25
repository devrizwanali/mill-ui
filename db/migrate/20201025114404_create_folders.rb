# frozen_string_literal: true

class CreateFolders < ActiveRecord::Migration[5.2]
  def change
    create_table :folders do |t|
      t.string :name
      t.references :profile, foreign_key: true
      t.timestamps
    end
  end
end
