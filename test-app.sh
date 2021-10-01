#!/usr/bin/env bash

# exit when any command fails
set -e

framework="$1"
issuer="https://dev-2530788.okta.com/oauth2/default"
clientId="0oa1ebjklivAhiM3T5d7"

# build and package this project
rm -f *.tgz
npm run build
npm pack

# create directory to store created apps
mkdir -p apps
cd apps

# install snapshot version of schematics-utilities
# if [ ! -d schematics-utilities ]; then
#  git clone -b refactor/restore-angular-cdk-clone https://github.com/nitayneeman/schematics-utilities.git
# fi
# cd schematics-utilities && npm link
# cd ..

if [ $framework == "angular" ] || [ $framework == "a" ]
then
  ng new angular-app --routing --style css --strict
  cd angular-app
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --clientId=$clientId
  ng test --watch=false
elif [ $framework == "angular-0" ] || [ $framework == "a0" ]
then
  ng new angular-auth0 --routing --style css --strict
  cd angular-auth0
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --clientId=$clientId --auth0
  ng test --watch=false
elif [ $framework == "react-ts" ] || [ $framework == "rts" ]
then
  npx create-react-app@4.0.3 react-app-ts --template typescript
  cd react-app-ts
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --clientId=$clientId
  CI=true npm test
elif [ $framework == "react" ] || [ $framework == "r" ]
then
  npx create-react-app@4.0.3 react-app
  cd react-app
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --clientId=$clientId
  CI=true npm test
elif [ $framework == "vue-ts" ] || [ $framework == "vts" ]
then
  config=$(cat <<EOF
{
  "useConfigFiles": true,
  "plugins": {
    "@vue/cli-plugin-babel": {},
    "@vue/cli-plugin-typescript": {
      "classComponent": true,
      "useTsWithBabel": true
    },
    "@vue/cli-plugin-router": {
      "historyMode": true
    },
    "@vue/cli-plugin-eslint": {
      "config": "base",
      "lintOn": [
        "save"
      ]
    },
    "@vue/cli-plugin-unit-mocha": {},
    "@vue/cli-plugin-e2e-cypress": {}
  }
}
EOF
)
  vue create vue-app-ts -i "$config" --registry=http://registry.npm.taobao.org
  cd vue-app-ts
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --clientId=$clientId
  npm run test:unit
elif [ $framework == "vue" ] || [ $framework == "v" ]
then
  config=$(cat <<EOF
{
  "useConfigFiles": true,
  "plugins": {
    "@vue/cli-plugin-babel": {},
    "@vue/cli-plugin-router": {
      "historyMode": true
    },
    "@vue/cli-plugin-eslint": {
      "config": "base",
      "lintOn": [
        "save"
      ]
    },
    "@vue/cli-plugin-unit-jest": {}
  }
}
EOF
)
  vue create vue-app -i "$config" --registry=http://registry.npm.taobao.org
  cd vue-app
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --clientId=$clientId
  npm run test:unit
elif [ $framework == "vue3-ts" ] || [ $framework == "v3ts" ]
then
  config=$(cat <<EOF
{
  "useConfigFiles": true,
  "plugins": {
    "@vue/cli-plugin-babel": {},
    "@vue/cli-plugin-typescript": {
      "classComponent": false,
      "useTsWithBabel": true
    },
    "@vue/cli-plugin-router": {
      "historyMode": true
    },
    "@vue/cli-plugin-eslint": {
      "config": "base",
      "lintOn": [
        "save"
      ]
    },
    "@vue/cli-plugin-unit-jest": {}
  },
  "vueVersion": "3"
}
EOF
)
  vue create vue3-app-ts -i "$config" --registry=http://registry.npm.taobao.org
  cd vue3-app-ts
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --clientId=$clientId
  npm run test:unit
elif [ $framework == "vue3" ] || [ $framework == "v3" ]
then
  config=$(cat <<EOF
{
  "useConfigFiles": true,
  "plugins": {
    "@vue/cli-plugin-babel": {},
    "@vue/cli-plugin-router": {
      "historyMode": true
    },
    "@vue/cli-plugin-eslint": {
      "config": "base",
      "lintOn": [
        "save"
      ]
    },
    "@vue/cli-plugin-unit-jest": {}
  },
  "vueVersion": "3"
}
EOF
)
  vue create vue3-app -i "$config" --registry=http://registry.npm.taobao.org
  cd vue3-app
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --clientId=$clientId
  npm run test:unit
elif [ $framework == "ionic" ] || [ $framework == "i" ]
then
  ionic start ionic-capacitor tabs --type angular --capacitor --no-interactive
  cd ionic-capacitor
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --clientId=$clientId
  npm run build && ng test --watch=false
elif [ $framework == "ionic-cordova" ] || [ $framework == "icor" ]
then
  ionic start ionic-cordova tabs --type angular --cordova --no-interactive
  cd ionic-cordova
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --clientId=$clientId --platform=cordova
  npm run build && ng test --watch=false
elif [ $framework == "react-native" ] || [ $framework == "rn" ]
then
  npx react-native init SecureApp
  cd SecureApp
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --clientId=$clientId
  # pod install --project-directory=ios
  npm test -- -u
elif [ $framework == "express" ] || [ $framework == "e" ]
then
  mkdir express-app && cd express-app
  npx express-generator --view=pug
  npm i
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --clientId=$clientId --clientSecret='may the auth be with you'
  # npm test -- -u
else
  echo "No '${framework}' framework found!"
fi
