// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener("turbo:load", function() {
  document.getElementById("loginFormSubmitBtn").addEventListener("click", function() {
    document.querySelector("form").submit();
  });
});

document.addEventListener("turbo:load", function() {
  document.getElementById('SignupFormSubmitBtn').addEventListener('click', function() {
    document.getElementById('signup_form').submit();
  });
});

