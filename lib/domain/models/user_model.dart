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

  @override
  String toString() {
    return 'User{status: $status, message: $message, customer: $customer, contacts: $contacts}';
  }
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

  @override
  String toString() {
    return 'Contacts{phone: $phone, weblink: $weblink, email: $email}';
  }
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

  @override
  String toString() {
    return 'Customer{id: $id, name: $name, numberofnotifications: $numberofnotifications}';
  }
}
