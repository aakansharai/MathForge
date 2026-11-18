import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'vector_model.dart';
import 'vector_painter.dart';

class VectorForgeScreen extends StatefulWidget {
  const VectorForgeScreen({super.key});

  @override
  State<VectorForgeScreen> createState() => _VectorForgeScreenState();
}

class _VectorForgeScreenState extends State<VectorForgeScreen> {
  bool _is3DView = false;
  double _scale = 20.0;

  double _rotationX = 0.5;
  double _rotationY = 0.5;

  final _axController = TextEditingController(text: '3');
  final _ayController = TextEditingController(text: '4');
  final _azController = TextEditingController(text: '3');

  final _bxController = TextEditingController(text: '2');
  final _byController = TextEditingController(text: '1');
  final _bzController = TextEditingController(text: '2');

  double _parseVal(String text) => double.tryParse(text) ?? 0.0;

  @override
  Widget build(BuildContext context) {
    final vectorA = Vector3D(
      _parseVal(_axController.text),
      _parseVal(_ayController.text),
      _parseVal(_azController.text),
    );
    final vectorB = Vector3D(
      _parseVal(_bxController.text),
      _parseVal(_byController.text),
      _parseVal(_bzController.text),
    );
    final sumVector = vectorA + vectorB;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vector Forge Simulation'),
        actions: [
          IconButton(
            onPressed: _scanGeometryDiagram,
            icon: Icon(Icons.file_upload_outlined, color: Colors.white),
            tooltip: "Scan and upload",
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Stack(
              children: [
                GestureDetector(
                  onPanUpdate: (details) {
                    if (_is3DView) {
                      setState(() {
                        _rotationY += details.delta.dx * 0.01;
                        _rotationX += details.delta.dy * 0.01;
                      });
                    }
                  },
                  child: Container(
                    color: const Color(0xFF121212),
                    width: double.infinity,
                    child: SizedBox.expand(
                      child: CustomPaint(
                        painter: VectorPainter(
                          vectorA: vectorA,
                          vectorB: vectorB,
                          sumVector: sumVector,
                          is3DView: _is3DView,
                          scale: _scale,
                          rotationX: _rotationX,
                          rotationY: _rotationY,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Row(
                    children: [
                      IconButton.filledTonal(
                        onPressed: () {
                          setState(() {
                            if (_scale > 10.0) _scale -= 5.0;
                          });
                        },
                        icon: const Icon(Icons.zoom_out),
                      ),
                      const SizedBox(width: 8),
                      IconButton.filledTonal(
                        onPressed: () {
                          setState(() {
                            if (_scale < 50.0) _scale += 5.0;
                          });
                        },
                        icon: const Icon(Icons.zoom_in),
                      ),
                      const SizedBox(width: 12),
                      SegmentedButton<bool>(
                        segments: const [
                          ButtonSegment(value: false, label: Text('2D')),
                          ButtonSegment(value: true, label: Text('3D')),
                        ],
                        selected: {_is3DView},
                        onSelectionChanged: (Set<bool> newSelection) {
                          setState(() {
                            _is3DView = newSelection.first;
                            if (!_is3DView) {
                              _rotationX = 0.0;
                              _rotationY = 0.0;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- BOTTOM HALF: CONTROLS & METRICS ---
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildVectorInputCard(
                          'Vector A',
                          _axController,
                          _ayController,
                          _azController,
                          Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildVectorInputCard(
                          'Vector B',
                          _bxController,
                          _byController,
                          _bzController,
                          Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Sum (A+B): $sumVector',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Dot (A·B): ${vectorA.dot(vectorB).toStringAsFixed(1)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: 16),
                          Text(
                            'Angle Between: ${vectorA.angleWith(vectorB).toStringAsFixed(1)}°',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVectorInputCard(
    String title,
    TextEditingController x,
    TextEditingController y,
    TextEditingController z,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildField('X', x)),
              const SizedBox(width: 4),
              Expanded(child: _buildField('Y', y)),
              const SizedBox(width: 4),
              Expanded(child: _buildField('Z', z)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
        signed: true,
      ),
      decoration: InputDecoration(
        labelText: label,
        isDense: true,
        border: const OutlineInputBorder(),
      ),
      onChanged: (_) => setState(() {}),
    );
  }

  Future<void> _scanGeometryDiagram() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final InputImage inputImage = InputImage.fromFilePath(image.path);

    try {
      final RecognizedText recognizedText = await textRecognizer.processImage(
        inputImage,
      );

      final RegExp regExp = RegExp(r'[-+]?\d*\.?\d+');
      List<double> extractedNumbers = [];

      for (TextBlock block in recognizedText.blocks) {
        for (TextLine line in block.lines) {
          final matches = regExp.allMatches(line.text);
          for (var match in matches) {
            double? val = double.tryParse(match.group(0) ?? '');
            if (val != null) {
              extractedNumbers.add(val);
            }
          }
        }
      }

      if (extractedNumbers.length >= 3) {
        setState(() {
          _axController.text = extractedNumbers[0].toString();
          _ayController.text = extractedNumbers[1].toString();
          _azController.text = extractedNumbers[2].toString();

          if (extractedNumbers.length >= 6) {
            _bxController.text = extractedNumbers[3].toString();
            _byController.text = extractedNumbers[4].toString();
            _bzController.text = extractedNumbers[5].toString();
          }
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Successfully extracted coordinates from diagram!'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Could not detect enough coordinates. Try a clearer image.',
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint("OCR Error: $e");
    } finally {
      textRecognizer.close();
    }
  }
}
