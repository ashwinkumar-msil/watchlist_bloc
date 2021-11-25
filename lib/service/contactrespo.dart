import 'package:navigation_watchlist/model/contact_data_model.dart';
import 'package:http/http.dart' as http;

abstract class ContactRepo {
  Future<List<Contact>> fetchContact();
}

class ContactService implements ContactRepo {
  static const url =
      'https://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts';

  List<Contact> contactdata = [];

  Future<List<Contact>> fetchContact() async {
    final response = await http.get(Uri.parse(
        'https://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts'));
    try {
      contactdata = contactFromJson(response.body);
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
    return contactdata;
  }
}
