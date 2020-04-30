ActiveAdmin.register Company do

  index do
    selectable_column
    column :name
    column :logo
    column :created_at
    actions
  end


  show do
    h2 'Company'
    table_for Company do
      column :name
      column :logo
      column :created_at      
    end
  end

end
