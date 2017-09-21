class CreateSuperHeros < ActiveRecord::Migration[5.0]

  def change
    create_table :superheros do |t|
      t.string :name
      t.string :power
      t.string :bio
      t.integer :team_id
    end
  end

end
