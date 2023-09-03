const String erroreImageUrl = 'assets/sp.png';
//'https://images.unsplash.com/photo-1658786403875-ef4086b78196?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80';

String imageURL(String url) {
  try {
    return url;
  } catch (e) {
    return erroreImageUrl;
  }
}

List<String> tabs = [
  'business',
  'entertainment',
  'general',
  'health',
  'science',
  'technology',
  'sports',
];
