function GooViewAssistant(argFromPusher) {
}

GooViewAssistant.prototype = {
	setup: function() {
		this.state = 0;
		Ares.setupSceneAssistant(this);
		Mojo.Event.listen(this.controller.get(document), Mojo.Event.tap,this.handleTap.bind(this));
		setupSound();
		this.controller.listen(document, 'shaking', this.handleShaking.bindAsEventListener(this));
	},
	cleanup: function() {
		Ares.cleanupSceneAssistant(this);
	},
	handleShaking: function() {
		if ( this.state === 0 ) {
			Mojo.Controller.stageController.pushScene("Preferences");
			Mojo.Log.info("into push function");
			Mojo.Log.info("Shaking with magnitude: ", event.magnitude);
			this.state = 1;
		}
		else if ( this.state === 1 ) {
			Mojo.Controller.stageController.popScene("Preferences");
			Mojo.Log.info("into pop function");
			this.state = 0;
		}
	},
	handleTap: function(event) {
		var x = event.down.x;
		var y = event.down.y;
		Mojo.Log.info("Goo touched at x: " + x + " y: " + y);
		this.gridMap(x, y);
		setupSound.audioPlayer.play();
	},
	gridMap: function(x, y) {
		var columnValue = (x / 106.66);
		var rowValue = (y / 120);
		var columnID;
		var rowID;
		Mojo.Log.info("columnValue: " + columnValue);
		if ( columnValue > 0 && columnValue <= 1 ) {
			columnID = "0";
		}
		else if ( columnValue > 1 && columnValue <= 2) {
			columnID = "1";
		}
		else if ( columnValue > 2 && columnValue <= 3) {
			columnID = "2";
		}
		if ( rowValue > 0 && rowValue <= 1 ) {
			rowID = "0";
		}
		else if ( rowValue > 1 && rowValue <= 2 ) {
			rowID = "1";
		}
		else if ( rowValue > 2 && rowValue <= 3 ) {
			rowID = "2";
		}
		else if ( rowValue > 3 && rowValue <= 4 ) {
			rowID = "3";
		}
		Mojo.Log.info("grid =" + columnID + rowID);
		}
};