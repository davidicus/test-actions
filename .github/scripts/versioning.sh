#!/bin/bash
dir=$(git rev-parse --show-toplevel)
# Get the version from package.json
version=$(grep -o '"version": "[^"]*' $dir/package.json | cut -d'"' -f4)

# Read the current version from version.txt
current_version=$(cat $dir/version.txt)

# Compare the current version with the new version
if [ "$version" != "$current_version" ]; then
  # Write the new version to version.txt
  echo "Updating version from $current_version to $version"
  echo "$version" > $dir/version.txt
else
  echo "The current version ($current_version) and new version ($version) are the same, no update needed"
fi