# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
judge.validate(document.getElementById('post_title'), {
  valid: function(element) {
    element.style.border = '1px solid green';
  },
  invalid: function(element, messages) {
    element.style.border = '1px solid red';
    alert(messages.join(','));
  }
});