class UserModel {
  final String fullname;
  final String slackUsername;
  final String githubHandle;
  final String personalBio;

  UserModel({
    required this.fullname,
    required this.slackUsername,
    required this.githubHandle,
    required this.personalBio,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : fullname = json['fullname'],
        slackUsername = json['slackUsername'],
        githubHandle = json['githubHandle'],
        personalBio = json['personalBio'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['fullname'] = fullname;
    data['slackUsername'] = slackUsername;
    data['githubHandle'] = githubHandle;
    data['personalBio'] = personalBio;

    return data;
  }
}
