import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class RedditArticle extends Equatable {

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'selftext')
  final String selftext;
  @JsonKey(name: 'thumbnail')
  final String thumbnail;
  @JsonKey(name: 'ups')
  final int ups;


  const RedditArticle(
      {required this.name, required this.title, required this.thumbnail, required this.ups, required this.selftext});

  @override
  List<Object?> get props =>
      [
        name, title, thumbnail, ups, selftext
      ];

}