$(document).on('turbolinks:load', function(){
	flatpickr('#transaction-date',{
		maxDate: "today"
	});
	flatpickr('#filter-date',{
		mode: "range",
		maxDate: "today"
	});
})