class RenameSuperHeros < ActiveRecord::Migration[5.0]

  def change
    rename_table :superheros, :super_heros
  end

end
