import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pruebaapp/components/components.dart';
import 'package:pruebaapp/controllers/controllers.dart';
import 'package:pruebaapp/models/models.dart';
import 'package:pruebaapp/providers/providers.dart';

class Reserva extends StatefulWidget {
  final int idCancha;
  const Reserva({super.key, required this.idCancha});

  @override
  State<Reserva> createState() => _ReservaState();
}

class _ReservaState extends State<Reserva> {
  String _selectedInstructor = 'Seleccionar instructor';
  final TextEditingController _dateController = TextEditingController();
  String? _selectedStartTime = '00:00';
  String? _selectedEndTime = '00:00';

  final List<String> _timeOptions = [
    for (int i = 0; i < 24; i++) '${i.toString().padLeft(2, '0')}:00',
  ];

  @override
  void initState() {
    super.initState();
    _dateController.text =
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    InstructorController instructorController =
        Provider.of<InstructorController>(context, listen: false);

    CanchaController canchaController =
        Provider.of<CanchaController>(context, listen: false);

    final String? selectedCity =
        Provider.of<CityProvider>(context).selectedCity;
    final climaProvider = Provider.of<ClimaProvider>(context, listen: false);

    return FutureBuilder<void>(
      future: climaProvider
          .fetchClima(selectedCity!), // Espera a que los datos se carguen
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Carrusel(onPressed: () => context.go('/principal')),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<Cancha>(
                          future:
                              canchaController.obtenerCancha(widget.idCancha),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData) {
                              return const Center(
                                  child: Text('No hay canchas disponibles'));
                            } else {
                              return InformacionCancha(
                                cancha: snapshot.data!,
                                iconUrl: climaProvider.iconUrl!,
                                progress: climaProvider.clima!.main!.humidity!,
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 24),
                        FutureBuilder<List<Instructor>>(
                          future: instructorController.obtenerInstructores(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return const Center(
                                  child:
                                      Text('No hay instructores disponibles'));
                            } else {
                              List<DropdownMenuItem<String>> listInstructores =
                                  [];

                              listInstructores.add(const DropdownMenuItem(
                                value: 'Seleccionar instructor',
                                child: Text('Seleccionar instructor'),
                              ));

                              for (Instructor instructor in snapshot.data!) {
                                listInstructores.add(DropdownMenuItem(
                                  value: instructor.nombre,
                                  child: Text(instructor.nombre),
                                ));
                              }

                              return DropdownButtonFormField<String>(
                                value: _selectedInstructor,
                                items: listInstructores,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedInstructor = value!;
                                  });
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Agregar instructor',
                                  border: OutlineInputBorder(),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    color: const Color(0xFFF4F7FC),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Establecer fecha y hora',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _dateController,
                                readOnly: true,
                                onTap: () => _selectDate(context),
                                decoration: const InputDecoration(
                                  labelText: 'Fecha',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _selectedStartTime,
                                items: _timeOptions.map((String time) {
                                  return DropdownMenuItem<String>(
                                    value: time,
                                    child: Text(time,
                                        style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                        )),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedStartTime = value!;
                                  });
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Hora de inicio',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _selectedEndTime,
                                items: _timeOptions.map((String time) {
                                  return DropdownMenuItem<String>(
                                    value: time,
                                    child: Text(time),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedEndTime = value!;
                                  });
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Hora de fin',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Agregar un comentario',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Agregar un comentario...',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 4,
                        ),
                        const SizedBox(height: 45),
                        ButtonGreen(
                            onPressed: () =>
                                context.go('/confirmacion/${widget.idCancha}'),
                            textButton: 'Reservar'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
