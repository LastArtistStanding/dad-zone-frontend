#!/bin/bash

##
## Copy files from their sources to their correct location the HTTP server will serve them from.
##

# Create the destination directories.
mkdir -p serve serve/styles serve/scripts serve/debug/sourcemaps serve/debug/source

# Include the HTML, CSS, and generated JavaScript
rsync -r --delete --include="**/*.html" public/* serve/
rsync -r --delete-excluded --include="**/*.css" --exclude="*.*" public/styles/ serve/styles/
rsync -r --delete-excluded --include="**/*.js" --exclude="*.*" dist/ serve/scripts/

# Include the TypeScript source maps and source code for debugging purposes
rsync -r --delete-excluded --exclude="*.d.ts.map" --include="*.map" --exclude="*.*" dist/ serve/debug/sourcemaps/
rsync -r --delete-excluded --include="*.ts" --exclude="*.*" src/ serve/debug/source/
