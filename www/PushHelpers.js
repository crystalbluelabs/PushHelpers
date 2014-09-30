var PushHelpers = function() {

}

// Detect if the user has push notifications enabled at the system leve. iOS only.
PushHelpers.prototype.isPushEnabled = function (success, failure) {
	cordova.exec(success, failure, "PushHelpers", "checkPush", []);
}

// Get data from a push notification passed while app is in background.
PushHelpers.prototype.getPushData = function (success, failure) {
	cordova.exec(success, failure, "PushHelpers", "getData", []);
}