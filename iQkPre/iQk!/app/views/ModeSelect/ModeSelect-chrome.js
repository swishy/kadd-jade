opus.Gizmo({
	name: "ModeSelect",
	layoutKind: "absolute",
	dropTarget: true,
	type: "Palm.Mojo.Panel",
	l: 0,
	w: "325",
	t: "0",
	b: "",
	h: "360",
	hAlign: "center",
	vAlign: "center",
	styles: {
		zIndex: 2,
		opacity: 1,
		bgColor: "transparent",
		bgImage: "images/iQkSelectionBackground.png"
	},
	chrome: [
		{
			name: "SoloButton",
			plane: "1",
			type: "Palm.Picture",
			l: 44,
			w: "104",
			t: 174,
			h: "67",
			styles: {
				bgImage: "images/iQkSoloButtonEn.png"
			}
		},
		{
			name: "MultiButton",
			plane: "1",
			type: "Palm.Picture",
			l: 181,
			w: "104",
			t: 154,
			h: "87",
			styles: {
				bgImage: "images/iQkMultiButtonEN.png"
			}
		}
	]
});