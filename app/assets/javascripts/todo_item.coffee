$(document).on 'turbolinks:load', ->
	$('.datepicker').datepicker
		dateFormat: 'yy-mm-dd'
		todayHighlight: true
		minDate : +0

	$('#todo_items').sortable update: (e, ui) ->
		$.ajax
			beforeSend: (xhr) ->
				xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
			method: 'PATCH'
			url: $(this).data('url')
			data: $(this).sortable('serialize')
		return

	$('.mark-complete').on 'click', (event) ->
		event.preventDefault()
		window.currentElement = this
		$.ajax
			beforeSend: (xhr) ->
				xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
			method: 'PATCH'
			url: $(this).data('url')
			success: (data, status) ->
				$(window.currentElement).removeClass("btn-info").addClass("btn-success")
				$(window.currentElement.closest("tr")).find(".completed-date").text(data.completed_at)
				$(window.currentElement).text("Completed")
				$(window.currentElement.closest("td")).children().addClass('disabled-link')
				$(window.currentElement.closest("tr")).addClass("completed-item")
				window.currentElement = null