//updateした内容を差し替え
$('#inputEditForm').html('<%= escape_javascript(render("calendars/edit", calendars: @calendars)) %>');
//モーダル背景画面を消す
$('.modal-backdrop').remove();
// フルカレンダー を一度消しもう一度表示
$('#calendar').fullCalendar('refetchCalendars')