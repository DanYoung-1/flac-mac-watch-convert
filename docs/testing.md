# Testing

This repo supports three useful test paths:

## 1. One-off scan

Use this to process whatever is already in the watched folder and exit:

```sh
flac-watch --once
```

If you want to test with temporary folders instead of your real music paths:

```sh
tmp_src=$(mktemp -d /private/tmp/flac-watch-src.XXXXXX)
tmp_dst=$(mktemp -d /private/tmp/flac-watch-dst.XXXXXX)
flac-watch --once "$tmp_src" "$tmp_dst"
```

## 2. Watch mode

Use this when you want the script to stay running and react to new files:

```sh
flac-watch --watch
```

You can also let the LaunchAgent manage this in the background after installation.

## 3. Health check

Use `doctor` to confirm the environment is ready:

```sh
flac-watch doctor
```

`doctor` checks:

- `ffmpeg` installed
- `fswatch` installed
- source folder exists
- destination folder exists
- Music Storage volume mounted
- log folder writable
- LaunchAgent installed/running

## What to watch for

- If `flac-watch` is not found, run the repo-local binary directly with `./bin/flac-watch ...` or add `~/bin` to your `PATH`.
- If `doctor` reports the destination volume is missing, check that `/Volumes/Music Storage` is mounted.
- If `doctor` reports the LaunchAgent is not running, rerun `./scripts/install-flac-watch.sh`.
