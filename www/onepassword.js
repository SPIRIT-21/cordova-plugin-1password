var exec = require('cordova/exec');
var cordova = require('cordova');

function OnePassword() {

}

OnePassword.prototype.findLoginForUrl = function (success, error, url) {
    exec(success, error, "OnePassword", "findLoginForUrl", [url]);
};

OnePassword.prototype.fillItemIntoWebView = function (success, error, url) {
    exec(success, error, "OnePassword", "fillItemIntoWebView", [url]);
};

OnePassword.prototype.storeLoginForUrl = function (success, error, url, username, password) {
    exec(success, error, "OnePassword", "storeLoginForURLString", [username, password, url]);
};

module.exports = new OnePassword();


