# Elixir 1.18 escript with `consolidate_protocols: false` bug

## Step 1: generate working escript

When we don't set `consolidate_protocols: false`, we're able to generate a working escript. 

Generate and execute the escript:

```
$ mix escript.build
Generated orange app
Generated escript orange with MIX_ENV=dev
```
```
$ ./orange 
Orange you glad you ran this binary? Have a nice day 🍊
```

Note the size of the generated working binary: 1.3M

```
$ ls orange 
-rwxr-xr-x  1 angelika  staff   1.3M Dec 21 10:42 orange
```

## Step 2: set `consolidate_protocols: false`

In `mix.exs`, add `consolidate_protocols: false`:

```diff
diff --git a/mix.exs b/mix.exs
index ed076a0..5e181c9 100644
--- a/mix.exs
+++ b/mix.exs
@@ -8,6 +8,7 @@ defmodule Orange.MixProject do
       elixir: "~> 1.18",
       start_permanent: Mix.env() == :prod,
       deps: deps(),
+      consolidate_protocols: false,
       escript: [main_module: Orange]
     ]
   end
```

Then try generating the escript again:

```
$ mix escript.build
Generated orange app
Generated escript orange with MIX_ENV=dev
```
```
$ ./orange 
ERROR! Failed to start Elixir.
error: {error,{elixir,{"no such file or directory","elixir.app"}}}
```

The script doesn't run anymore. Note the size of the generated broken binary: 1.6k compared to 1.3M, significantly smaller than expected.

```
$ ls orange
-rwxr-xr-x  1 angelika  staff   1.6K Dec 21 10:45 orange
```
