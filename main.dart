import 'package:flutter/material.dart';

void main() {
  runApp(const NeoReciclaApp());
}

class NeoReciclaApp extends StatelessWidget {
  const NeoReciclaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeoRecicla',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF3F8F4),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final int puntos = 120;
  final int residuos = 8;
  final String nivel = 'Eco 2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenu(
        onItemSelected: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ClasificacionPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PuntosReciclajePage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const GamificacionPage()),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const GuiaSeparacionPage()),
            );
          }
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 950),
              child: Column(
                children: [
                  _header(),
                  Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      children: [
                        _welcomeCard(),
                        const SizedBox(height: 20),
                        _statsCard(),
                        const SizedBox(height: 25),
                        const Text(
                          'Que quieres hacer hoy?',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0B5D2A),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 18),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final isWide = constraints.maxWidth > 650;

                            return GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: isWide ? 2 : 1,
                              crossAxisSpacing: 18,
                              mainAxisSpacing: 18,
                              childAspectRatio: isWide ? 2.7 : 2.8,
                              children: [
                                _actionCard(
                                  context,
                                  icon: Icons.camera_alt,
                                  title: 'Clasificar residuo con IA',
                                  subtitle:
                                      'Usa inteligencia artificial para identificar y clasificar tus residuos.',
                                  badge: '+10 puntos por clasificación',
                                  iconColor: Colors.green,
                                  page: const ClasificacionPage(),
                                ),
                                _actionCard(
                                  context,
                                  icon: Icons.location_on,
                                  title: 'Puntos de reciclaje',
                                  subtitle:
                                      'Encuentra puntos de reciclaje cercanos en Neiva.',
                                  iconColor: Colors.green.shade700,
                                  page: const PuntosReciclajePage(),
                                ),
                                _actionCard(
                                  context,
                                  icon: Icons.emoji_events,
                                  title: 'Gamificación y progreso',
                                  subtitle:
                                      'Revisa tus logros, puntos y nivel como usuario ecológico.',
                                  iconColor: Colors.amber.shade700,
                                  page: const GamificacionPage(),
                                ),
                                _actionCard(
                                  context,
                                  icon: Icons.menu_book,
                                  title: 'Guia de separación',
                                  subtitle:
                                      'Aprende a separar residuos segun el código de colores.',
                                  iconColor: Colors.green,
                                  page: const GuiaSeparacionPage(),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 22),
                        _impactCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0B7A32), Color(0xFF4CAF50)],
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'NeoRecicla',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(Icons.eco, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Hola, Usuario Eco',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(width: 12),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _welcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFFEAF8ED), Color(0xFFD7F3DB)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Juntos por un Neiva\nmás limpio y sostenible',
                  style: TextStyle(
                    color: Color(0xFF0B5D2A),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  'Usa la tecnología para clasificar correctamente tus residuos, '
                  'encuentra puntos de reciclaje y gana puntos mientras cuidas el planeta.',
                  style: TextStyle(fontSize: 17, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Center(
                child: Icon(
                  Icons.recycling,
                  size: 110,
                  color: Color(0xFF2E7D32),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statsCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _statItem(
              Icons.workspace_premium,
              '$puntos',
              'Puntos acumulados',
              Colors.green,
            ),
            _divider(),
            _statItem(
              Icons.recycling,
              '$residuos',
              'Residuos clasificados',
              Colors.blue,
            ),
            _divider(),
            _statItem(
              Icons.military_tech,
              nivel,
              'Nivel actual',
              Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _statItem(IconData icon, String value, String label, Color color) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(height: 80, width: 1, color: Colors.grey.shade300);
  }

  Widget _actionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
    required Widget page,
    String? badge,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              CircleAvatar(
                radius: 42,
                backgroundColor: iconColor.withOpacity(0.18),
                child: Icon(icon, size: 42, color: iconColor),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF0B5D2A),
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, height: 1.25),
                    ),
                    if (badge != null) ...[
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD8F3DC),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          badge,
                          style: const TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF0B5D2A),
                size: 34,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _impactCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [Color(0xFFE1F5E5), Color(0xFFD1F0D7)],
        ),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 12)],
      ),
      child: const Row(
        children: [
          Icon(Icons.eco, size: 70, color: Colors.green),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pequeñas acciones, grandes cambios',
                  style: TextStyle(
                    color: Color(0xFF0B5D2A),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Cada residuo clasificado cuenta para construir un Neiva más verde.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Icon(Icons.trending_up, size: 70, color: Colors.green),
        ],
      ),
    );
  }
}

class ClasificacionPage extends StatefulWidget {
  const ClasificacionPage({super.key});

  @override
  State<ClasificacionPage> createState() => _ClasificacionPageState();
}

class _ClasificacionPageState extends State<ClasificacionPage> {
  String residuo = 'Botella plastica';
  String categoria = 'Aprovechable';
  String bolsa = 'Bolsa blanca';
  int puntos = 10;

