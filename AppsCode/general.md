
- [General Notes](#general-notes)
  - [Render AppsCode website locally](#render-appscode-website-locally)
  - [Crop and Export SVG from Inkscape](#crop-and-export-svg-from-inkscape)
  - [Load docker image directly into minikube](#load-docker-image-directly-into-minikube)

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

## Crop and Export SVG from Inkscape

- Crop Image: [How to crop image in Inkscape](https://www.youtube.com/watch?v=ik3mCOdE4T8)
- Export Cropped Image:
  - Select the object(s) to export.
  - "Resize page to drawing or selection" with `Ctrl+Shift+R`.
  - "Invert selection" with `!`, and `Del` all other objects.
  - "Save As" with `Ctrl+Shift+S`.
  - Select Optimized SVG as the format if you want to use it on the web.

## Load docker image directly into minikube

```console
docker save appscodeci/stash:cluster-backup | (eval $(minikube docker-env) && docker load)
```