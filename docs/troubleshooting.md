# Troubleshooting

## Quick checks

Run:

```sh
flac-watch doctor
```

That command checks:

- `ffmpeg` is installed
- `fswatch` is installed
- the source folder exists
- the destination folder exists
- the Music Storage volume is mounted
- the log folder is writable
- the LaunchAgent is installed and loaded

## Common issues

### `fswatch` is missing

Install it with Homebrew:

```sh
brew install fswatch
```

### `ffmpeg` is missing

Install it with Homebrew:

```sh
brew install ffmpeg
```

### Files are not being processed

Confirm the watched folder exists and contains supported files:

- `.flac`
- `.mp3`

Then try a one-time scan:

```sh
flac-watch --once
```

### The destination folder is unavailable

Make sure the Music Storage volume is mounted before starting the watcher. If the volume name or path changes, update the default destination in the script or launch it with explicit paths:

```sh
flac-watch --once "/path/to/source" "/path/to/destination"
```

### LaunchAgent does not stay loaded

Check the launchd logs in:

```sh
$HOME/Library/Logs/flac-watch/
```

If needed, reinstall the LaunchAgent with the installer script in `scripts/`.
