function StageAssistant() {
}

StageAssistant.prototype.setup = function() {
	//this.controller.pushScene({name: "main", disableSceneScroller: true});
	this.controller.setWindowOrientation("free");
	this.controller.pushScene({name: "GooView", disableSceneScroller: true});
	//this.controller.pushScene({name: "ModeSelect", disableSceneScroller: true});
};