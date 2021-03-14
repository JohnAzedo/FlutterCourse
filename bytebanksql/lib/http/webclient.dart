import 'dart:convert';

import 'package:bytebanksql/models/contact.dart';
import 'package:bytebanksql/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    // print(data);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    // print(data);
    return data;
  }
}

Future<List<Transaction>> findAll() async {
  final Client client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()],
  );
  final String url = 'transactions/';
  final Response response = await client.get(
    Uri.http('192.168.1.9:8081', url),
  );

  final List<Transaction> transactions = [];

  for (Map<String, dynamic> element in jsonDecode(response.body)) {
    transactions.add(
      Transaction(
        element['value'],
        Contact(
          0,
          element['contact']['name'],
          element['contact']['accountNumber'].toString(),
        ),
      ),
    );
  }

  return transactions;
}
