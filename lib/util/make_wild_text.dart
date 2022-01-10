String makeWildText(int round) {
  if (round < 9) {
    return "${round + 2}'s";
  } else if (round == 9) {
    return 'Jacks';
  } else if (round == 10) {
    return 'Queens';
  } else if (round == 11) {
    return 'Kings';
  } else {
    return 'Game Complete';
  }
}
