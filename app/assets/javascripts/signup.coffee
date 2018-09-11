$(document).on 'turbolinks:load', ->
  $('.signup-form').validate
      onkeyup: false
      errorElement: 'div'
      errorClass: 'field-error'
      rules:
        'user[email]': 
          required: true
          email: true
        'user[password]': 
          required: true
          minlength: 5
        'user[password_confirmation]': 
          required: true
          equalTo: '.password'
      messages:
        'user[email]': 
          required: 'Please enter your email'
          email: 'Please enter a valid email'
        'user[password]': 
          required: 'Please enter a password of your choice'
          minlength: 'Password length should be minimum 6 '
        'user[password_confirmation]': 
          required: 'Please re-enter password'
          equalTo: 'Password does not match'
