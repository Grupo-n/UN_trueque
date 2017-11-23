# REQUERIMIENTOS A HACER

* El sistema solo permitirá usar ciertas funcionalidades a usuarios registrados

``rails test test/controllers/users_controller.rb``

* Contraseña mínimo 8 caracteres y contraseña con complejidad.

``rails test test/models/user_test.rb:42``

* Impedir que un usuario pueda colocar una contraseña vieja

``rails test test/models/user_test.rb:99``

* Enviar un correo al usuario en caso de cambio de contraseña

``rails test test/models/user_test.rb:114``

* La cuenta se bloqueará después de 5 intentos de ingreso fallidos.

``rails test test/integration/users_login_test.rb``

* El usuario deberá confirmar su cuenta via email

``rails test test/models/user_test.rb:124``

* Autentificación con la red social facebook

``rails test test/models/user_test.rb:133``
