
class ListElement {
  String? name;
  int? rate;
  String? id;

  ListElement({
    this.name,
    this.rate,
    this.id,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        name: json["_name"],
        rate: json["_rate"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_name": name,
        "_rate": rate,
        "_id": id,
      };
}
