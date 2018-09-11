$(document).on 'turbolinks:load', ->
  $('.login-form').validate
      onkeyup: false
      errorElement: 'div'
      errorClass: 'field-error'
      rules:
        'user[email]': 
          required: true
          email: true
        'user[password]': 
          required: true
      messages:
        'user[email]': 
          required: 'Please enter registered valid email'
          email: 'Please enter a valid email'
        'user[password]': required: 'Please enter your password'
