
- [General Notes](#general-notes)
  - [Render AppsCode website locally](#render-appscode-website-locally)

# General Notes

This file contains common notes for AppsCode products.

## Render AppsCode website locally

- Install Node ( v8.11.0)
- Install Hugo (0.48.0)
- Go inside website repo
  
  ```console
  cd /home/emruz/go/src/github.com/appscode-cloud/appscode_web
  ```

- Remove existing node_modules so that latest state is pullled.

    ```console
    rm -rf ./node_modules
    ```

- Install `gulp`

  ```console
  sudo npm i -g gulp
  ```

- Install dependencies
  
  ```console
  npm -i
  ```

- Replace content of latest branch with contents of desired branch
  - Remove contents of latest branch

    ```console
    rm -rf ./content/products/stash/0.8.3/*
    ```

  - Copy contents of desired branch to lastet branch

    ```console
    cp -r /home/emruz/go/src/github.com/appscode/stash/docs/* ./content/products/stash/0.8.3/
    ```

- Run `gulp`
  
- Visit website at `localhost:1313`

**Shortcut:**

```console
rm -rf ./content/products/stash/0.8.3/* && cp -r /home/emruz/go/src/github.com/appscode/stash/docs/* ./content/products/stash/0.8.3/ && gulp
```
