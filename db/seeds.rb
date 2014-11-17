class CreateUsers
  def self.create_manager
    User.create(first_name: 'Craig', last_name: 'Hammell', email: 'cilphex@gmail.com', password: 'abcdefgh')
  end

  def self.create_user
    User.first.subordinates.create(first_name: 'Gary', last_name: 'Hammell', email: 'ghammell1@gmail.com', password: 'abcdefgh')
    User.first.subordinates.create(first_name: 'Bob', last_name: 'Hammell', email: 'bob@gmail.com', password: 'abcdefgh')
    User.first.subordinates.create(first_name: 'Jack', last_name: 'Hammell', email: 'jack@gmail.com', password: 'abcdefgh')
    User.first.subordinates.create(first_name: 'Angela', last_name: 'Hammell', email: 'angela@gmail.com', password: 'abcdefgh')
  end
end

CreateUsers.create_manager
CreateUsers.create_user