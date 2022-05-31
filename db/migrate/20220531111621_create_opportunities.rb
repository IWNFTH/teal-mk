class CreateOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :opportunities do |t|
      t.string     :op_name, null: false
      t.references :user, null: false, foreign_key: true
      t.string     :company, null: false
      t.string     :person_in_charge, null: false
      t.date       :date_of_obtaining, null: false
      t.date       :date_of_participation
      t.date       :date_of_negotiation
      t.integer    :estimated_sales_amount
      t.integer    :sales_amount
      t.date       :contracted_date
      t.date       :lost_order_date
      t.integer    :phase_id, null: false
      t.integer    :company_area_id, null: false
      t.text       :free_text
      t.timestamps
    end
  end
end
