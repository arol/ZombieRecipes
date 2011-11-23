# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

renderRating = (elem, rating) ->
	i = 1
	elem.parent().children().each (index, aux) ->
		$(this).removeClass('achieved')
		if(rating >= i)
			$(this).addClass('achieved')
		i++

unstar = (elem) ->
	elem.removeClass('on')

star = (elem) ->
	elem.addClass('on')

starItem = (elem) ->
	star(elem)
	if( elem.prev().is("a") )
		starItem(elem.prev());
	
unstarItem = (elem) ->
	unstar(elem)
	if( elem.prev().is('a') )
		unstarItem(elem.prev())
		
num = (elem) ->
	if( elem.prev().is('a') )
		return 1 + num(elem.prev())
	else
		return 1

$(document).ready ->
	$('.rating-star').hover ->
		starItem($(this));
		
	$('.rating-star').mouseout ->
		unstarItem($(this));
		
	$('.rating-star').click (event) ->
		event.preventDefault()
		elem = $(this)
		url = $(this).attr('href')
		vot = num($(this))
		$.ajax 
			type: 'put' 
			url: url 
			data: { valVot: vot } 
			dataType: 'json' 
			success: (json) -> 
				elem.parent().next().text(json.numVotes) 
				renderRating(elem, json.rating)
