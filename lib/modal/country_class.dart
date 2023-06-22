

class Country{
  final String name;
  final String flag;
  // final String population;
  final String capital;
  // final String gdp;

  Country({
    required this.name,
    required this.flag,
    // required this.population,
    required this.capital,
    // required this.gdp,
 });
  factory Country.fromMap({required Map data}) {
    return Country(
      name: data["name"],
      flag: data["flag"],
      // population: data["population"],
      capital: data["capital"],
      // gdp: data["gdp"],
    );
  }
}