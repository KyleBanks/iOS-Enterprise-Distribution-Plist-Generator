#!/bin/bash
# The MIT License (MIT)
# 
# Copyright (c) 2014 Kyle Banks
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# 
# 
# 
# generate-plist.sh
# iOS Enterprise Distribution P-List Generator
#
# If any of the required arguments are not passed, a prompt will be provided to enter them.
# 
# Arguments:
# 1: title (ex. My Awesome App)
# 2: bundle-version (ex. 1.0.0)
# 3: bundle-identifier (ex. com.kylewbanks.AwesomeApp) 
# 4: url (ex. https://kylewbanks.com/AwesomeApp.ipa)
# 5: output-file (ex. ~/MyApp.plist) [Optional: By default, outputs to the console.]
# 
# Example:
# ./generate-plist.sh "My Awesome App" 1.0.0 com.kylewbanks.AwesomeApp https://kylewbanks.com/AwesomeApp.ipa ~/MyApp.plist

# Capture command line args, or prompt for input if not set
TITLE=$1
if [ -z "${TITLE}" ]
then
    read -p "title: " TITLE
fi

BUNDLE_VERSION=$2
if [ -z "${BUNDLE_VERSION}" ]
then
    read -p "bundle-version: " BUNDLE_VERSION
fi

BUNDLE_IDENTIFIER=$3
if [ -z "${BUNDLE_IDENTIFIER}" ]
then
    read -p "bundle-identifier: " BUNDLE_IDENTIFIER
fi

URL=$4
if [ -z "${URL}" ]
then
    read -p "url: " URL
fi

IMG=$5
if [ -z "${IMG}" ]
then
    read -p "url: " IMG
fi


# Generate the P-List
read -r -d '' PLIST << EndOfPlist
<?xml version=1.0 encoding=UTF-8?>
<!DOCTYPE plist PUBLIC -//Apple//DTD PLIST 1.0//EN http://www.apple.com/DTDs/PropertyList-1.0.dtd …>
<plist version=1.0>
<dict>
	<key>items</key>
	<array>
		<dict>
			<key>assets</key>
			<array>
				<dict>
					<key>kind</key>
					<string>software-package</string>
					<key>url</key>
					<string>$URL</string>
				</dict>
				<dict>
					<key>kind</key>
					<string>display-image</string>
					<key>url</key>
					<string>$IMG</string>
				</dict>
				<dict>
					<key>kind</key>
					<string>full-size-image</string>
					<key>url</key>
					<string>$IMG</string>
				</dict>
			</array>
			<key>metadata</key>
			<dict>
				<key>bundle-identifier</key>
				<string>$BUNDLE_IDENTIFIER</string>
				<key>bundle-version</key>
				<string>$BUNDLE_VERSION</string>
				<key>kind</key>
				<string>software</string>
				<key>title</key>
				<string>$TITLE</string>
			</dict>
		</dict>
	</array>
</dict>
</plist>
EndOfPlist

# Determine what to do with the P-List (Output to console or write to file)
OUTPUT=$6
if [ -z "${OUTPUT}" ]
then
	echo "$PLIST"
else
	echo "$PLIST" >> $OUTPUT
fi
