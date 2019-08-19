
- [General Notes](#general-notes)
  - [Render AppsCode website locally](#render-appscode-website-locally)
  - [Crop and Export SVG from Inkscape](#crop-and-export-svg-from-inkscape)
  - [Load docker image directly into minikube](#load-docker-image-directly-into-minikube)
  - [Update repo dependency using go mod](#update-repo-dependency-using-go-mod)
  - [Set proxy in linux terminal](#set-proxy-in-linux-terminal)
  - [Set DNS server in linux](#set-dns-server-in-linux)

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

## Update repo dependency using go mod

When you update any go module repo, use this syntax

```console
go get -u=patch githubc.com/xyz/project@version
go mod tidy
go mod vendor
```

`-u=patch` is necessary to make sure only the necessary stuff is changed or updated.

## Set proxy in linux terminal

Export the following environment variables:

```console
export http_proxy='http://<proxyServer address>:<proxy port>'
export https_proxy='https://<proxyServer address>:<proxy port>'
```

List of open proxy server:

- [Proxynova](https://www.proxynova.com/proxy-server-list/)
- [Free Proxy List](https://free-proxy-list.net/)

Disable proxy:

```console
unset http_proxy
unset https_proxy
```

## Set DNS server in linux

1. Install the `resolvconf` package.

    ```console
    sudo apt install resolvconf
    ```

2. Edit `/etc/resolvconf/resolv.conf.d/head` and add the following:

    ```txt
    # Make edits to /etc/resolvconf/resolv.conf.d/head.
    nameserver 8.8.4.4
    nameserver 8.8.8.8
    ```

3. Restart the `resolvconf` service.

    ```console
    sudo service resolvconf restart
    ```

Ref: https://datawookie.netlify.com/blog/2018/10/dns-on-ubuntu-18.04/
