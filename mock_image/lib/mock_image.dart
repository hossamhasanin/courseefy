import 'dart:async';
import 'dart:io';

import 'package:mocktail/mocktail.dart';

R provideMockedNetworkImages<R>(R Function() body) {
  return HttpOverrides.runZoned(
    body,
    createHttpClient: (_) => _createMockImageHttpClient(_),
  );
}

// Returns a mock HTTP client that responds with an image to all requests.
FakeHttpClient _createMockImageHttpClient(SecurityContext? _) {
  final FakeHttpClient client = FakeHttpClient();
  return client;
}

class FakeHttpClient extends Fake implements HttpClient {
  FakeHttpClient([this.context]);

  SecurityContext? context;

  @override
  bool autoUncompress = false;

  final FakeHttpClientRequest request = FakeHttpClientRequest();

  @override
  Future<HttpClientRequest> getUrl(Uri url) async {
    return request;
  }
}

class FakeHttpClientRequest extends Fake implements HttpClientRequest {
  final FakeHttpClientResponse response = FakeHttpClientResponse();

  @override
  Future<HttpClientResponse> close() async {
    return response;
  }
}

class FakeHttpClientResponse extends Fake implements HttpClientResponse {
  @override
  int get statusCode => 200;

  @override
  int get contentLength => _transparentImage.length;

  @override
  final FakeHttpHeaders headers = FakeHttpHeaders();

  @override
  HttpClientResponseCompressionState get compressionState => HttpClientResponseCompressionState.notCompressed;

  @override
  StreamSubscription<List<int>> listen(void Function(List<int>)? onData, {
    void Function()? onDone,
    Function? onError,
    bool? cancelOnError,
  }) {
    return Stream<List<int>>.fromIterable(<List<int>>[_transparentImage])
        .listen(onData, onDone: onDone, onError: onError, cancelOnError: cancelOnError);
  }
}

class FakeHttpHeaders extends Fake implements HttpHeaders { }

const List<int> _transparentImage = const <int>[
  0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D, 0x49,
  0x48, 0x44, 0x52, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x08, 0x06,
  0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4, 0x89, 0x00, 0x00, 0x00, 0x0A, 0x49, 0x44,
  0x41, 0x54, 0x78, 0x9C, 0x63, 0x00, 0x01, 0x00, 0x00, 0x05, 0x00, 0x01, 0x0D,
  0x0A, 0x2D, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x49, 0x45, 0x4E, 0x44, 0xAE,
];