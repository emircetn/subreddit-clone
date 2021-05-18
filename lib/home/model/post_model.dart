import 'dart:convert';

class PostModel {
  String? title;
  String? thumbnailUrl;
  String? selftext;
  String? authorFullname;
  int? ups;
  int? created;
  PostModel({
    this.title,
    this.thumbnailUrl,
    this.selftext,
    this.authorFullname,
    this.ups,
    this.created,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'thumbnailUrl': thumbnailUrl,
      'selftext': selftext,
      'authorFullname': authorFullname,
      'ups': ups,
      'created': created,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      title: map['title'],
      thumbnailUrl: map['thumbnail'],
      selftext: map['selftext'],
      authorFullname: map['author_fullname'],
      ups: map['ups'],
      created: map['created'] != null ? map['created_utc'].toInt() : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source));

  String get showDate {
    if (created == null) {
      return '?';
    }
    var date = DateTime.fromMicrosecondsSinceEpoch((created! * 1000000), isUtc: true);
    var dateDifference = DateTime.now().toUtc().difference(date);
    var time = '?';
    if (dateDifference.inSeconds > 0 && dateDifference.inSeconds <= 60) {
      time = 'seconds ago';
    } else if (dateDifference.inMinutes > 0 && dateDifference.inMinutes <= 60) {
      time = dateDifference.inMinutes.toString() + ' minute ago';
    } else if (dateDifference.inHours > 0 && dateDifference.inHours <= 24) {
      time = dateDifference.inHours.toString() + ' hour ago';
    } else if (dateDifference.inDays > 0 && dateDifference.inDays <= 7) {
      time = dateDifference.inDays.toString() + ' day ago';
    } else {
      time = (dateDifference.inDays / 7).floor().toString() + ' week ago';
    }
    return time;
  }
}
