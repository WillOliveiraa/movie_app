enum AssetSvg {
  none(''),
  arrowLeft('assets/icons/arrow-long-left.svg'),
  items('assets/icons/items.svg'),
  moreHoriz('assets/icons/more-horizontal.svg'),
  search('assets/icons/search.svg'),
  notification('assets/icons/bell-regular.svg'),
  heartNo('assets/icons/heart-no.svg'),
  heart('assets/icons/heart.svg'),
  home('assets/icons/home.svg'),
  monitor('assets/icons/monitor.svg'),
  settings('assets/icons/settings.svg'),
  star('assets/icons/star.svg'),
  playCircle('assets/icons/play-circle.svg');

  final String value;

  const AssetSvg(this.value);
}
