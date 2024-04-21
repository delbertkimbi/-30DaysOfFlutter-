/*

count:1302
next:"https://pokeapi.co/api/v2/pokemon?offset=300&limit=100"
previous:"https://pokeapi.co/api/v2/pokemon?offset=100&limit=100"
name:"unown"
url:"https://pokeapi.co/api/v2/pokemon/201/"
name:"wobbuffet"
url:"https://pokeapi.co/api/v2/pokemon/202/"
name:"girafarig"
url:"https://pokeapi.co/api/v2/pokemon/203/"
 */
class PokemonListing {
  final int id;
  final String name;

  PokemonListing({required this.id, required this.name});
  factory PokemonListing.fromJson(Map<String, dynamic> json) {
    final name = json["name"];
    final url = json["url"] as String;
    final id = int.parse(url.split('/')[6]);
    return PokemonListing(id: id, name: name);
  }
}

class PokemonRespondse {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonRespondse({required this.pokemonListings, required this.canLoadNextPage});
  factory PokemonRespondse.fromJson(Map<String, dynamic> json) {
     final canLoadNextPage = json["next"]!= null;
    final pokemonListings =
        (json["results"] as List).map((e) => PokemonListing.fromJson(e)).toList();
   
    return PokemonRespondse(pokemonListings: pokemonListings, canLoadNextPage: canLoadNextPage);
  }
}
