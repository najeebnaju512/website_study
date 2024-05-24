import 'package:nexteons_study_project/model/sample_datas/list.dart';

class DpiRateList {
  List<ListElement>? list;
  int? totalCount;

  DpiRateList({
    this.list,
    this.totalCount,
  });

  factory DpiRateList.fromJson(Map<String, dynamic> json) => DpiRateList(
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
        "totalCount": totalCount,
      };
}