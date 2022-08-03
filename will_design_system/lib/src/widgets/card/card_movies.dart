import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import 'package:will_design_system/src/common/common.dart';

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
                  placeholder: (context, url) => LoadingIndicator(),
                  errorWidget: (context, url, error) => ErrorImage(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Sizes.dp10(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
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
                                    style: TextStyle(
                                      fontFamily: 'DancingScript',
                                      fontWeight: FontWeight.w600,
                                      fontSize: Sizes.dp16(context),
                                    ),
                                  ),
                                  Text(
                                    releaseDate,
                                    style: TextStyle(
                                      fontSize: Sizes.dp12(context),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
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
