# [SPIRIT/21](http://spirit21.com) cordova-plugin-1password

Plugin for adding [1Password App Extension](https://github.com/AgileBits/onepassword-app-extension) into Cordova/PhoneGap Apps.


## Installation

```
cordova plugin add cordova-plugin-1password
```

### Supported Platforms

- iOS 9.0
- No support for iPad!!

## Properties

- OnePassword.findLoginForUrl(succesCallback, errorCallback, url)
- OnePassword.storeLoginForUrl(succesCallback, errorCallback, username, password, url)

## Usage

You **do not** need to reference any JavaScript, the Cordova plugin architecture will add a OnePassword object to your root automatically when you build.

Ensure you use the plugin after your `deviceready` event has been fired.

### Find login for url

Pass the following arguments to the `findLoginForUrl()` function, to prompt the user to authenticate via 1Password:

1. Success callback (called when a user has selected a login)
2. Failure callback (called when a user cancels the 1Password prompt or an error occurs.)
5. URL (String)*

```
OnePassword.findLoginForUrl(succesCallback, errorCallback, url)
```

### Store login for url

Pass the following arguments to the `storeLoginForUrl()` function, to prompt the user to authenticate via 1Password:

1. Success callback (called when a user has selected a login)
2. Failure callback (called when a user cancels the 1Password prompt or an error occurs)
3. Username (String) 
4. Password (String)
5. URL (String)*
6. Title (String)
7. Section title (String)


```
OnePassword.storeLoginForUrl(succesCallback, errorCallback, username, password, url, title, sectionTitle)
```

## *Best Practices ([see also](https://github.com/AgileBits/onepassword-app-extension#best-practices))

* Use the same `URL` during Registration and Login.
* Ensure your `URL` is set to your actual service so your users can easily find their logins within the main 1Password app.
* You should only ask for the login information of your own service or one specific to your app. Giving a URL for a service which you do not own or support may seriously break the customer's trust in your service/app.
* If you don't have a website for your app you should specify your bundle identifier as the `URL`, like so: `app://bundleIdentifier` (e.g. `app://com.acme.awesome-app`).


## The MIT License (MIT)

Copyright (c) 2016 SPIRIT/21

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.