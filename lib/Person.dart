class Person {
  late String _name;
  late String _email;
  late String _gender;
  late DateTime _birthDate;

  Person(this._name, this._email, this._gender, this._birthDate);

  String get name => _name;
  String get email => _email;
  String get gender => _gender;
  DateTime get birthDate => _birthDate;

  set name(String name) {
    if (name.isEmpty) {
      throw ArgumentError("Name cannot be empty");
    }
    _name = name;
  }

  set email(String email) {
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(email)) {
      throw ArgumentError("Invalid email format");
    }
    _email = email;
  }

  set gender(String gender) {
    if (gender != 'male' && gender != 'female' && gender != 'other') {
      throw ArgumentError("Gender must be 'male', 'female', or 'other'");
    }
    _gender = gender;
  }

  set birthDate(DateTime birthDate) {
    if (birthDate.isAfter(DateTime.now())) {
      throw ArgumentError("Birthdate cannot be in the future");
    }
    _birthDate = birthDate;
  }
}