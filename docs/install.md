# Install

This repo ships as a local script bundle, so you can run it directly from the checkout or install it into `~/bin` with the included launcher.

## Prerequisites

- `ffmpeg`
- `fswatch`
- macOS LaunchAgents

## Install from the repo

From the repository root:

```sh
cd /Users/admin/Code/flac-watch
./scripts/install-flac-watch.sh
```

That will:

- make sure the watcher script is executable
- write `com.admin.flacwatch` into `~/Library/LaunchAgents/`
- start the LaunchAgent immediately

You can also pass explicit source and destination folders:

```sh
./scripts/install-flac-watch.sh "$HOME/Downloads/music-torrents" "/Volumes/Music Storage/Music/Media.localized/Automatically Add to Music.localized"
```

Those paths are written into the LaunchAgent so the watcher starts with the exact folders you chose.

## Optional: make `flac-watch` available in your shell

The repo also creates a launcher at `~/bin/flac-watch`. If `~/bin` is not already on your `PATH`, add it to `~/.zshrc`:

```sh
export PATH="$HOME/bin:$PATH"
```

Then reload your shell:

```sh
source ~/.zshrc
```

After that, this should work from any directory:

```sh
flac-watch doctor
```

## Verify the install

Run:

```sh
flac-watch doctor
```

or, if `~/bin` is not on your `PATH` yet:

```sh
./bin/flac-watch doctor
```
