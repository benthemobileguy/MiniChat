class ConversationDetails {
  String id;
  String message;
  int modifiedAt;
  String sender;

  ConversationDetails({this.id, this.message, this.modifiedAt, this.sender});

  ConversationDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    modifiedAt = json['modified_at'];
    sender = json['sender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['message'] = message;
    data['modified_at'] = modifiedAt;
    data['sender'] = sender;
    return data;
  }
  static List<ConversationDetails> fromJsonList(List<dynamic> _list){
    return _list.map((data) => ConversationDetails.fromJson(data)).toList();
  }
}