# meteor-dockerfile
A production Dockerfile for running Meteor apps.

This Dockerfile can be used to deploy your meteor apps in production. When your app is running, you can access a meteor shell by ssh'ing into the docker container, installing meteor, and running `meteor shell` in `/opt/shell`.

This docker image should be built after building the meteor bundle with `meteor npm install && meteor build --directory --architecture os.linux.x86_64 ../build` first. Your folder structure should be

```
Dockerfile
app/
  .meteor
  ...
build/
  bundle/
```
