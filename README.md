# OktaDev Schematics
[![NPM version][npm-image]][npm-url] [![Build Status][github-actions-image]][github-actions-url] <!--[![Dependency Status][daviddm-image]][daviddm-url]--> <object id="badge" data="https://snyk-widget.herokuapp.com/badge/npm/%40oktadev%2Fschematics/6.1.0/badge.svg" type="image/svg+xml"></object> [![Known Vulnerabilities][snyk-image]][snyk-url]
> Fast and easy installation of Okta and Auth0's OIDC SDKs

This project is a Schematics implementation that allows you to easily integrate Okta and Auth0 into your Angular, React, Vue, Ionic, React Native, and Express projects.

This library currently supports:

- [OAuth 2.0 Authorization Code Flow](https://tools.ietf.org/html/rfc6749#section-1.3.1)
- [Proof Key for Code Exchange (PKCE)](https://tools.ietf.org/html/rfc7636)

**Prerequisites:** [Node.js](https://nodejs.org/). 

Use the links below to see how to create an app and integrate authentication using OktaDev Schematics.

* [Angular](#angular) 
* [React](#react)
* [Vue](#vue)
* [Ionic](#ionic)
* [React Native](#react-native)
* [Express](#express)

To learn more about this project, see the following topics:

* [Testing](#testing)
* [Contributing](#contributing)
* [Tutorials](#tutorials)
* [Links](#links)
* [Help](#help)
* [License](#license)

## Angular 

First, create an empty project with Angular CLI. You **must** add Angular routing for this schematic to work.

```
npm i -g @angular/cli
ng new secure-angular --routing
cd secure-angular
```

Then, integrate your Angular app with [Okta](#okta-for-angular) or [Auth0](#auth0-for-angular).

### Okta for Angular

1. Install the [Okta CLI](https://cli.okta.com).
2. Run `okta register` to create an account, followed by `okta apps create`.
3. Choose **Single Page App** and use `http://localhost:4200/callback` for the Redirect URI.

In your `secure-angular` project, add `@oktadev/schematics`:

```
ng add @oktadev/schematics
```

Use the values that the Okta CLI provides for the issuer and client ID when prompted.

Run `npm start`, open `http://localhost:4200` in your browser, and sign in. 🥳

See the [Okta Angular SDK](https://github.com/okta/okta-angular) for more information.

You can also use the Okta Admin Console:

* Log in to your Okta instance (or [create an account](https://developer.okta.com/signup) if you don't have one). Go to **Applications** > **Create App Integration** > **OIDC**.
* Choose **Single-Page Application** as the application type and click **Next**.
* Add `http://localhost:4200/callback` as a Sign-in redirect URI and `http://localhost:4200` as a Sign-out redirect URI.
* Specify `http://localhost:4200` as a Trusted Origin and click **Save**.

### Auth0 for Angular

1. Install the [Auth0 CLI](https://github.com/auth0/auth0-cli).
2. Run `auth0 login` to register your account, followed by `auth0 apps create`.
3. Specify a name and description of your choosing.
4. Select **Single Page Web Application** and use `http://localhost:4200/home` for the Callback URLs.
5. Use `http://localhost:4200` for the rest of the URLs.

In your `secure-angular` project, add `@oktadev/schematics` with the `--auth0` flag:

```
ng add @oktadev/schematics --auth0
```

Use the values that the Auth0 CLI provides for the issuer and client ID when prompted. 

Run `npm start`, open `http://localhost:4200` in your browser, and sign in. 🥳

See the [Auth0 Angular SDK](https://github.com/auth0/auth0-angular) for more information.

You can also use the Auth0 Console:

* [Log in](https://auth0.com/auth/login) to Auth0 or [create an account](https://auth0.com/signup) if you don't have one. Go to **Applications** > **Create Application**.
* Choose **Single Page Web Applications** as the application type and click **Create**.
* Select the **Settings** tab.
* Add `http://localhost:4200/home` as an Allowed Callback URL and `http://localhost:4200` as a Logout URL.
* Specify `http://localhost:4200` as an Allowed Origin and click **Save Changes** at the bottom.

## React

Create a new project with Create React App.

```
npx create-react-app secure-react
cd secure-react
```

If you'd like to use TypeScript, add the `--template typescript` flag.

```
npx create-react-app secure-react --template typescript
cd secure-react
```

Then, integrate your React app with [Okta](#okta-for-react) or [Auth0](#auth0-for-react).

### Okta for React

1. Install the [Okta CLI](https://cli.okta.com).
2. Run `okta register` to create an account, followed by `okta apps create`.
3. Choose **Single Page App** and use `http://localhost:3000/callback` for the Redirect URI.

Install the Schematics CLI globally.

```
npm install -g @angular-devkit/schematics-cli
```

Then install and run the `add-auth` schematic in your `secure-react` project.

```
npm i -D @oktadev/schematics
schematics @oktadev/schematics:add-auth
```

Use the values that the Okta CLI provides for the issuer and client ID when prompted.

Run `npm start`, open `http://localhost:3000` in your browser, and sign in. 🎉

See the [Okta React SDK](https://github.com/okta/okta-react) for more information.

You can also use the Okta Admin Console:

* Log in to your Okta instance (or [create an account](https://developer.okta.com/signup) if you don't have one). Go to **Applications** > **Create App Integration** > **OIDC**.
* Choose **Single-Page Application** as the application type and click **Next**.
* Add `http://localhost:3000/callback` as a Sign-in redirect URI and `http://localhost:3000` as a Sign-out redirect URI.
* Add `http://localhost:3000` as a Trusted Origin and click **Save**.

### Auth0 for React

1. Install the [Auth0 CLI](https://github.com/auth0/auth0-cli).
2. Run `auth0 login` to register your account, followed by `auth0 apps create`.
3. Specify a name and description of your choosing.
4. Select **Single Page Web Application** and use `http://localhost:3000` for the Callback URL.
5. Use `http://localhost:3000` for the rest of the URLs.

Install the Schematics CLI globally.

```
npm install -g @angular-devkit/schematics-cli
```

Then install and run the `add-auth` schematic in your `secure-react` project with the `--auth0` flag:

```
npm i -D @oktadev/schematics
schematics @oktadev/schematics:add-auth --auth0
```

Use the values that the Auth0 CLI provides for the issuer and client ID when prompted.

Run `npm start`, open `http://localhost:3000` in your browser, and sign in. 🎉

See the [Auth0 React SDK](https://github.com/auth0/auth0-react) for more information.

You can also use the Auth0 Console:

* [Log in](https://auth0.com/auth/login) to Auth0 or [create an account](https://auth0.com/signup) if you don't have one. Go to **Applications** > **Create Application**.
* Choose **Single Page Web Applications** as the application type and click **Create**.
* Select the **Settings** tab.
* Add `http://localhost:3000` as an Allowed Callback URL and `http://localhost:3000` as a Logout URL.
* Specify `http://localhost:3000` as an Allowed Origin and click **Save Changes** at the bottom.

## Vue

Create a new project with Vue CLI. You **must** add routing for this schematic to work. If you specify TypeScript, a `src/router/index.ts` will be used.

```
npm i -g @vue/cli
vue create secure-vue
cd secure-vue
```

Then, integrate your Vue app with [Okta](#okta-for-vue) or [Auth0](#auth0-for-vue).

### Okta for Vue

1. Install the [Okta CLI](https://cli.okta.com).
2. Run `okta register` to create an account, followed by `okta apps create`.
3. Choose **Single Page App** and use `http://localhost:8080/callback` for the Redirect URI.

Install the Schematics CLI globally.

```
npm install -g @angular-devkit/schematics-cli
```

Then install and run the `add-auth` schematic in your `secure-vue` project.

```
npm i -D @oktadev/schematics
schematics @oktadev/schematics:add-auth
```

Use the values that the Okta CLI provides for the issuer and client ID when prompted.

Run `npm run serve`, open `http://localhost:8080` in your browser, and sign in. 💥

See the [Okta Vue SDK](https://github.com/okta/okta-vue) for more information.

You can also use the Okta Admin Console:

* Log in to your Okta instance (or [create an account](https://developer.okta.com/signup) if you don't have one). Go to **Applications** > **Create App Integration** > **OIDC**.
* Choose **Single-Page Application** as the application type and click **Next**.
* Add `http://localhost:8080/callback` as a Sign-in redirect URI and `http://localhost:8080` as a Sign-out redirect URI.
* Add `http://localhost:8080` as a Trusted Origin and click **Save**.

### Auth0 for Vue

1. Install the [Auth0 CLI](https://github.com/auth0/auth0-cli).
2. Run `auth0 login` to register your account, followed by `auth0 apps create`.
3. Specify a name and description of your choosing.
4. Select **Single Page Web Application** and use `http://localhost:8080` for the Callback URL.
5. Use `http://localhost:8080` for the rest of the URLs.

Install the Schematics CLI globally.

```
npm install -g @angular-devkit/schematics-cli
```

Then install and run the `add-auth` schematic in your `secure-react` project with the `--auth0` flag:

```
npm i -D @oktadev/schematics
schematics @oktadev/schematics:add-auth --auth0
```

Use the values that the Auth0 CLI provides for the issuer and client ID when prompted.

Run `npm run serve`, open `http://localhost:8080` in your browser, and sign in. 💥

See the [Auth0 Vue SDK](https://github.com/auth0/auth0-vue) for more information.

You can also use the Auth0 Console:

* [Log in](https://auth0.com/auth/login) to Auth0 or [create an account](https://auth0.com/signup) if you don't have one. Go to **Applications** > **Create Application**.
* Choose **Single Page Web Applications** as the application type and click **Create**.
* Select the **Settings** tab.
* Add `http://localhost:8080` as an Allowed Callback URL and `http://localhost:8080` as a Logout URL.
* Specify `http://localhost:8080` as an Allowed Origin and click **Save Changes** at the bottom.

## Ionic

Create a new Ionic + Angular project with Ionic CLI. You **must** use the `tabs` layout for everything to work correctly. 

```
npm install -g @ionic/cli
ionic start secure-ionic tabs --type=angular-standalone --no-interactive 
cd secure-ionic
```

Then, integrate your Ionic app with [Okta](#okta-for-ionic) or [Auth0](#auth0-for-ionic).

### Okta for Ionic

1. Install the [Okta CLI](https://cli.okta.com).
2. Run `okta register` to create an account, followed by `okta apps create`.
3. Choose **Native** and use `[com.okta.dev-133337:/callback,http://localhost:8100/callback,https://localhost]` for the Login redirect URIs (where `dev-133337.okta.com` is your Okta domain).
4. Use `[com.okta.dev-133337:/logout,http://localhost:8100/logout]` for the Logout redirect URIs.

In your `secure-ionic` project, add `@oktadev/schematics`:

```
ng add @oktadev/schematics
```

Use the values that the Okta CLI provides for the issuer and client ID when prompted.

Start your app and authenticate with Okta. 🎊

```
ionic serve
```

You can also use the Okta Admin Console:

Log in to your Okta instance (or [sign up](https://developer.okta.com/signup/) if you don't have an account).

From the **Applications** page, choose **Create App Integration** > **OIDC**. Select **Native Application**. 

Give your app a memorable name, and configure it as follows:

* Sign-in redirect URIs:
  * `http://localhost:8100/callback`
  * `com.okta.dev-133337:/callback` (where `dev-133337.okta.com` is your Okta domain)
  * `https://localhost`
* Sign-out redirect URIs:
  * `http://localhost:8100/logout`
  * `com.okta.dev-133337:/logout`
* Trusted Origins:
  * `http://localhost:8100`
* Click **Save**

### Auth0 for Ionic

1. Install the [Auth0 CLI](https://github.com/auth0/auth0-cli).
2. Run `auth0 login` to register your account, followed by `auth0 apps create`.
3. Specify a name and description of your choosing.
4. Select **Native** and use `dev.localhost.ionic:/callback,http://localhost:8100/callback` for the Callback URLs.
5. Use `dev.localhost.ionic:/logout,http://localhost:8100/logout` for the Logout URLs.
6. Run `auth0 apps open` and add `http://localhost:8100,http://localhost` to **Allowed Origins (CORS)**. Scroll down and **Save Changes**.

In your `secure-ionic` project, add `@oktadev/schematics` with the `--auth0` flag:

```
ng add @oktadev/schematics --auth0
```

Use the values that the Auth0 CLI provides for the issuer and client ID when prompted.

Start your app and authenticate with Auth0. 🎊

```
ionic serve
```

You can also use the Auth0 Console:

* [Log in](https://auth0.com/auth/login) to Auth0 or [create an account](https://auth0.com/signup) if you don't have one. Go to **Applications** > **Create Application**.
* Choose **Native** as the application type and click **Create**.
* Select the **Settings** tab.
* Add `dev.localhost.ionic:/callback,http://localhost:8100/callback` for Allowed Callback URLs and `dev.localhost.ionic:/logout,http://localhost:8100/logout` for the Logout URLs.
* Add `http://localhost:8100,https://localhost` to **Allowed Origins (CORS)**. Scroll down and **Save Changes**.

### iOS

Build and add Capacitor for iOS with the following commands:

```
ionic build
npm i @capacitor/ios
npx cap add ios
```

Add your custom scheme to `ios/App/App/Info.plist`:

```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLName</key>
    <string>com.getcapacitor.capacitor</string>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>dev.localhost.ionic</string>
      <string>com.okta.dev-133337</string>
    </array>
  </dict>
</array>
```

Then, run your project using the Capacitor CLI:

```
npx cap run ios
```

You can also open your project in Xcode and configure code signing.

```
npx cap open ios
```

Then run your app from Xcode.

### Android

Build and add Capacitor for Android with the following commands:

```
ionic build
npm i @capacitor/android
npx cap add android
```

Add your reverse domain name as the `android:scheme` in `android/app/src/main/AndroidManifest.xml` by adding another `<intent-filter>` above the existing one in the `<activity>` element.

```xml
<intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT"/>
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="com.okta.dev-133337" /> <!-- use dev.localhost.ionic for Auth0 -->
</intent-filter>
```

Then, run your project using the Capacitor CLI:

```
npx cap run android
```

You can also open your project in Android Studio and run your app.

```
npx cap open android
```

See [Ionic's iOS](https://ionicframework.com/docs/developing/ios) and [Android Development](https://ionicframework.com/docs/developing/android) docs for more information.

## React Native

Create a new React Native project with the React Native CLI. 

```
npx react-native init SecureApp
```

Then, integrate your React Native app with [Okta](#okta-for-react-native) or [Auth0](#auth0-for-react-native).

### Okta for React Native

1. Install the [Okta CLI](https://cli.okta.com).
2. Run `okta register` to create an account, followed by `okta apps create`.
3. Choose **Native** and accept the default Redirect URI of `com.okta.dev-133337:/callback` (where `dev-133337.okta.com` is your Okta domain).
4. Use `com.okta.dev-133337:/logout` for the Post Logout Redirect URI.

Install the Schematics CLI globally.

```
npm install -g @angular-devkit/schematics-cli
```

Install and run the `add-auth` schematic in your `SecureApp` project.

```
cd SecureApp
npm i -D @oktadev/schematics
schematics @oktadev/schematics:add-auth --issuer=$issuer --client-id=$clientId
```

You can also use the Okta Admin Console:

* Log in to your Okta instance (or [create an account](https://developer.okta.com/signup) if you don't have one). Go to **Applications** > **Create App Integration** > **OIDC**.
* Choose **Native** as the application type and click **Next**.
* Add `com.okta.dev-133337:/callback` as a Sign-in redirect URI and `com.okta.dev-133337:/callback` as a Sign-out redirect URI (where `dev-133337.okta.com` is your Okta domain).

### Auth0 for React Native

1. Install the [Auth0 CLI](https://github.com/auth0/auth0-cli).
2. Run `auth0 login` to register your account, followed by `auth0 apps create`.
3. Specify a name and description of your choosing.
4. Select **Native** and use the following for your Callback and Logout URLs:

       org.reactjs.native.example.<yourappname>.auth0://<your-auth0-domain>/ios/org.reactjs.native.example.<yourappname>/callback,com.<yourappname>.auth0://<your-auth0-domain>/android/com.<yourappname>/callback

For example:

```
org.reactjs.native.example.secureauth0.auth0://dev-06bzs1cu.us.auth0.com/ios/org.reactjs.native.example.secureauth0/callback, com.secureauth0.auth0://dev-06bzs1cu.us.auth0.com/android/com.secureauth0/callback
```

Install the Schematics CLI globally.

```
npm install -g @angular-devkit/schematics-cli
```

Install and run the `add-auth` schematic in your `SecureApp` project with the `--auth0` flag. 

```
cd SecureApp
npm i -D @oktadev/schematics
schematics @oktadev/schematics:add-auth --issuer=$issuer --client-id=$clientId --auth0
```

You can also use the Auth0 Console:

* [Log in](https://auth0.com/auth/login) to Auth0 or [create an account](https://auth0.com/signup) if you don't have one. Go to **Applications** > **Create Application**.
* Choose **Native** as the application type and click **Create**.
* Select the **Settings** tab.
* Add the following for Allowed Callback and Logout URLs:

       org.reactjs.native.example.<yourappname>.auth0://<your-auth0-domain>/ios/org.reactjs.native.example.<yourappname>/callback,com.<yourappname>.auth0://<your-auth0-domain>/android/com.<yourappname>/callback

For example:

```
org.reactjs.native.example.secureauth0.auth0://dev-06bzs1cu.us.auth0.com/ios/org.reactjs.native.example.secureauth0/callback, com.secureauth0.auth0://dev-06bzs1cu.us.auth0.com/android/com.secureauth0/callback
```

### iOS

Run `npx pod-install`.

Start your app and authenticate with Okta. 🎉

```
npm run ios
```

**NOTE:** If you have issues with compiling, you may have to disable Flipper in `ios/Podfile`. Then run `npx pod-install` again.

### Android

One change is made to Android build files. In `android/app/build.gradle`, a `manifestPlaceholders` is added in `android` > `defaultConfig`.

Since this modification is done for you, you can simply start your app and authenticate with Okta. 🎊

```
npm run android
```

For more information, see the [Okta React Native SDK](https://github.com/okta/okta-react-native#readme) and the [Auth0 React Native SDK](https://github.com/auth0/react-native-auth0#readme).

## Express

Create a new project with express-generator and pug.

```
mkdir express-app
cd express-app
npx express-generator --view=pug
```
Then, integrate your Express app with [Okta](#okta-for-express) or [Auth0](#auth0-for-express).

### Okta for Express

1. Install the [Okta CLI](https://cli.okta.com).
2. Run `okta register` to create an account, followed by `okta apps create`.
3. Choose **Web** > **Other** and use `http://localhost:3000/callback` for the Redirect URI.
4. Accept the default Post Logout Redirect URI (`http://localhost:3000/`).

Install the Schematics CLI globally.

```
npm install -g @angular-devkit/schematics-cli
```

Then install and run the `add-auth` schematic in your `express-app` project. 

The Okta CLI will create an `.okta.env` file in the current directory. It will have the values you need. After you use them in the command below, you can delete this file.

```
npm i -D @oktadev/schematics
schematics @oktadev/schematics:add-auth --issuer=$issuer \
  --client-id=$clientId --client-secret=$clientSecret
```

🚨 This process will create an `.env` file will be generated with your credentials. Make sure to add `*.env` to `.gitignore` and don't check it into source control!

Start your app and authenticate with Okta at `http://localhost:3000`. 🎊

```
npm start
```

See the [Okta OIDC Middleware SDK](https://github.com/okta/okta-oidc-js/tree/master/packages/oidc-middleware#readme) for more information.

You can also create your app using the Okta Admin Console:

* Log into the Okta Developer Dashboard (or [create an account](https://developer.okta.com/signup) if you don't have one), click **Applications** then **Create App Integration** > **OIDC**.
* Choose **Web** as the application type and click **Next**.
* Add a Sign-in redirect URI of `http://localhost:3000/callback`.
* Add a Sign-out redirect URI of `http://localhost:3000`.
* Click **Save**.

### Auth0 for Express

1. Install the [Auth0 CLI](https://github.com/auth0/auth0-cli).
2. Run `auth0 login` to register your account, followed by `auth0 apps create`.
3. Specify a name and description of your choosing.
4. Select **Regular Web Application** and use `http://localhost:3000/callback` for the Callback URL.
5. Use `http://localhost:3000` for the Logout URL.

Install the Schematics CLI globally.

```
npm install -g @angular-devkit/schematics-cli
```

Then install and run the `add-auth` schematic in your `express-app` project with the `--auth0` flag.

Use the values that the Auth0 CLI provides for the issuer and client ID. You may have to use `auth0 apps open` to get the client secret for your app.

```
npm i -D @oktadev/schematics
schematics @oktadev/schematics:add-auth --issuer=$issuer \
  --client-id=$clientId --client-secret=$clientSecret --auth0
```

🚨 This process will create an `.env` file with your credentials. Make sure to add `*.env` to `.gitignore` and don't check it into source control!

Start your app and authenticate with Auth0 at `http://localhost:3000`. 🎊

```
npm start
```

See the [Auth0 Express OpenID Connect SDK](https://github.com/auth0/express-openid-connect#readme) for more information.

You can also use the Auth0 Console:

* [Log in](https://auth0.com/auth/login) to Auth0 or [create an account](https://auth0.com/signup) if you don't have one. Go to **Applications** > **Create Application**.
* Choose **Regular Web Application** as the application type and click **Create**.
* Select the **Settings** tab.
* Add `http://localhost:3000/callback` as an Allowed Callback URL and `http://localhost:3000` as a Logout URL.
* Click **Save Changes** at the bottom.

## Testing

This project supports unit tests and integration tests.

`npm test` will run the unit tests, using [Jasmine](https://jasmine.github.io/) as a runner and test framework.

`./test-app.sh angular` will create an Angular project with Angular CLI, install this project, and make sure all the project's tests pass. Other options include `react`, `react-ts`, `vue`, `vue-ts`, `ionic`, `ionic`, `react-native`, and `express`. You can also add `-auth0` to any of these options.

`./test-all.sh` will test all the options for both Okta and Auth0: Angular, React, React with TypeScript, Vue, Vue with TypeScript, Ionic with Capacitor, React Native, and Express.

## Publishing

To publish, simply do:

```bash
npm publish
```

That's it!

## Contributing

If you'd like to modify this library, and contribute your changes, you can start by forking it to your own GitHub repository. Then, clone it to your hard drive.

```
git clone git@github.com:<your username>/schematics.git
cd schematics
```

Create a new branch for your changes:

```
git checkout -b my-awesome-branch
```

Make the changes you want to make and add tests where appropriate. Create a new project with whatever framework you're using, then run the following command inside it to use your modified project.

```
npm link /path/to/schematics
```

You'll need to run `npm run build` whenever you change anything in the schematics project.

**NOTE:** You can also use `npm pack` in your schematics project, then `npm install /path/to/artifact.tar.gz` in your test project. 

## Tutorials

Check out the following blog posts to see OktaDev Schematics in action.

* [Add OpenID Connect to Angular Apps Quickly](https://auth0.com/blog/add-oidc-to-angular-apps-quickly/)
* [Use Angular Schematics to Simplify Your Life](https://developer.okta.com/blog/2019/02/13/angular-schematics)
* [Use Schematics with Vue and Add Authentication in 5 Minutes](https://developer.okta.com/blog/2019/05/21/vue-schematics)
* [Use Schematics with React and Add OpenID Connect Authentication in 5 Minutes](https://developer.okta.com/blog/2019/03/05/react-schematics)
* [Tutorial: User Login and Registration in Ionic 4](https://developer.okta.com/blog/2019/06/20/ionic-4-tutorial-user-authentication-and-registration)
* [Create a React Native App with Login in 10 Minutes](https://developer.okta.com/blog/2019/11/14/react-native-login)

## Links

This project uses the following open source libraries from Okta:

* [Okta Angular SDK](https://github.com/okta/okta-angular)
* [Okta React SDK](https://github.com/okta/okta-react)
* [Okta Vue SDK](https://github.com/okta/okta-vue)
* [Okta React Native SDK](https://github.com/okta/okta-react-native)
* [Okta OIDC Middleware](https://github.com/okta/okta-oidc-middleware)

And these from Auth0:

* [Auth0 Angular SDK](https://github.com/auth0/auth0-angular)
* [Auth0 React SDK](https://github.com/auth0/auth0-react)
* [Auth0 Vue SDK](https://github.com/auth0/auth0-vue)
* [Auth0 React Native SDK](https://github.com/auth0/react-native-auth0)
* [Auth0 Express OpenID Connect](https://github.com/auth0/express-openid-connect)

For Ionic, it uses [Ionic AppAuth](https://github.com/wi3land/ionic-appauth).

## Help

Please post any questions as issues or ask them on the [Okta Developer Forums][devforum-url] or [Auth0 Community Forums][community-url].

## License

Apache 2.0, see [LICENSE](LICENSE).

[npm-image]: https://img.shields.io/npm/v/@oktadev/schematics.svg
[npm-url]: https://www.npmjs.com/package/@oktadev/schematics
[github-actions-image]: https://github.com/oktadev/schematics/workflows/Schematics/badge.svg
[github-actions-url]: https://github.com/oktadev/schematics/actions
[daviddm-image]: https://david-dm.org/oktadev/schematics.svg?theme=shields.io
[daviddm-url]: https://david-dm.org/oktadev/schematics
[devforum-image]: https://img.shields.io/badge/support-developer%20forum-blue.svg
[devforum-url]: https://devforum.okta.com
[community-url]: https://community.auth0.com/
[snyk-url]: https://snyk.io/test/github/oktadev/schematics
[snyk-image]: https://snyk.io/test/github/oktadev/schematics/badge.svg
