import 'package:facebook_video_download/data/facebookPost.dart';
import 'package:facebook_video_download/facebook_video_download.dart';

Future<void> main() async {
  FacebookPost data = await FacebookData.postFromUrl(
      "https://www.facebook.com/watch/?v=135439238028475");
  print(data.postUrl);
  print(data.videoHdUrl);
  print(data.videoMp3Url);
  print(data.videoSdUrl);
  print(data.commentsCount);
  print(data.sharesCount);
}
