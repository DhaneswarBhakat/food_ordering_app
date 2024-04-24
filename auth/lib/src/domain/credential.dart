// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class Credential {
  final AuthType type;
  final String name;
  final String email;
  final String password;

  Credential({
    required this.type,
    required this.name,
    required this.email,
    required this.password,
  });
}

enum AuthType{ email, google }