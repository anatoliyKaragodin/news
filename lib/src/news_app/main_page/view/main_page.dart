import 'package:news/src/utils/dimensions_util.dart';
import 'package:news/src/utils/library.dart';
import 'package:news/src/utils/my_colors.dart';

import '../body_pages/articles/view/articles_page.dart';
import '../body_pages/important/view/important_page.dart';
import '../body_pages/newsline/view/newsline_page.dart';

class MainPage extends ConsumerStatefulWidget {
  final String route = 'main page';
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final List labels = ['лента', 'важное', 'статьи'];
  final List<Widget> bodyPages = [
    const NewslinePage(),
    const ImportantPage(),
    const ArticlesPage()
  ];
  int bodyPageIndex = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.height10 * 10,
            decoration: BoxDecoration(color: MyColors.mainColorDark),
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.height10 * 7),
              child: buildUpBar(),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              children: bodyPages,
              onPageChanged: (index) {
                setState(() {
                  bodyPageIndex = index;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Row buildUpBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(3, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              _controller.jumpToPage(index);
              // bodyPageIndex = index;
            });
          },
          child: SizedBox(
            height: Dimensions.height10 * 3,
            width: Dimensions.width10 * 11,
            child: Text(
              labels[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: MyColors.whiteColor,
                  fontSize: bodyPageIndex == index ? 20 : 18,
                  fontWeight: bodyPageIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ),
        );
      }),
    );
  }
}
