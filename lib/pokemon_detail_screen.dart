import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_model.dart';
import 'package:pokedex/pokemon_service.dart';

class PokemonDetailScreen extends StatelessWidget {
  PokemonDetailScreen({required this.title, required this.url});
  String title;
  String url;
  int number = 12;
  PokemonService pokemonService = PokemonService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      //TODO Display pokemon datail from url
      body: Text(this.title));
      body: FutureBuilder(
          future: pokemonService.getdata(url),
          builder: (context, AsyncSnapshot<PokemonModel> snapshot) {
            if (snapshot.hasData) {
              PokemonModel data = snapshot.data!;
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue.shade200,
                        backgroundImage: NetworkImage(
                          data.sprites!.frontDefault.toString(),
                        ),
                        radius: 99,
                      ),
                      Text("Name: " + data.name!),
                      Text("ID: " + data.id.toString()),
                      Text("Weight: " + data.weight.toString()),
                    ],
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        );
  }
}