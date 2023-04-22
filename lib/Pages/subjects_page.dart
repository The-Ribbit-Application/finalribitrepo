import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SubjectsPage(),
    );
  }
}

class SubjectsPage extends StatefulWidget {
  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  List<String> _subjects = [''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subjects',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFFCFE795),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < _subjects.length; i++)
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xFFCFE795),
                  ),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            TextFormField(
                              initialValue: _subjects[i],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter subject',
                                hintStyle: TextStyle(color: Colors.black54),
                              ),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              onChanged: (text) {
                                setState(() {
                                  _subjects[i] = text;
                                });
                              },
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _subjects.removeAt(i);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.delete),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SubjectDetailPage(title: _subjects[i]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 16.0, 16.0),
        child: FloatingActionButton(
          backgroundColor: Color(0xFFCFE795),
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _subjects.add('');
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class SubjectDetailPage extends StatefulWidget {
  final String title;

  const SubjectDetailPage({Key? key, required this.title}) : super(key: key);

  @override
  _SubjectDetailPageState createState() => _SubjectDetailPageState();
}

class _SubjectDetailPageState extends State<SubjectDetailPage> {
  int _examsWeight = 0;
  int _quizzesWeight = 0;
  int _assignmentsWeight = 0;

  List<int> _examsGrades = [];
  List<int> _quizzesGrades = [];
  List<int> _assignmentsGrades = [];

  final _formKey = GlobalKey<FormState>();

  int _currentRadioValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFFCFE795),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 2,
                child: Text('Syllabus'),
              ),
              PopupMenuItem(
                value: 3,
                child: Text('Add Grade'),
              ),
            ],
            onSelected: (value) {
              if (value == 1) {
                // Do something for Edit option
              } else if (value == 2) {
                _showSyllabusDialog(context);
              } else if (value == 3) {
                _showAddGradeDialog(context);
              }
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Grade:',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              _calculateCurrentGrade().toStringAsFixed(2),
              style: TextStyle(fontSize: 24.0, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  void _showSyllabusDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Enter your Syllabus"),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Exams weight (%)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter exams weight';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _examsWeight = value.isEmpty ? 0 : int.parse(value);
                    });
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Quizzes weight (%)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter quizzes weight';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _quizzesWeight = value.isEmpty ? 0 : int.parse(value);
                    });
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Assignments weight (%)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter assignments weight';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _assignmentsWeight = value.isEmpty ? 0 : int.parse(value);
                    });
                  },
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pop();
                  setState(() {});
                }
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _showAddGradeDialog(BuildContext context) {
    int gradeToAdd = 0;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add a Grade"),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        gradeToAdd = int.parse(value);
                      });
                    },
                  ),
                  ListTile(
                    title: Text('Exam'),
                    leading: Radio(
                      value: 0,
                      groupValue: _currentRadioValue,
                      onChanged: (int? value) {
                        setState(() {
                          _currentRadioValue = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Quiz'),
                    leading: Radio(
                      value: 1,
                      groupValue: _currentRadioValue,
                      onChanged: (int? value) {
                        setState(() {
                          _currentRadioValue = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Assignment'),
                    leading: Radio(
                      value: 2,
                      groupValue: _currentRadioValue,
                      onChanged: (int? value) {
                        setState(() {
                          _currentRadioValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _addGradeToCategory(gradeToAdd, _currentRadioValue);
                Navigator.of(context).pop();
                setState(() {});
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  double _calculateCurrentGrade() {
    double totalWeight =
        (_examsWeight + _quizzesWeight + _assignmentsWeight).toDouble();

    if (totalWeight == 0) {
      return 0;
    }

    double examsAvg = _average(_examsGrades);
    double quizzesAvg = _average(_quizzesGrades);
    double assignmentsAvg = _average(_assignmentsGrades);

    return (examsAvg * (_examsWeight / totalWeight)) +
        (quizzesAvg * (_quizzesWeight / totalWeight)) +
        (assignmentsAvg * (_assignmentsWeight / totalWeight));
  }

  double _average(List<int> grades) {
    if (grades.isEmpty) {
      return 0.0;
    }

    int sum = 0;
    for (int grade in grades) {
      sum += grade;
    }
    return sum / grades.length;
  }

  void _addGradeToCategory(int grade, int category) {
    switch (category) {
      case 0:
        _examsGrades.add(grade);
        break;
      case 1:
        _quizzesGrades.add(grade);
        break;
      case 2:
        _assignmentsGrades.add(grade);
        break;
    }
  }
}
