function setupSound() {
	Mojo.Log.info("Loading Sound: ");
	var file = Mojo.appPath + "audio/BassDrum.wav";
	Mojo.Log.info(file);
	setupSound.audioPlayer = new Audio();
	setupSound.audioPlayer.src = file;
	setupSound.audioPlayer.autoplay = false;
	play: function() {
		Mojo.Log.info("Sound Triggered");
		setupSound.audioPlayer.play();
	}
}

