var exec = require('cordova/exec');

var TwitterConnect = {
	login: function (successCallback, errorCallback) {
		exec(successCallback, errorCallback, 'TwitterConnect', 'login', []);
	},
	logout: function (successCallback, errorCallback) {
		exec(successCallback, errorCallback, 'TwitterConnect', 'logout', []);
	},
	showUser: function (successCallback, errorCallback) {
		exec(successCallback, errorCallback, 'TwitterConnect', 'showUser', []);
	},
    verifyCredentials: function (successCallback, errorCallback) {
        exec(successCallback, errorCallback, 'TwitterConnect', 'verifyCredentials', []);
    },
	sendTweet: function (msg, successCallback, errorCallback) {
		exec(successCallback, errorCallback, 'TwitterConnect', 'sendTweet', [{"status" : msg}]);
	},
	openComposer: function (text, successCallback, errorCallback) {
		exec(successCallback, errorCallback, 'TwitterConnect', 'openComposer', [text]);
	},
	showTimeline: function (query, successCallback, errorCallback) {
		exec(successCallback, errorCallback, 'TwitterConnect', 'showTimeline', [query]);
	}
};

module.exports = TwitterConnect;
