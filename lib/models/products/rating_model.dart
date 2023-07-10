class Rating {
  final num rate;
  final num count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
        rate: json["rate"] as num? ?? 0,
        count: json["count"] as num? ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {
      "rate": rate,
      "count": count,
    };
  }
}
