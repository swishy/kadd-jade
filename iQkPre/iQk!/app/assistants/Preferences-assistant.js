function PreferencesAssistant(argFromPusher) {
}

PreferencesAssistant.prototype = {
	setup: function() {
		Ares.setupSceneAssistant(this);
	},
	cleanup: function() {
		Ares.cleanupSceneAssistant(this);
	}
};