class CreateJobsearches < ActiveRecord::Migration
  def change
    create_table :jobsearches do |t|
      t.text :company
      t.text :role
      t.text :description
      t.text :job_post
      t.text :recruiter
      t.text :notes
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :jobsearches, [:user_id, :created_at]
  end
end
