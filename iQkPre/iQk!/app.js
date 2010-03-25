opus.depends({
	paths: {
		"Ares": "/Ares",
		"mojo": "/usr/palm/frameworks/mojo/",
		"opus": "$Ares/foss/opus/opus",
		"Palm": "$Ares/ide",
		"kit": "$Palm/library/kit",
		"MojoLib": "$Palm/library/Mojo/",
		"palm-core": "$kit/",
		"Palm-Mojo": "$MojoLib/",
		"kit~": "$opus/source/",
		"controls~": "$opus/library/controls/source/"
	},
	nobuild: [
		"$mojo/mojo.js",
		"app-build.js"
	]
});