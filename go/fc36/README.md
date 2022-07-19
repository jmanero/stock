Golang on Fedora 36
===================

Run compiled Golang binaries with minimal Fedora 36 libraries

## Testing

The included `test.go` and `test.Containerfile` can be used to validate basic functionality:

```
$ podman build --tag ghcr.io/jmanero/stock-util:go-fc36 --target util .
$ podman build --file test.Containerfile --tag gotest .
$ podman run -it --rm --entrypoint sh gotest ldd test
	linux-vdso.so.1 (0x00007fff0bd8b000)
	libpthread.so.0 => /usr/lib64/libpthread.so.0 (0x00007f6abfb1f000)
	libc.so.6 => /usr/lib64/libc.so.6 (0x00007f6abf91d000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f6abfb26000)
podman run -it --rm gotest
Hello World [165 145 166 212 11 244 32 64 74 1 23 51 207 183 177 144 214 44 101 191 11 205 163 43 87 178 119 217 173 159 20 110]
```
