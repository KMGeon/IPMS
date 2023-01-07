/*=========================================================================================
    File Name: fullcalendar.js
    Description: Fullcalendar
    --------------------------------------------------------------------------------------
    Item Name: Stack - Responsive Admin Theme
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/


$(document).ready(function(){


	// /********************************************
	// *				Events Colors				*
	// ********************************************/
	var calendarE5 = document.getElementById('fc-event-colors');
    var fcEventColors = new FullCalendar.Calendar(calendarE5, {
		header: {
			left: 'prev,next today',
			center: 'title',
			right: "dayGridMonth,timeGridWeek,timeGridDay"
		},
		defaultDate: '2016-06-12',
		businessHours: true, // display business hours
		navLinks: true, // can click day/week names to navigate views
		plugins: [ 'dayGrid', 'timeGrid', "interaction"],
		editable: true,
		events: [
			{
				title: 'All Day Event',
				start: '2016-06-01',
				color: '#967ADC'
			},
			{
				title: 'Long Event',
				start: '2016-06-07',
				end: '2016-06-10',
				color: '#37BC9B'
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: '2016-06-09T16:00:00',
				color: '#37BC9B'
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: '2016-06-16T16:00:00',
				color: '#F6BB42'
			},
			{
				title: 'Conference',
				start: '2016-06-11',
				end: '2016-06-13',
				color: '#DA4453'
			},
			{
				title: 'Meeting',
				start: '2016-06-12T10:30:00',
				end: '2016-06-12T12:30:00',
				color: '#DA4453'
			},
			{
				title: 'Lunch',
				start: '2016-06-12T12:00:00',
				color: '#DA4453'
			},
			{
				title: 'Meeting',
				start: '2016-06-12T14:30:00',
				color: '#DA4453'
			},
			{
				title: 'Happy Hour',
				start: '2016-06-12T17:30:00',
				color: '#DA4453'
			},
			{
				title: 'Dinner',
				start: '2016-06-12T20:00:00',
				color: '#DA4453'
			},
			{
				title: 'Birthday Party',
				start: '2016-06-13T07:00:00',
				color: '#DA4453'
			},
			{
				title: 'Click for Google',
				url: 'http://google.com/',
				start: '2016-06-28',
				color: '#3BAFDA'
			}
		]
	});

	fcEventColors.render();

});