
class Repos{
  String name;
  String owner;
  String avatar;

  Repos();

  Repos.fromJSON(Map<String, dynamic> jsonMap) {
    name = jsonMap['name'].toString();
    owner = jsonMap['owner']['login'].toString();
    avatar = jsonMap['owner']['avatar_url'].toString();
  }
}
