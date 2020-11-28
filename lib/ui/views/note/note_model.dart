import 'package:flutter/cupertino.dart';

class Note {
  final String id =
      UniqueKey().hashCode.toUnsigned(20).toRadixString(16).padLeft(5, '0');
  final String title;
  final String desc;
  bool isDeleted = false;

  Note(this.title, this.desc);

  static String get tableName => 'Note';

  static String get createTable =>
      'Create table $tableName(`id` TEXT PRIMARY KEY,'
      ' `title` TEXT,'
      ' `desc` TEXT,'
      ' `isDeleted` INTEGER DEFAULT 0)';
}
