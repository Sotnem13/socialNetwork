updateMessages =
	poll: ->
		setInterval(@mes,5000)

	mes: ->
		$.get('/get_messages/' + $("#chat").data('dialog') )

jQuery ->
    updateMessages.mes();
	updateMessages.poll();