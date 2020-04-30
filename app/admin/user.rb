ActiveAdmin.register User do

  index do
    selectable_column
    column :id
    column :email
    column :created_at
    actions
  end


  show do
    h2 'User'
    table_for User do
      column :id
      column :email
      column :created_at      
    end
  end

end
