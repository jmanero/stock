Stock
=====

> Stock, sometimes called bone broth, is a savory cooking liquid that forms the basis of many dishes, particularly soups, stews and sauces. Making stock involves simmering animal bones, meat, seafood, or vegetables in water or wine, often for an extended period. Mirepoix or other aromatics may be added for more flavor. - https://en.wikipedia.org/wiki/Stock_(food)

Stock provides super-minimal images from scratch with useful artifacts lifted from public operating system images. Use [multi-stage Containerfiles](https://docs.docker.com/develop/develop-images/multistage-build/) to perform any build/preparation tasks (e.g using `RUN`), then `COPY --from=elsewhere` the resulting artifacts into output images `FROM stock:$variant`

## Images

- **stock** images generally contain only `ld-linux-x86-64.so` and a minimal set of shared libraries from the "donner" OS image required for the target language or build environment. Like scratch images, `RUN` commands generally **WILL NOT** work in Containerfile stages created `FROM` stock images!

- **stock-util** images include `sh`, `ldd`, and `ldconfig`. This may be useful for adding libraries to fulfil additional dependencies. See `Containerfile`s in variant subdirectories to get an idea of how to do this. `RUN` commands will work on `stock-util` images, but there likely won't be very much to execute, because utilities like `mkdir` and `ln` **ARE NOT** present in these images.

## Variants

- [golang/fedora-36](go/fc36)
