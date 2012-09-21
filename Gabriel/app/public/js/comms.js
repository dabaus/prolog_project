
var inputDest = 'chat',
	radioConsole, 
	radioChat;

function updateButtons() {
	if (inputDest === 'chat') {
		radioConsole.className = 'option up';
		radioChat.className = 'option press';
	} else if (inputDest === 'console') {
		radioConsole.className = 'option press';
		radioChat.className = 'option up';
	} else throw 'WHAT';
}

function toggleInput() {
	inputDest = (inputDest==='chat'?'console':'chat');
	updateButtons();
}

window.addEventListener('load', function(){
	radioConsole = document.getElementById('radioConsole');
	radioChat = document.getElementById('radioChat');

	updateButtons();
	
	var socket = io.connect(window.location.host);

	socket.on('connect', function(){

	});
});