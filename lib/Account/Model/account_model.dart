import 'package:cloud_firestore/cloud_firestore.dart';

class AccountModel {
  String? _userID;
  String? _name;
  String? _address;
  String? _contact;

  AccountModel();

  AccountModel.getDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    _userID = documentSnapshot.id;
    _name = documentSnapshot.get('name');
    _address = documentSnapshot.get('address');
    _contact = documentSnapshot.get('contact');
  }

  String get id => _userID ?? '';
  String get name => _name ?? '';
  String get address => _address ?? '';
  String get contact => _contact ?? '';

  set id(String id) => _userID = id;
  set name(String name) => _name = name;
  set address(String address) => _address = address;
  set contact(String contact) => _contact = contact;
}
