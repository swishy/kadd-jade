function getLocale() {
		var currentLocale = Mojo.Locale.getCurrentLocale();
		Mojo.Log.info("Current locale is: " + currentLocale);
		return currentLocale;
}