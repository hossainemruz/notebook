- [Programs](#programs)
    - [Executables](#executables)
        - [Check an executable file static build dynamic build](#check-an-executable-file-static-build-dynamic-build)

# Programs

In this file I will note about program and executable files.

## Executables

### Check an executable file static build dynamic build

Use this command to check if a file is statistically linked or dynamically linked.

```console
$ ldd ./yq
	not a dynamic executable

```

or

```console
$ file yq
yq: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, with debug_info, not stripped
```