// Using this to covert the a model into non nullable model

import 'package:mvvm_flutter_app/data/models/user_data_model.dart';
import 'package:mvvm_flutter_app/domain/models/user_model.dart'
    as dm; // domain models

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on UserDataModel? {
  dm.User toDomain() {
    return dm.User(
      status: this?.status ?? ZERO,
      message: this?.message ?? EMPTY,
      customer: (this?.customer as dm.Customer?) ??
          dm.Customer(
            id: '',
            name: '',
            numberofnotifications: 0,
          ),
      contacts: (this?.contacts as dm.Contacts?) ??
          dm.Contacts(
            phone: '',
            weblink: '',
            email: '',
          ),
    );
  }
}
