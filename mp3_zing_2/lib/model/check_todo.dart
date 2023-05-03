class Check {
  String orderBy;
  String currentPage;
  String numberOfRecord;
  String secretKey;
  Check(
      {required this.orderBy,
      required this.currentPage,
      required this.numberOfRecord,
      required this.secretKey});

  // Check({this.orderBy, this.currentPage, this.numberOfRecord, this.secretKey});

  // Check.fromJson(Map<String, dynamic> json) {
  //   orderBy = json['orderBy'];
  //   currentPage = json['currentPage'];
  //   numberOfRecord = json['numberOfRecord'];
  //   secretKey = json['secretKey'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_by'] = this.orderBy;
    data['current_page'] = this.currentPage;
    data['number_of_record'] = this.numberOfRecord;
    data['secret_key'] = this.secretKey;
    return data;
  }
}
