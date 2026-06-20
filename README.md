# flac-watch

`flac-watch` watches a music download folder, converts FLAC files to ALAC/M4A, and copies MP3s into Apple Music's auto-add folder.

## Install

From the repository root:

```sh
cd /Users/admin/Code/flac-watch
./scripts/install-flac-watch.sh
```

That installs the LaunchAgent into `~/Library/LaunchAgents/` and starts it.

If you want `flac-watch` available from any shell, add `~/bin` to your `PATH`:

```sh
export PATH="$HOME/bin:$PATH"
```

## Verify

Run the health check:

```sh
flac-watch doctor
```

If `flac-watch` is not yet on your `PATH`, use:

```sh
./bin/flac-watch doctor
```

## Test

Run a one-off scan:

```sh
flac-watch --once
```

Run the watcher manually:

```sh
flac-watch --watch
```

## Docs

- [Install](/Users/admin/Code/flac-watch/docs/install.md)
- [Testing](/Users/admin/Code/flac-watch/docs/testing.md)
- [Launchd](/Users/admin/Code/flac-watch/docs/launchd.md)
- [Troubleshooting](/Users/admin/Code/flac-watch/docs/troubleshooting.md)
