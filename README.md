# Elixir 1.18 escript with `consolidate_protocols: false` bug

## Step 1: generate working escript

When we don't set `consolidate_protocols: false`, we're able to generate a working escript. 

Run

```
$ mix escript.build
Generated orange app
Generated escript orange with MIX_ENV=dev
```
```
$ ./orange 
Orange you glad you ran this binary? Have a nice day 🍊
```
```
$ ls orange 
-rwxr-xr-x  1 angelika  staff   1.3M Dec 21 10:42 orange
```

Note the size of the generated working binary: 1.3M

## Step 2: set `consolidate_protocols: false`

In `mix.exs`, add `consolidate_protocols: false`:

```diff
```
