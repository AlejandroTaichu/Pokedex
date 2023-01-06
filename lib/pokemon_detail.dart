import 'package:flutter/material.dart';
import 'package:pokedex/pokemons.dart';

class PokemonDetail extends StatefulWidget {
  Pokemons pokemon;

  PokemonDetail({required this.pokemon});
  
  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) {
    var p = widget.pokemon;
    return Scaffold(
      appBar: AppBar(
        title: Text(p.name),backgroundColor: Colors.yellow,),
      body:Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${p.name}"),
            Text("${p.health}"),
            Text("${p.power}"),
          ],
      ) ,
      )
    );
  }
}
