import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pruebaapp/components/components.dart';

class Reserva extends StatefulWidget {
  const Reserva({super.key});

  @override
  State<Reserva> createState() => _ReservaState();
}

class _ReservaState extends State<Reserva> {
  String _selectedInstructor = 'Seleccionar instructor';
  TextEditingController _dateController = TextEditingController();
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
                  const InformacionCancha(),
                  const SizedBox(height: 24),
                  DropdownButtonFormField<String>(
                    value: _selectedInstructor,
                    items: const [
                      DropdownMenuItem(
                        value: 'Seleccionar instructor',
                        child: Text('Seleccionar instructor'),
                      ),
                      DropdownMenuItem(
                        value: 'Instructor 1',
                        child: Text('Instructor 1'),
                      ),
                      DropdownMenuItem(
                        value: 'Instructor 2',
                        child: Text('Instructor 2'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedInstructor = value!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Agregar instructor',
                      border: OutlineInputBorder(),
                    ),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                              child: Text(time),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      onPressed: () => context.go('/confirmacion'),
                      textButton: 'Reservar'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
