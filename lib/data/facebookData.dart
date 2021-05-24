import 'package:facebook_video_download/data/facebookPost.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

/// [FacebookData] returns [FacebookProfile]
class FacebookData {
  //FacebookProfile _profileParsed = FacebookProfile();

  static Future<FacebookPost> postFromUrl(String profileUrl) async {
    String _temporaryData = '', _patternStart = '', _patternEnd = '';
    int _startInx = 0, _endInx = 1;
    Client _client = Client();
    Response _response;
    Map<String, String> _postData = Map<String, String>();
    var _document;

    try {
      _response = await _client.get(Uri.parse('$profileUrl'));
      _document = parse(_response.body);
      _document = _document.querySelectorAll('body');
      _temporaryData = _document[0].text;
      _temporaryData = _temporaryData.trim();

      _patternStart = 'permalinkURL:"';
      _patternEnd = '/"}],1],';
      _startInx = _temporaryData.indexOf(_patternStart) + _patternStart.length;
      _endInx = _temporaryData.indexOf(_patternEnd) + 1;
      _postData['postUrl'] =
          _temporaryData.substring(_startInx, _endInx) != "null"
              ? _temporaryData.substring(_startInx, _endInx)
              : _postData['postUrl']!;

      _patternStart = ',sd_src:';
      _patternEnd = '",hd_tag:';
      _startInx =
          _temporaryData.indexOf(_patternStart) + _patternStart.length + 1;
      _endInx = _temporaryData.indexOf(_patternEnd);
      _postData['videoSdUrl'] =
          _temporaryData.substring(_startInx, _endInx) != "null"
              ? _temporaryData.substring(_startInx, _endInx)
              : _postData['videoSdUrl']!;

      _patternStart = ',hd_src:"';
      _patternEnd = '",sd_src:';
      _startInx = _temporaryData.indexOf(_patternStart) + _patternStart.length;
      _endInx = _temporaryData.indexOf(_patternEnd);
      _postData['videoHdUrl'] =
          _temporaryData.substring(_startInx, _endInx) != 'null'
              ? _temporaryData.substring(_startInx, _endInx)
              : _postData['videoSdUrl']!;

      if (!_temporaryData.contains('audio:[]')) {
        _patternStart = 'audio:[{url:"';
        _patternEnd = '",start:0,end:';
        _startInx =
            _temporaryData.indexOf(_patternStart) + _patternStart.length;
        _endInx = _temporaryData.substring(_startInx).indexOf(_patternEnd) +
            _startInx;
        _postData['videoMp3Url'] = _temporaryData.substring(_startInx, _endInx);
      } else {
        _postData['videoMp3Url'] = '';
      }
      _patternStart = ',i18n_comment_count:"';
      _patternEnd = '",url:"';
      _startInx = _temporaryData.indexOf(_patternStart) + _patternStart.length;
      _endInx = _temporaryData.indexOf(_patternEnd);
      _postData['commentsCount'] =
          _temporaryData.substring(_startInx, _endInx) != 'null'
              ? _temporaryData.substring(_startInx, _endInx)
              : _postData['commentsCount']!;

      _patternStart = ',i18n_share_count:"';
      _patternEnd = '",share_count:';
      _startInx = _temporaryData.indexOf(_patternStart) + _patternStart.length;
      _endInx = _temporaryData.indexOf(_patternEnd);
      _postData['sharesCount'] =
          _temporaryData.substring(_startInx, _endInx) != 'null'
              ? _temporaryData.substring(_startInx, _endInx)
              : _postData['sharesCount']!;

      //_profileParsed.postData = FacebookPost.fromMap(_postData);
    } catch (error) {
      print('[InstaData][storyFromUrl]: $error');
    }

    return FacebookPost.fromMap(_postData);
  }
}
