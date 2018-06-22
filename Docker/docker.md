### `gosu` or `su-exec`
Dockerfiles are for creating images. I see `gosu` as more useful as part of a container initialization when you can no longer change users between run commands in your Dockerfile.

After the image is created, something like `gosu` allows you to drop root permissions at the end of your entrypoint inside of a container. You may initially need root access to do some initialization steps (fixing uid's, host mounted volume permissions, etc). Then once initialized, you run the final service without root privileges and as pid 1 to handle signals cleanly.

Ref: https://github.com/ncopa/su-exec