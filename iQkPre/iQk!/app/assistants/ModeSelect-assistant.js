function ModeSelectAssistant(argFromPusher) {
}

ModeSelectAssistant.prototype = {
	setup: function() {
		Ares.setupSceneAssistant(this);
		Mojo.Event.listen(this.controller.get('soloButton'), Mojo.Event.tap, this.handleTap.bind(this));
	},
	cleanup: function() {
		Ares.cleanupSceneAssistant(this);
	},
	soloButtonTap: function(event, inSender) {
	},
	handleTap: function(event) {
		 Mojo.Log.info("tap down at x: " + event.down.x + " y: " + event.down.y);
	}
};