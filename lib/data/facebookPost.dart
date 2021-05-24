/// FacebookPost returns [postUrl] [videoSdUrl] [videoHdUrl] [videoMp3Url] [commentsCount] [sharesCount]
class FacebookPost {
  String? postUrl = '';
  String? videoSdUrl = '';
  String? videoHdUrl = '';
  String? videoMp3Url = '';
  int? commentsCount = 0;
  int? sharesCount = 0;

  FacebookPost({
    this.postUrl,
    this.videoSdUrl,
    this.videoHdUrl,
    this.videoMp3Url,
    this.commentsCount,
    this.sharesCount,
  });

  factory FacebookPost.fromMap(Map<String, String> map) {
    return FacebookPost(
      postUrl: map['postUrl'] == null ? '' : map['postUrl'],
      videoSdUrl: map['videoSdUrl'],
      videoHdUrl: map['videoHdUrl'],
      videoMp3Url: map['videoMp3Url'],
      commentsCount: int.parse(map['commentsCount']!),
      sharesCount: int.parse(map['sharesCount']!),
    );
  }
}
