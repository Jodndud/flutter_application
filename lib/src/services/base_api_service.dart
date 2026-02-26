import 'package:http/http.dart' as http;

abstract class BaseApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  // 모든 API에서 공통으로 사용할 헤더
  Map<String, String> get headers => {
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) ...",
    "Accept": "application/json",
  };

  // 공통 GET 요청 메서드 (웹의 axios 인스턴스 역할)
  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.get(url, headers: headers);
  }
}