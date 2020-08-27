class ContactModel {
  //id
  String id;

  //名字
  String name;

  //电话列表
  List<String> phoneNumbers;

  //图片地址
  String avatar;

  //语音地址
  String voice;

  ContactModel(this.id, this.name, this.phoneNumbers,
      [this.avatar, this.voice]);

  ContactModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumbers = json['phoneNumbers'].cast<String>();
    avatar = json['avatar'];
    voice = json['voice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phoneNumbers'] = this.phoneNumbers;
    data['avatar'] = this.avatar;
    data['voice'] = this.voice;
    return data;
  }
}
