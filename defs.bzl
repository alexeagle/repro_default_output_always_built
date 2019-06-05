def a_impl(ctx):
    good = ctx.actions.declare_file("good")
    broken = ctx.actions.declare_file("broken")
    
    ctx.actions.run_shell(
        command = "echo yes > " + good.path,
        inputs = [],
        outputs = [good],
    )

    ctx.actions.run_shell(
        command = "false",
        inputs = [],
        outputs = [broken],
    )
    
    
    return [
        DefaultInfo(files = depset([broken]), runfiles = ctx.runfiles([broken])),
        OutputGroupInfo(
            group1 = depset([good])
        )
    ]

a = rule(
    implementation = a_impl,
    attrs = {},
    outputs = {}
)
