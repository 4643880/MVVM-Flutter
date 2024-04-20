class User {
  int status;
  String message;
  Customer customer;
  Contacts contacts;

  User({
    required this.status,
    required this.message,
    required this.customer,
    required this.contacts,
  });
}

class Contacts {
  String phone;
  String weblink;
  String email;

  Contacts({
    required this.phone,
    required this.weblink,
    required this.email,
  });
}

class Customer {
  String id;
  String name;
  int numberofnotifications;

  Customer({
    required this.id,
    required this.name,
    required this.numberofnotifications,
  });
}
