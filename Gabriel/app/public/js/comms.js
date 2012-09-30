
var inputDest = 'chat',
	$radioConsole, $radioChat,
	$divConsole, $divChat,
	$inputText, $inputSubmit,
	socket;

function updateButtons() {
	if (inputDest === 'chat') {
		$radioConsole.addClass('up').removeClass('press');
		$radioChat.addClass('press').removeClass('up');
	
	} else if (inputDest === 'console') {
		$radioChat.addClass('up').removeClass('press');
		$radioConsole.addClass('press').removeClass('up');
	} else throw 'WHAT';
}

function toggleInput() {
	inputDest = (inputDest==='chat'?'console':'chat');
	updateButtons();
}

function submitContent() {
	var input = $inputText.val();
	console.log('Sending: ' + input);
	if (input.length > 0) {
		socket.emit(inputDest, {line:input});
		$inputText.val('');
	}
}

window.addEventListener('load', function(){
	$radioConsole = $('#radioConsole');
	$radioChat = $('#radioChat');
	$divConsole = $('#console');
	$divChat = $('#chat');
	$inputText = $('#write');
	$inputSubmit = $('#submit');

	updateButtons();

	socket = io.connect();

	socket.on('console', function(data){
		var entry = '<div class="console-entry">' + data.line + '<div>';
		$divConsole.append(entry);
	});

	$inputText.on('keyup', function(e){
		if (e.keyCode === 13) {
			submitContent();
		}
	});

	$inputSubmit.on('click', function(){
		submitContent();
	});
});