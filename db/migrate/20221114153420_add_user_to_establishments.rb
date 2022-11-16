# frozen_string_literal: true

class AddUserToEstablishments < ActiveRecord::Migration[7.0]
  def change
    add_reference :establishments, :user, null: false, foreign_key: true
  end
end
