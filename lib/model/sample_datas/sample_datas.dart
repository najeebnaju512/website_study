import 'data.dart';

class SampleDatas {
  Data? data;

  SampleDatas({this.data});

  factory SampleDatas.fromJson(Map<String, dynamic> json) => SampleDatas(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };
}
