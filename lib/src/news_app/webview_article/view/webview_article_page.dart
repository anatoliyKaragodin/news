import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:news/src/news_app/main_page/controller/newsline_controller.dart';
import 'package:news/src/news_app/main_page/view/main_page.dart';
import 'package:news/src/utils/library.dart';
import 'package:news/src/utils/my_colors.dart';

class WebViewArticlePage extends ConsumerStatefulWidget {
  final String route = 'webview page';

  const WebViewArticlePage({super.key});

  @override
  ConsumerState<WebViewArticlePage> createState() => _WebViewArticlePageState();
}

class _WebViewArticlePageState extends ConsumerState<WebViewArticlePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final url = ref.watch(newsController).url;

    InAppWebViewController? webViewController;
    InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          allowFileAccessFromFileURLs: true,
          allowUniversalAccessFromFileURLs: true,
          useOnDownloadStart: true,
          useOnLoadResource: true,
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false,
        ),
        android: AndroidInAppWebViewOptions(
          allowContentAccess: true,
          allowFileAccess: true,
          thirdPartyCookiesEnabled: true,
        ));

    Uri uri = Uri.parse(url ?? '');

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                ref.read(newsController.notifier).resetUrl();
                Navigator.pushNamed(context, MainPage().route);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          centerTitle: true,
          backgroundColor: MyColors.mainColorDark,
          title: const Text('Aa'),
        ),
        body: url != null && url != ''
            ? InAppWebView(
                onWebViewCreated: (controller) async {
                  webViewController = controller;
                },
                initialOptions: options,
                initialUrlRequest: URLRequest(url: uri),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
