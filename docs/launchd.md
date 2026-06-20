# Launchd

This repo installs a LaunchAgent named `com.admin.flacwatch`.

## What it does

The LaunchAgent runs the watcher under `zsh` and keeps it alive so new files are processed automatically.

## Relevant files

- [launchd/com.admin.flacwatch.plist](/Users/admin/Code/flac-watch/launchd/com.admin.flacwatch.plist)
- [scripts/install-flac-watch.sh](/Users/admin/Code/flac-watch/scripts/install-flac-watch.sh)
- [bin/flac-watch](/Users/admin/Code/flac-watch/bin/flac-watch)

## Install flow

The installer:

1. Verifies the required tools are present
2. Ensures the repo script is executable
3. Writes the LaunchAgent plist into `~/Library/LaunchAgents/`
4. Loads the LaunchAgent with `launchctl`

## Useful commands

```sh
flac-watch --once
flac-watch --watch
flac-watch --help
flac-watch --version
flac-watch doctor
```

## Notes

- `--once` processes existing files and exits.
- `--watch` keeps the watcher running.
- `doctor` is the quickest way to confirm the install is healthy.
