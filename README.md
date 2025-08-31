# `rules_runc`

**WIP**: Bazel rules for running containers with [`runc`](https://github.com/opencontainers/runc) container runtime.

```starlark
# BUILD.bazel
load("@rules_runc//runc:defs.bzl", "runc_binary")

runc_binary(
    name = "container",
    image = "@alpine",
)
```

```sh
bazel --quiet run //:container -- -c 'echo "Hello, world!" ; exit'
```
```
Target //:container up-to-date:
  .bazel/bin/container_template
  .bazel/bin/container
Using /tmp/tmp.LRlx5DvoYw for runc instance
Writing Docker/OCI image tarball to /tmp/tmp.LRlx5DvoYw/image.tar...
Writing configuration to /tmp/tmp.LRlx5DvoYw/ctr/config.json...
Creating rootfs...
Extracting docker compliant tarball...
Cleaning up Docker/OCI image tarball...
Running container...
Hello, world!
Container has exited, cleaning up...
```

## Why?

- No dependencies on Docker/Podman.
- Easy to use in devcontainers, only requiring `"privileged": true,`.

## TODO

- [ ] Wait for https://github.com/bazel-contrib/rules_oci/commit/1ff941af7c3d63f7f3610ddad5fe9020d764d5a4 to be released.
