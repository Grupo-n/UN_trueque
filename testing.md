Test de unidad: 
-------------
RUN: rails test test/models/name.rb
> - barter_test.rb
> - category_test.rb
> - comment_test.rb
> - message_test.rb
> - product_test.rb
> - user_test.rb

RUN: rails test test/mailers/name.rb
> - user_mailer_test.rb

Test de integración: 
-------------
RUN: rails test test/integration/name.rb
> - users_login_test.rb 