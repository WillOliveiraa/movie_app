import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import 'package:will_design_system/src/extension/extension.dart';

import '../../spacings/sizes.dart';
import '../error/error.dart';
import '../progress/progress.dart';

class CardMovies extends StatelessWidget {
  final String image;
  final String vote;
  final String title;
  final String releaseDate;
  final List<Widget> genre;
  final String overview;
  final VoidCallback onTap;

  const CardMovies({
    Key? key,
    required this.image,
    required this.vote,
    required this.title,
    required this.releaseDate,
    required this.genre,
    required this.overview,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.all(Sizes.dp5(context)),
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // image
              SizedBox(
                width: Sizes.width(context) / 3,
                height: Sizes.width(context) / 2,
                child: CachedNetworkImage(
                  imageUrl: image.imageOriginal,
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (context, url, error) => const ErrorImage(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Sizes.dp10(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // circle vote average
                          CircleProgress(vote: vote),
                          SizedBox(
                            width: Sizes.dp10(context),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  title,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.displayLarge,
                                ),
                                Text(releaseDate, style: textTheme.bodySmall),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Sizes.dp10(context),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: genre,
                        ),
                      ),
                      SizedBox(
                        height: Sizes.dp10(context),
                      ),
                      Text(
                        overview,
                        softWrap: true,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
