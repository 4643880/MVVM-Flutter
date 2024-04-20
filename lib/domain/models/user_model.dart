class User {
  int? status;
  String? message;
  Customer? customer;
  Contacts? contacts;

  User({
    this.status,
    this.message,
    this.customer,
    this.contacts,
  });
}

class Contacts {
  String? phone;
  String? weblink;
  String? email;

  Contacts({
    this.phone,
    this.weblink,
    this.email,
  });
}

class Customer {
  String? id;
  String? name;
  int? numberofnotifications;

  Customer({
    this.id,
    this.name,
    this.numberofnotifications,
  });
}
