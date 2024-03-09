class SearchMovieByTitleUseCaseParams {
  final int page;
  final String language;
  final String query;

  SearchMovieByTitleUseCaseParams({
    required this.page,
    required this.language,
    required this.query,
  });
}
