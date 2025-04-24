import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(home: Prototipo4(), debugShowCheckedModeBanner: false),
  );
}

class Prototipo4 extends StatefulWidget {
  const Prototipo4({super.key});

  @override
  State<Prototipo4> createState() => _Prototipo4State();
}

class _Prototipo4State extends State<Prototipo4> {
  static const Color vermelhoEscuro = Color(0xFF8B0000);
  static const Color cinzaEscuro = Color(0xFF1E1E1E);
  static const Color dourado = Color(0xFFC9A43F);
  static const Color brancoSuave = Color(0xFFF5F5F5);

  String categoriaSelecionada = "Todos";

  final List<Map<String, dynamic>> pratos = const [
    {
      "nome": "Sushi de Salmão",
      "descricao": "Fatias frescas de salmão sobre arroz temperado.",
      "imagem": "assets/sushi_salmao.webp",
      "selo": "Promoção",
      "nutricao": true,
      "categoria": "Sushi",
    },
    {
      "nome": "Ramen Miso",
      "descricao": "Macarrão japonês com caldo de miso e legumes.",
      "imagem": "assets/ramen_miso.jpg",
      "categoria": "Ramen",
    },
    {
      "nome": "Guioza",
      "descricao": "Pastéis japoneses recheados e grelhados.",
      "imagem": "assets/guioza.jpg",
      "categoria": "Yakissoba",
    },
    {
      "nome": "Sashimi Variado",
      "descricao": "Seleção de peixes frescos em fatias.",
      "imagem": "assets/sashimi_variado.jpg",
      "categoria": "Sushi",
    },
    {
      "nome": "Yakissoba",
      "descricao": "Macarrão oriental salteado com legumes e carne.",
      "imagem": "assets/yakissoba.jpg",
      "categoria": "Yakissoba",
    },
    {
      "nome": "Mochi Sorvete",
      "descricao": "Doce de arroz recheado com sorvete de morango.",
      "imagem": "assets/mochi_sorvete.webp",
      "categoria": "Doces",
    },
    {
      "nome": "Oniguiri",
      "descricao": "Bolinho de arroz com recheio de salmão.",
      "imagem": "assets/oniguiri.webp",
      "categoria": "Sushi",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cinzaEscuro,
      appBar: AppBar(
        backgroundColor: vermelhoEscuro,
        centerTitle: true,
        title: const FittedBox(
          child: Text(
            "🍱 Hanami Sushi Bar ",
            style: TextStyle(
              color: brancoSuave,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                _botaoCategoria("Todos"),
                _botaoCategoria("Sushi"),
                _botaoCategoria("Ramen"),
                _botaoCategoria("Yakissoba"),
                _botaoCategoria("Doces"),
              ],
            ),
            const SizedBox(height: 20),
            ...pratos
                .where(
                  (prato) =>
                      categoriaSelecionada == "Todos" ||
                      prato['categoria'] == categoriaSelecionada,
                )
                .map(_itemCardapio)
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _botaoCategoria(String nome) {
    return ElevatedButton(
      onPressed: () => setState(() => categoriaSelecionada = nome),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            categoriaSelecionada == nome ? vermelhoEscuro : Colors.white,
        foregroundColor:
            categoriaSelecionada == nome ? brancoSuave : cinzaEscuro,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(nome),
    );
  }

  Widget _itemCardapio(Map<String, dynamic> prato) {
    return Card(
      color: const Color(0xFF2A2A2A),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    prato["imagem"],
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                if (prato["selo"] != null)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: dourado,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        prato["selo"],
                        style: const TextStyle(
                          color: cinzaEscuro,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              prato["nome"],
              style: const TextStyle(
                color: brancoSuave,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              prato["descricao"],
              style: const TextStyle(color: brancoSuave, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              label: const Text("Fazer Pedido"),
              style: ElevatedButton.styleFrom(
                backgroundColor: vermelhoEscuro,
                foregroundColor: brancoSuave,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            if (prato["nutricao"] == true) ...[
              const SizedBox(height: 10),
              _tabelaNutricional(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _tabelaNutricional() {
    return Table(
      border: TableBorder.all(color: Colors.grey.shade600),
      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
      children: const [
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(6),
              child: Text("Calorias", style: TextStyle(color: brancoSuave)),
            ),
            Padding(
              padding: EdgeInsets.all(6),
              child: Text("280 kcal", style: TextStyle(color: brancoSuave)),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(6),
              child: Text("Proteínas", style: TextStyle(color: brancoSuave)),
            ),
            Padding(
              padding: EdgeInsets.all(6),
              child: Text("22 g", style: TextStyle(color: brancoSuave)),
            ),
          ],
        ),
      ],
    );
  }
}
