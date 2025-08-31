

visibility(["//runc/..."])

def _jq_binary_impl(ctx):
    # type: (ctx) -> None
    toolchain_info = ctx.toolchains["@aspect_bazel_lib//lib:jq_toolchain_type"]
    jq_bin = toolchain_info.jqinfo.bin
    
    # Symlink for consistent rlocation path
    ctx.actions.symlink(
        target_file = jq_bin,
        output = ctx.outputs.executable,
        is_executable = True,
    )
    runfiles = ctx.runfiles(files = [jq_bin])

    return [
        DefaultInfo(
            executable = ctx.outputs.executable,
            runfiles = runfiles,
        )
    ]

jq_binary = rule(
    implementation = _jq_binary_impl,
    toolchains = ["@aspect_bazel_lib//lib:jq_toolchain_type"],
    executable = True,
)

