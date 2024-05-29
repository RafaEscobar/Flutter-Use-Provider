import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:use_provider/domain/providers/task_provider.dart';
import 'package:use_provider/domain/widgets/checkbox_widget.dart';
import 'package:use_provider/screens/screen_two.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context){
    final inputController = TextEditingController();
    final taskProvider = context.watch<TaskProvider>();
    final inputFocus = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uso de providers'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenTwo(),
              )
            );
          },
        ),
      ),
      body: Body(taskProvider: taskProvider, inputController: inputController, inputFocus: inputFocus,),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.taskProvider,
    required this.inputController,
    required this.inputFocus,
  });

  final TaskProvider taskProvider;
  final TextEditingController inputController;
  final FocusNode inputFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Header(),
          const SizedBox(height: 10,),
          ListItems(taskProvider: taskProvider),
          InputText(inputController: inputController, taskProvider: taskProvider, inputFocus: inputFocus,),
        ],
      ),
    );
  }
}

class InputText extends StatefulWidget {
  const InputText({
    super.key,
    required this.inputController,
    required this.taskProvider,
    required this.inputFocus,
  });

  final TextEditingController inputController;
  final TaskProvider taskProvider;
  final FocusNode inputFocus;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.inputFocus.requestFocus();
    });

  }
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: TextFormField(
        focusNode: widget.inputFocus,
        controller: widget.inputController,
        style: const TextStyle(
          color: Colors.blue,
        ),
        decoration: InputDecoration(
          enabledBorder: borderStyle,
          focusedBorder: borderStyle,
          hintText: 'Ingresa una nueva tarea',
          border: InputBorder.none,
          filled: true,
          suffixIcon: IconButton(
            onPressed: (){
              final inputValue = widget.inputController.value.text;
              widget.taskProvider.addTask(inputValue, false);
            },
            icon: const Icon(Icons.add),
          )
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({
    super.key,
    required this.taskProvider,
  });

  final TaskProvider taskProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(),
        child: ListView.builder(
          itemCount: taskProvider.tasks.length,
          itemBuilder: (context, index) {
            final task = taskProvider.tasks[index];
            return CheckboxWidget(task: task,);
          },
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Tareas del día',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 24,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}