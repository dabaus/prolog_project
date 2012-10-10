
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
	if (input.length > 0) {
		socket.emit(inputDest, {line:input});
		$inputText.val('');
	}

	if (inputDest === 'chat') {
		console.log('bob');
		var entry = '<div class="chat-entry local">' + input + '<div>';
		$divChat.append(entry);
	}
}

window.addEventListener('load', function(){
	$radioConsole = $('#radioConsole');
	$radioChat = $('#radioChat');
	$divConsole = $('#console');
	$divChat = $('#pretty');
	$inputText = $('#write');
	$inputSubmit = $('#submit');

	updateButtons();

	socket = io.connect();

	socket.on('console', function(data){
		var entry = '<div class="console-entry">' + data.line + '<div>';
		$divConsole.append(entry);
	});

	socket.on('chat', function(data) {
		console.log(data);
		if (typeof data.RESP !== 'undefined') {
			if (data.RESP.length > 0) {
				var entry = '<div class="chat-entry rem">' + data.RESP[0] + '<div>';
				$divChat.append(entry);
				
			}
		}
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