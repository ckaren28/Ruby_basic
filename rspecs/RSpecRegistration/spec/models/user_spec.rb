require 'rails_helper'

RSpec.describe User, type: :model do
  it "email should be in valid format" do
  	user = User.new(
  		email: 'something@gmail.com',
  		first_name: 'YOYO',
  		last_name: 'Ma',
  		password: 'password'
  	)
  	expect(user).to be_valid
  end

  it "email should be unique" do
  	User.create(
  		email: 'something@gmail.com',
  		first_name: 'YOYO',
  		last_name: 'Momma',
  		password: 'password'
  	)

  	user = User.create(
  		email: 'something@gmail.com',
  		first_name: 'YOYO',
  		last_name: 'Momma',
  		password: 'password'
  	)


  	expect(user.invalid?).to eq(true)
  end

  it "all fields must be required" do
  	user = User.new(
  		email: '',
  		first_name: '',
  		last_name: '',
  		password: ''
  	)
  	expect(user).to be_invalid
  end

  it "password field must be at least 6 characters" do
  	user = User.create(
  		email: 'somethign@gmail.com',
  		first_name: 'Balh',
  		last_name: 'Kasdf',
  		password: 'pass'
  	)

  	expect(user.invalid?).to eq(true)
  end

  it "password must be encrypted" do
  	my_password = 'password'

  	user = User.new(
  		email: 'somethign@gmail.com',
  		first_name: 'Balh',
  		last_name: 'Kasdf',
  		password: my_password
  	)

  	user.save
  	expect(user.password_digest).not_to eq(my_password)
  end
end
