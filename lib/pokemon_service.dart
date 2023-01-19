import 'package:pokedex/pokemon_list_model.dart';
import 'package:pokedex/pokemon_model.dart';
import 'package:pokedex/pokemon_provider.dart';

class PokemonService {
  PokemonProvider _pokemonProvider = new PokemonProvider();
  PokemonProvider _providerdata = new PokemonProvider();

  Future<PokemonListModel> getPokemonList() {
    return _pokemonProvider.getPokemonList();
  }
  //To Do 
  // create new service method gor get pokemon detail
  Future<PokemonModel> getdata(String URL) {
     return _providerdata.pokemondata(URL);
  }
}