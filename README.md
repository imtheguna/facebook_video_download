# facebook_video_download

A Flutter package to get facebook post details and download links.

## How to Use 

To use instagram_public_api, first start by importing the package.
```dart

import 'package:facebook_video_download/facebook_video_download.dart';

```

## Get Pots details

```dart

//Get Post Details (must be public)

    FacebookPost data = await FacebookData.postFromUrl(
      "https://www.facebook.com/watch/?v=135439238028475");
    print(data.postUrl);
    print(data.videoHdUrl);
    print(data.videoMp3Url);
    print(data.videoSdUrl);
    print(data.commentsCount);
    print(data.sharesCount);
}

```

## Project Created & Maintained By

### Gunanithi

Passionate #Flutter, #Android Developer. #UI Designer.

<a href="https://www.linkedin.com/in/imtheguna/"><img src="https://github.com/aritraroy/social-icons/blob/master/linkedin-icon.png?raw=true" width="60"></a>


## Currently Available Methods
- `FacebookPost FacebookData.postFromUrl()` returns post details
</br>


## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
