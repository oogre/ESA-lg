var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
var recognition = new SpeechRecognition();
recognition.continuous = true;
recognition.interimResults = true;
recognition.maxAlternatives = 1;
recognition.onresult = function(event) {
  console.log(event.results[event.results.length-1][0].transcript);
}
recognition.start();