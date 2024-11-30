import 'dart:developer';
import 'package:http/http.dart' as http;
// import 'dart:convert';

Future<void> checkApi() async {
  try {
    final url = Uri.parse('http://157.15.202.189:7002/patient/patient_info?patientId=73');
    
    // If URL contains special characters or spaces, encode it
    final encodedUrl = Uri.encodeFull(url.toString());
    
    final response = await http.get(Uri.parse(encodedUrl));

    if (response.statusCode == 200) {
      log('API is working: ${response.body}');
    } else {
      log('API error: ${response.statusCode}');
    }
  } catch (e) {
    log('Failed to connect to the API: $e');
  }
}
