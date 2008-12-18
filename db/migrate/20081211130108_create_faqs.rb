class CreateFaqs < ActiveRecord::Migration
  def self.up
    create_table :faqs do |t|
      t.integer :user_id, :null => false
      t.text :bio, :skills, :schools, :companies, :music, :movies, :television, :magazines, :books
      t.timestamps
    end
  end

  def self.down
    drop_table :faqs
  end
end
