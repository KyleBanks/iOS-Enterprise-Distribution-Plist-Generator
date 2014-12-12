# iOS Enterprise Distribution P-List Generator

Since Xcode 6, enterprise distribution has no longer generated the required P-List for distributing your iOS application. This tool handles generating it for you, and can be easily used as part of your Continuous Integration process when automating builds.

## Options

All options can be provided directly when running the script. If the required arguments are not supplied, the script will prompt you to enter them.

- `title` The title of your application for display on the install prompt. (ex. My Awesome App)
- `bundle-version` The version of your application (ex. 1.0.0)
- `bundle-identifier` The application's bundle identifier (ex. com.kylewbanks.AwesomeApp) 
- `url` The URL where the IPA will be hosted (ex. https://kylewbanks.com/AwesomeApp.ipa)
- `output-file` Where to output the P-List. (ex. ~/dist/AwesomeApp.plist) [*Optional: By default, outputs to the console.*]

## Samples

Pass all arguments directly:

```bash
./generate.sh "My Awesome App" 1.0.0 com.kylewbanks.AwesomeApp https://kylewbanks.com/AwesomeApp.ipa ~/dist/AwesomeApp.plist
```

Allow the script to prompt:

```bash
./generate.sh 
title: My Awesome App
bundle-version: 1.0.0
bundle-identifier: com.kylewbanks.AwesomeApp
url: https://kylewbanks.com/AwesomeApp.ipa
```