  void simularClasificacion() {
    final resultados = [
      ['Botella plastica', 'Aprovechable', 'Bolsa blanca', '10'],
      ['Caja de carton', 'Aprovechable', 'Bolsa blanca', '10'],
      ['Cascara de fruta', 'Organico', 'Bolsa verde', '8'],
      ['Servilleta usada', 'No aprovechable', 'Bolsa negra', '5'],
    ];

    final seleccionado = resultados[DateTime.now().second % resultados.length];

    setState(() {
      residuo = seleccionado[0];
      categoria = seleccionado[1];
      bolsa = seleccionado[2];
      puntos = int.parse(seleccionado[3]);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Clasificacion completada. +$puntos puntos')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _BasePage(
      title: 'Clasificacion inteligente',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.camera_alt, size: 95, color: Colors.green),
          const SizedBox(height: 15),
          const Text(
            'Simulación de clasificación mediante inteligencia artificial',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text(
                    'Residuo detectado:',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    residuo,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Chip(
                    label: Text('Categoria: $categoria'),
                    backgroundColor: const Color(0xFFD8F3DC),
                  ),
                  Chip(
                    label: Text('Depositar en: $bolsa'),
                    backgroundColor: const Color(0xFFEAF8ED),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Recomendacion: Separar el residuo antes de depositarlo y evitar mezclarlo con residuos organicos o contaminados.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: simularClasificacion,
            icon: const Icon(Icons.add_a_photo),
            label: const Text('Simular nueva clasificación'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(18),
            ),
          ),
        ],
      ),
    );
  }
}

class PuntosReciclajePage extends StatelessWidget {
  const PuntosReciclajePage({super.key});

  final List<Map<String, String>> puntos = const [
    {
      'nombre': 'Punto ecológico Centro de Neiva',
      'direccion': 'Zona centro - Neiva',
      'tipo': 'Plastico, papel, vidrio y carton',
    },
    {
      'nombre': 'Parque principal',
      'direccion': 'Comuna 1 - Neiva',
      'tipo': 'Residuos aprovechables',
    },
    {
      'nombre': 'Institucion educativa piloto',
      'direccion': 'Zona urbana - Neiva',
      'tipo': 'Campañas ambientales y separación en fuente',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return _BasePage(
      title: 'Puntos de reciclaje',
      child: Column(
        children: [
          const Text(
            'Encuentra puntos cercanos para disponer residuos aprovechables.',
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 18),
          ...puntos.map(
            (punto) => Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: Colors.green,
                  size: 40,
                ),
                title: Text(
                  punto['nombre']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${punto['direccion']}\nTipo: ${punto['tipo']}'),
                isThreeLine: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GamificacionPage extends StatelessWidget {
  const GamificacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _BasePage(
      title: 'Gamificación y progreso',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.emoji_events, size: 95, color: Colors.amber),
          const SizedBox(height: 10),
          const Text(
            'Nivel actual: Eco Reciclador',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Padding(
              padding: EdgeInsets.all(22),
              child: Column(
                children: [
                  Text('Progreso hacia el siguiente nivel'),
                  SizedBox(height: 12),
                  LinearProgressIndicator(value: 0.65, minHeight: 12),
                  SizedBox(height: 12),
                  Text('120 puntos acumulados'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Logros obtenidos',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text('Primer residuo clasificado'),
          ),
          const ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text('Cinco residuos registrados'),
          ),
          const ListTile(
            leading: Icon(Icons.lock, color: Colors.grey),
            title: Text('Visitar un punto de reciclaje'),
          ),
        ],
      ),
    );
  }
}

class GuiaSeparacionPage extends StatelessWidget {
  const GuiaSeparacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categorias = [
      {
        'color': Colors.white,
        'titulo': 'Bolsa blanca',
        'descripcion':
            'Residuos aprovechables: plastico, vidrio, metales, papel y carton.',
      },
      {
        'color': Colors.black12,
        'titulo': 'Bolsa negra',
        'descripcion':
            'Residuos no aprovechables: papel higienico, servilletas y residuos contaminados.',
      },
      {
        'color': Colors.green.shade100,
        'titulo': 'Bolsa verde',
        'descripcion':
            'Residuos organicos: restos de comida, cascaras y residuos vegetales.',
      },
    ];

    return _BasePage(
      title: 'Guia de separación',
      child: Column(
        children: categorias.map((item) {
          return Card(
            color: item['color'] as Color,
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: ListTile(
              leading: const Icon(Icons.recycling, color: Colors.green),
              title: Text(
                item['titulo'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item['descripcion'] as String),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _BasePage extends StatelessWidget {
  final String title;
  final Widget child;

  const _BasePage({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenu(
        onItemSelected: (index) {
          if (index == 0) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
              (route) => false,
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ClasificacionPage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const PuntosReciclajePage()),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const GamificacionPage()),
            );
          } else if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const GuiaSeparacionPage()),
            );
          }
        },
      ),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class BottomMenu extends StatelessWidget {
  final Function(int) onItemSelected;

  const BottomMenu({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: 0,
      onDestinationSelected: onItemSelected,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Inicio'),
        NavigationDestination(
          icon: Icon(Icons.camera_alt),
          label: 'Clasificar',
        ),
        NavigationDestination(icon: Icon(Icons.location_on), label: 'Puntos'),
        NavigationDestination(icon: Icon(Icons.emoji_events), label: 'Logros'),
        NavigationDestination(icon: Icon(Icons.info), label: 'Guia'),
      ],
    );
  }
}
