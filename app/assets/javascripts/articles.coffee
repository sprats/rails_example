# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#article_tag_tokens').tokenInput '/tags.json', {
  theme: 'mac',
  prePopulate: $('#article_tag_tokens').data('load'),
  preventDuplicates: true,
  animateDropdown: false,
  tokenLimit: 10,
  tokenValue: "name",
  propertyToSearch: "name",
  allowCustomEntry: true,
  minChars: 2,
  allowFreeTagging: true,
  searchDelay: 600
  }
