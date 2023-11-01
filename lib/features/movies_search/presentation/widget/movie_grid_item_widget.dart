import 'package:flutter/material.dart';
import 'package:micro_tech_movies/core/extensions/navigation_extenstions.dart';
import 'package:micro_tech_movies/features/movies_search/data/model/movie_model.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_sizes.dart';
import '../../../../core/constants/spaces.dart';
import '../../../movie_details/presentation/pages/movie_details_screen.dart';

class MovieGridItemWidget extends StatelessWidget {
  final MovieModel movie;

  const MovieGridItemWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
        color: colorWhite.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: colorGrey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          context.pushNamed(MovieDetailsScreen.id, arguments: movie);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                    image: NetworkImage(movie.posterPath!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: colorBlack.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Positioned(
                      bottom: 1.2.h,
                      left: 1.2.h,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 0.5.h,
                          horizontal: 1.h,
                        ),
                        decoration: BoxDecoration(
                          color: colorWhite.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: colorGrey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.discount_outlined,
                              color: colorPrimary,
                              size: 2.h,
                            ),
                            SizedBox(width: 0.5.h),
                            Text(
                              '${movie.popularity}',
                              style: TextStyle(
                                fontSize: FontSizes.x_small,
                                fontWeight: FontWeight.bold,
                                color: colorBlack54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1.2.h,
                      left: 1.2.h,
                      child: Wrap(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 0.5.h,
                              horizontal: 1.h,
                            ),
                            decoration: BoxDecoration(
                              color: colorWhite.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: colorGrey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              '${movie.voteAverage ?? '-'}',
                              style: TextStyle(
                                fontSize: FontSizes.x_small,
                                fontWeight: FontWeight.bold,
                                color: colorBlack54,
                              ),
                            ),
                          ),
                          Spaces.horizontal5(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 0.5.h,
                              horizontal: 1.h,
                            ),
                            decoration: BoxDecoration(
                              color: colorWhite.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: colorGrey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              '${movie.releaseDate ?? '-'}',
                              style: TextStyle(
                                fontSize: FontSizes.x_small,
                                fontWeight: FontWeight.bold,
                                color: colorBlack54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 2.5.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${movie.title ?? '-'}',
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: FontSizes.medium,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spaces.horizontal15(),
                  InkWell(
                    onTap: () {
                      context.pushNamed(MovieDetailsScreen.id, arguments: movie);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 1.h,
                        horizontal: 1.h,
                      ),
                      decoration: BoxDecoration(
                        color: colorPrimary.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: colorGrey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: colorWhite,
                        size: 2.5.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, bottom: 1.5.h, top: 1.h),
              child: Text(
                '${movie.overview ?? '-'}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: FontSizes.xx_small,
                  color: colorGrey,
                  height: 1.2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 0.5.h, bottom: 2.h),
              child: Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.h),
                    margin: EdgeInsets.only(right: 1.h, bottom: 0.5.h),
                    decoration: BoxDecoration(
                      color: colorAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.monetization_on,
                          color: colorPrimary,
                          size: 2.h,
                        ),
                        SizedBox(width: 0.5.h),
                        Text(
                          'x1',
                          // '${movie.price ?? '-'} EGP',
                          style: TextStyle(
                            fontSize: FontSizes.x_small,
                            fontWeight: FontWeight.bold,
                            color: colorBlack54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.h),
                    margin: EdgeInsets.only(right: 1.h, bottom: 0.5.h),
                    decoration: BoxDecoration(
                      color: colorAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_rate,
                          color: colorYellow,
                          size: 2.h,
                        ),
                        SizedBox(width: 0.5.h),
                        Text(
                          '${movie.voteAverage ?? '-'}',
                          style: TextStyle(
                            fontSize: FontSizes.x_small,
                            fontWeight: FontWeight.bold,
                            color: colorBlack54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}