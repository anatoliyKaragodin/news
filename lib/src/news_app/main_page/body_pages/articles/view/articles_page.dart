import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:news/src/utils/library.dart';

import '../../../../../utils/dimensions_util.dart';
import '../../../../../utils/my_colors.dart';
import '../../../../repo/article.dart';
import '../../../controller/newsline_controller.dart';

class ArticlesPage extends ConsumerStatefulWidget {
  const ArticlesPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends ConsumerState<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    final articles = ref.watch(newsController).articles;

    return SizedBox(
      height: Dimensions.height10 * 69.6,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            var date = articles!.last.date;
            NewsController().onRefresh(ref, date);
            if (kDebugMode) {
              print('REFRESH');
            }
          }
          return true;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            var date = '0';
            NewsController().onRefresh(ref, date);
            if (kDebugMode) {
              print('REFRESH');
            }
          },
          child: ListView.builder(
              itemCount: articles?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                String inputString = articles?[index].date ?? '';
                String outputFormat = 'dd/MM, HH:mm';
                int year = 2000 + int.parse(inputString.substring(4, 6));
                int month = int.parse(inputString.substring(2, 4));
                int day = int.parse(inputString.substring(0, 2));
                int hour = int.parse(inputString.substring(6, 8));
                int minute = int.parse(inputString.substring(8, 10));
                int second = int.parse(inputString.substring(10, 12));
                DateTime dateTime =
                    DateTime(year, month, day, hour, minute, second);

                String outputString = DateFormat(outputFormat).format(dateTime);
                String title = articles?[index].title ?? '';
                return Padding(
                  padding: EdgeInsets.all(Dimensions.height10),
                  child: InkWell(
                    onTap: () {
                      var id = articles?[index].id;
                      if (id != null) {
                        NewsController().onNewslineTap(ref, context, id);
                      }
                    },
                    child: Container(
                      height: Dimensions.height10 * 10,
                      child: Row(
                        children: [
                          Container(
                            width: Dimensions.width10 * 20,
                            child: Column(
                              children: [
                                buildDate(outputString),
                                buildTitle(title, articles, index),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width10 / 2),
                            child: buildImage(articles, index),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  SizedBox buildImage(List<Article>? newsline, int index) {
    return SizedBox(
        width: Dimensions.width10 * 13,
        child: newsline![index].img.isNotEmpty
            ? Image.network(
                newsline[index].img,
                fit: BoxFit.fill,
              )
            : Container());
  }

  Padding buildTitle(String title, List<Article>? newsline, int index) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.height10 / 2),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: newsline![index].important == 1
                ? FontWeight.bold
                : FontWeight.normal),
      ),
    );
  }

  Text buildDate(String outputString) {
    return Text(
      outputString,
      style: TextStyle(
        color: MyColors.redColor,
      ),
      textAlign: TextAlign.start,
    );
  }
}
