class Post {
  final int statusCode;
  final String responseMessage;
  final String data;

  Post({this.statusCode, this.responseMessage, this.data});

  // factory 생성자. Post 타입의 인스턴스를 반환
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        statusCode: json['statusCode'],
        responseMessage: json['responseMessage'],
        data: json['data']);
  }
}