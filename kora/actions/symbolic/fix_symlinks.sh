#!/bin/bash
for link in *symbolic.svg; do
  [ -L "$link" ] || continue
  old=$(readlink "$link")
  new=$(basename "$old")
  rm "$link"
  ln -sf "$new" "$link"
  echo "Fixed $link: $old → $new"
done
