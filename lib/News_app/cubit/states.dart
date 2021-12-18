 abstract class NewsStates{
 }
 class NewsInitialStates extends NewsStates{}
 class NewsBottomNavStates extends NewsStates{}
 class NewsGetBusinessSuccessState extends NewsStates{}
 class NewsGetBusinessErorrState extends NewsStates{
 final String error;

  NewsGetBusinessErorrState(this.error);
 }
 class NewsGetBusinessLoadingState extends NewsStates{}
 class NewsGetSportsSuccessState extends NewsStates{}
 class NewsGetSportsErorrState extends NewsStates{
  final String error;

  NewsGetSportsErorrState(this.error);
 }
 class NewsGetSportsLoadingState extends NewsStates{}
 class NewsGetScienceSuccessState extends NewsStates{}
 class NewsGetScienceErorrState extends NewsStates{
  final String error;

  NewsGetScienceErorrState(this.error);
 }
 class NewsGetScienceLoadingState extends NewsStates{}
 class NewsChangeModeState extends NewsStates{}
 class NewsGetSearchSuccessState extends NewsStates{}
 class NewsGetSearchErorrState extends NewsStates{
  final String error;

  NewsGetSearchErorrState(this.error);
 }
 class NewsGetSearchLoadingState extends NewsStates{}


