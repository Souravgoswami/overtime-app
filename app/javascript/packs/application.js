// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'jquery'
import 'bootstrap'
import '../stylesheets/application.scss'
import "radio-button-toggler"

document.addEventListener('turbolinks:load', () => {
	$('[data-toggle="tooltip"]').tooltip({
		trigger: 'hover'
	}).on('click', function() {
		$(this).tooltip('hide')
	})

	$('[data-toggle="popover"]').popover()
})

$(document).on('ajax:error', function() {
	notify('That was an invalid action!')
})

window.JQuery = $
window.$ = $
