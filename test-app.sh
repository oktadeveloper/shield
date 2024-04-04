#!/usr/bin/env bash

# exit when any command fails
set -e

framework="$1"
issuer="https://dev-17700857.okta.com/oauth2/default"
clientId="0oa9nr5n8dgfTLgk05d7"
auth0Issuer="https://dev-06bzs1cu.us.auth0.com/"
auth0ClientId="KW1uEoUtqQKdiDpdhn82Z3KKIwSJLwjo"

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
  ng new angular-app --routing --style css --strict --ssr false
  cd angular-app
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --client-id=$clientId
  ng test --watch=false
elif [ $framework == "angular-auth0" ] || [ $framework == "a0" ]
then
  ng new angular-auth0 --routing --style css --strict --ssr false
  cd angular-auth0
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$auth0Issuer --client-id=$auth0ClientId --auth0
  ng test --watch=false
elif [ $framework == "react-ts" ] || [ $framework == "rts" ]
then
  npx create-react-app react-app-ts --template typescript
  cd react-app-ts
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --client-id=$clientId
  CI=true npm test
elif [ $framework == "react" ] || [ $framework == "r" ]
then
  npx create-react-app react-app
  cd react-app
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --client-id=$clientId
  CI=true npm test
elif [ $framework == "react-ts-auth0" ] || [ $framework == "rts0" ]
then
  npx create-react-app react-auth0-ts --template typescript
  cd react-auth0-ts
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$auth0Issuer --client-id=$auth0ClientId --auth0
  CI=true npm test
elif [ $framework == "react-auth0" ] || [ $framework == "r0" ]
then
  npx create-react-app react-auth0
  cd react-auth0
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$auth0Issuer --client-id=$auth0ClientId --auth0
  CI=true npm test
elif [ $framework == "vue-ts" ] || [ $framework == "vts" ]
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
  vue create vue-app-ts -i "$config" --registry=http://registry.npm.taobao.org
  cd vue-app-ts
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --client-id=$clientId
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
  },
  "vueVersion": "3"
}
EOF
)
  vue create vue-app -i "$config" --registry=http://registry.npm.taobao.org
  cd vue-app
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --client-id=$clientId
  npm run test:unit
elif [ $framework == "vue-ts-auth0" ] || [ $framework == "vts0" ]
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
  vue create vue-auth0-ts -i "$config" --registry=http://registry.npm.taobao.org
  cd vue-auth0-ts
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$auth0Issuer --client-id=$auth0ClientId --auth0
  npm run test:unit
elif [ $framework == "vue-auth0" ] || [ $framework == "v0" ]
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
  vue create vue-auth0 -i "$config" --registry=http://registry.npm.taobao.org
  cd vue-auth0
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$auth0Issuer --client-id=$auth0ClientId --auth0
  npm run test:unit
elif [ $framework == "ionic" ] || [ $framework == "i" ]
then
  ionic start ionic-app tabs --type angular-standalone --no-interactive
  cd ionic-app
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --client-id=$clientId
  npm run build && ng test --watch=false
elif [ $framework == "ionic-auth0" ] || [ $framework == "i0" ]
then
  ionic start ionic-auth0 tabs --type angular-standalone --no-interactive
  cd ionic-auth0
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$auth0Issuer --client-id=$auth0ClientId --auth0
  npm run build && ng test --watch=false
elif [ $framework == "react-native" ] || [ $framework == "rn" ]
then
  npx -y react-native init SecureApp
  cd SecureApp
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --client-id=$clientId
  # pod install --project-directory=ios --repo-update
  npm test -- -u
elif [ $framework == "react-native-auth0" ] || [ $framework == "rn0" ]
then
  npx -y react-native init SecureAuth0
  cd SecureAuth0
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$auth0Issuer --client-id=$auth0ClientId --auth0
  # pod install --project-directory=ios --repo-update
  npm test -- -u
elif [ $framework == "express" ] || [ $framework == "e" ]
then
  mkdir express-app && cd express-app
  npx express-generator --view=pug
  npm i
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$issuer --client-id=$clientId --client-secret='may the auth be with you'
  # npm test -- -u
elif [ $framework == "express-auth0" ] || [ $framework == "e0" ]
then
  mkdir express-auth0 && cd express-auth0
  npx express-generator --view=pug
  npm i
  npm install -D ../../oktadev*.tgz
  schematics @oktadev/schematics:add-auth --issuer=$auth0Issuer --client-id=$auth0ClientId \
    --client-secret='may the auth be with you' --auth0
  # npm test -- -u
else
  echo "No '${framework}' framework found!"
fi
