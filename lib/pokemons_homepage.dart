import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_detail.dart';
import 'package:pokedex/pokemons.dart';

class PokemonHomepage extends StatefulWidget {
  const PokemonHomepage({Key? key}) : super(key: key);

  @override
  State<PokemonHomepage> createState() => _PokemonHomepageState();
}

class _PokemonHomepageState extends State<PokemonHomepage> {
  Future<List<Pokemons>> callPokemon() async {
    var pokeList = <Pokemons>[];

    var p1 = Pokemons(pokeId: 1, name: "Charmender.png", health: 100, power: 250);
    var p2 = Pokemons(pokeId: 2, name: "squirtle.png", health: 150, power: 300);
    var p3 = Pokemons(pokeId: 3, name: "balbazar.png", health: 300, power: 500);

    pokeList.add(p1);
    pokeList.add(p2);
    pokeList.add(p3);

    return pokeList;
  }

  late final future = callPokemon();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("POKEDEX"), backgroundColor: Colors.green),
      body: FutureBuilder<List<Pokemons>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var pokeList = snapshot.data;
            return ListView.builder(
              itemCount: pokeList!.length,
              itemBuilder: (context, indeks) {
                var pokemon = pokeList[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PokemonDetail(pokemon: pokemon)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.asset("images/${pokemon.name}")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pokemon.name,
                              style: TextStyle(fontSize: 25),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Text("${pokemon.health}"),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
