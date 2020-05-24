import 'package:cloud_firestore/cloud_firestore.dart';

class SearchServiceMeyve {
  searchByName(String searchField) {
    return Firestore.instance
        .collection('Yeni')
        .where('searchKey',
            isEqualTo: searchField.substring(0, 1).toUpperCase())
        .getDocuments();
  }
}
class SearchServiceSebze {
  searchByName(String searchField) {
    return Firestore.instance
        .collection('Sebze')
        .where('searchKey',
            isEqualTo: searchField.substring(0, 1).toUpperCase())
        .getDocuments();
  }
}
class SearchServiceVitamin {
  searchByName(String searchField) {
    return Firestore.instance
        .collection('Vitamin')
        .where('searchKey',
            isEqualTo: searchField.substring(0, 1).toUpperCase())
        .getDocuments();
  }
}

