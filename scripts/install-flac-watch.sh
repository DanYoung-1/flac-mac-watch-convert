#!/bin/zsh
set -euo pipefail

ROOT_DIR="${0:A:h}"
SCRIPT_PATH="$ROOT_DIR/../bin/flac-watch"
PLIST_SOURCE="$ROOT_DIR/../launchd/com.admin.flacwatch.plist"
PLIST_DEST="$HOME/Library/LaunchAgents/com.admin.flacwatch.plist"
LOG_DIR="$HOME/Library/Logs/flac-watch"
STDOUT_PATH="$LOG_DIR/launchd.out.log"
STDERR_PATH="$LOG_DIR/launchd.err.log"

if ! command -v ffmpeg >/dev/null 2>&1; then
  print -u2 "ffmpeg is not installed yet; MP3 copies will still work, but FLAC conversion will be skipped until ffmpeg is available."
fi

if ! command -v fswatch >/dev/null 2>&1; then
  print -u2 "fswatch is required. Install it first, for example: brew install fswatch"
  exit 1
fi

if [[ ! -x "$SCRIPT_PATH" ]]; then
  chmod +x "$SCRIPT_PATH"
fi

mkdir -p "$HOME/Library/LaunchAgents"
mkdir -p "$LOG_DIR"
WATCHER_PATH="$SCRIPT_PATH" STDOUT_PATH="$STDOUT_PATH" STDERR_PATH="$STDERR_PATH" perl -0pe 's|__WATCHER_PATH__|$ENV{WATCHER_PATH}|g; s|__STDOUT_PATH__|$ENV{STDOUT_PATH}|g; s|__STDERR_PATH__|$ENV{STDERR_PATH}|g' "$PLIST_SOURCE" > "$PLIST_DEST"

launchctl unload "$PLIST_DEST" 2>/dev/null || true
launchctl load "$PLIST_DEST"

print "Installed and started: com.admin.flacwatch"
print "Watch root: $HOME/Downloads/music-torrents"
print "Music import folder: /Volumes/Music Storage/Music/Media.localized/Automatically Add to Music.localized"
print "Logs:"
print "  script: $LOG_DIR/flac-watch.log"
print "  launchd stdout: $STDOUT_PATH"
print "  launchd stderr: $STDERR_PATH"
