class user_model {
  final String username;
  final String password;
  final String name;
  final String phone;

  user_model(this.username, this.password, {this.name = "", this.phone = ""});

  @override
  String toString() {
    return this.name + " " + this.phone;
  }
}
