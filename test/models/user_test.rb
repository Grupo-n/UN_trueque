# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  provider               :string
#  uid                    :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  score                  :decimal(, )
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase

	# Contraseña mínimo 8 caracteres y contraseña con complejidad.

	test 'Minimum password 8 characters and password with complexity.' do
		# test length password
		@user = User.new(email: 'qwerty@unal.edu.co', password: '')
		assert_not @user.save
		@user = User.new(email: 'qwerty@unal.edu.co', password: '1')
		assert_not @user.save
		@user = User.new(email: 'qwerty@unal.edu.co', password: '12')
		assert_not @user.save
		@user = User.new(email: 'qwerty@unal.edu.co', password: '123')
		assert_not @user.save
		@user = User.new(email: 'qwerty@unal.edu.co', password: '1234')
		assert_not @user.save
		@user = User.new(email: 'qwerty@unal.edu.co', password: '12345')
		assert_not @user.save
		@user = User.new(email: 'qwerty@unal.edu.co', password: '123456')
		assert_not @user.save
		@user = User.new(email: 'qwerty@unal.edu.co', password: '1234567')
		assert_not @user.save

		# solo numeros
		@user = User.new(email: 'qwerty@unal.edu.co', password: '12345678')
		assert_not @user.save
		# solo caracteres en miniscula
		@user = User.new(email: 'qwerty@unal.edu.co', password: 'qwertyuiop')
		assert_not @user.save
		# solo caracteres en minuscula
		@user = User.new(email: 'qwerty@unal.edu.co', password: 'QWEERTERTERRET')
		assert_not @user.save

		# caracteres en minuscula y en mayusculas
		@user = User.new(email: 'qwerty@unal.edu.co', password: 'qwertyASDFG')
		assert_not @user.save

		# solo caracteres en miniscula y numeros
		@user = User.new(email: 'qwerty@unal.edu.co', password: 'qwerty124563')
		assert_not @user.save
		# solo caracteres en minuscula y numeros
		@user = User.new(email: 'qwerty@unal.edu.co', password: 'QWERTY123456')
		assert_not @user.save

		# mayusculas y minusculas pero no numeros
		@user = User.new(email: 'qwerty@unal.edu.co', password: 'QWERTYqwerty')
		assert_not @user.save
		# mayusculas y numbers
		@user = User.new(email: 'qwerty@unal.edu.co', password: 'QWERTY123456789')
		assert_not @user.save
		# minusculas y numeros
		@user = User.new(email: 'qwerty@unal.edu.co', password: 'qwerty123456789')
		assert_not @user.save

		# minusculas y numeros
		@user = User.new(email: 'qwerty@unal.edu.co', password: 'QWERTYqwerty123456789')
		assert @user.save
	end

	# Impedir que un usuario pueda colocar una contraseña vieja

	test 'Prevent a user from placing an old password' do
		@user = User.new(email: 'qwerty@unal.edu.co', password: 'QWERTYqwerty123456789')
		@user.save
		@user = User.find_by(email: 'qwerty@unal.edu.co')
		@user.password = 'QWERTYqwerty123456789'
		@user.password_confirmation = 'QWERTYqwerty123456789'
		assert_not @user.save
		@user = User.find_by(email: 'qwerty@unal.edu.co')
		@user.password = '/QWERTYqwerty123456789/'
		@user.password_confirmation = '/QWERTYqwerty123456789/'
		assert @user.save
	end

	# Enviar un correo al usuario en caso de cambio de contraseña.

	test 'Send an email to the user in case of password change.' do
		@user = users(:tom)
		@user.password = '/QWERTYqwerty123456789/'
		@user.password_confirmation = '/QWERTYqwerty123456789/'
		assert @user.save
		assert_equal 1, ActionMailer::Base.deliveries.length
	end

	# confirmable

  test 'should be confirmable  and send email' do
    @user = User.new(email: 'admin@admin.com', password: 'Bodf123456789')
    @user.save
		assert_equal 2, ActionMailer::Base.deliveries.length
    assert @user.confirm
  end

	# Autentificación con la red social facebook

	test 'Authentication with the social network facebook' do
		@user = User.new
		@user.email = 'admin@admin.com'
		@user.password = 'Bodf123456789'
		@user.provider = 'facebook'
		@user.uid = 'sfdkjgkfgadskfsdafd5456465465afd'
		assert @user.save
	end



end
