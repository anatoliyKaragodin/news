import 'package:news/src/news_app/webview_article/view/webview_article_page.dart';
import 'package:news/src/utils/library.dart';
import 'package:news/src/news_app/main_page/view/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: const MainPage().route,
      routes: {
        const MainPage().route: (context) => const MainPage(),
        const WebViewArticlePage().route: (context) => const WebViewArticlePage(),
      },
    );
  }
}
