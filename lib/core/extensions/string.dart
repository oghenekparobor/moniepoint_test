extension StringExt on String {
  String get jpg => 'assets/images/$this.jpg';
  String get png => 'assets/images/$this.png';
  String get svg => 'assets/icons/$this.svg';

  String get addSpaceBetweenFirstAndFourthDigit {
    if (length < 4) {
      return this; // Return the original string if it's too short
    }
    return '${substring(0, 1)} ${substring(1, 4)}${substring(4)}';
  }
}
