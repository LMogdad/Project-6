import 'package:flutter/material.dart';
import 'package:todo/services/supabase.dart';
import 'package:todo/widgets/catagory.dart';
import 'package:todo/widgets/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController taskController = TextEditingController();
  int selectedIndex = 0;
  List catagory = ["Work", "Personal", "Shopping", "Health"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Color(0xffbfc3ca)],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.menu_rounded),
                        SizedBox(
                          height: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset("assets\\profile.jpg"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 32, horizontal: 16),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff9ec4fb), Color(0xff88b2f1)],
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Manage your\ntime well",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.my_library_books,
                              color: Colors.white,
                              size: 75,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Category",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Catagory(
                        onTap: () {
                          selectedIndex = 0;
                          setState(() {});
                        },
                        icon: Icons.work,
                        text: catagory[0],
                        color: const Color(0xff9bc5f9),
                        isSelected: selectedIndex == 0,
                      ),
                      Catagory(
                        onTap: () {
                          selectedIndex = 1;
                          setState(() {});
                        },
                        icon: Icons.person_4_rounded,
                        text: catagory[1],
                        color: const Color(0xfff4bf8d),
                        isSelected: selectedIndex == 1,
                      ),
                      Catagory(
                        onTap: () {
                          selectedIndex = 2;
                          setState(() {});
                        },
                        icon: Icons.shopping_cart,
                        text: catagory[2],
                        color: const Color(0xffb0d6a7),
                        isSelected: selectedIndex == 2,
                      ),
                      Catagory(
                        onTap: () {
                          selectedIndex = 3;
                          setState(() {});
                        },
                        icon: Icons.favorite,
                        text: catagory[3],
                        color: const Color(0xfff38ea8),
                        isSelected: selectedIndex == 3,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Your Tasks",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  FutureBuilder(
                    future: getTasks(selectedIndex + 1),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                            physics: const ScrollPhysics(
                                parent: NeverScrollableScrollPhysics()),
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              return Task(
                                onTap: () {
                                  checkTask(!snapshot.data![index].isCompleted!,
                                      snapshot.data![index].id!);
                                  setState(() {});
                                },
                                id: snapshot.data![index].id!,
                                text: snapshot.data![index].task!,
                                isCompleted: snapshot.data![index].isCompleted!,
                                onPressedDelete: () {
                                  deleteTask(snapshot.data![index].id!);
                                  setState(() {});
                                },
                              );
                            }),
                            separatorBuilder: (context, index) {
                              return Divider(
                                height: 4,
                                color: Colors.white.withOpacity(0.4),
                              );
                            },
                            itemCount: snapshot.data!.length);
                      } else {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: CircularProgressIndicator(
                              color: Color(0xff8eabe0),
                            ),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.task_rounded),
                      prefixIconColor: const Color(0xff9bc5f9),
                      hintText: "Enter Task",
                      hintStyle: const TextStyle(color: Color(0xff9bc5f9)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff9bc5f9),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff9bc5f9),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Catagory(
                      onTap: () {
                        addTask(taskController.text, 1);
                        Navigator.pop(context);
                        taskController.text = '';
                        setState(() {});
                      },
                      icon: Icons.work,
                      text: "Add ${catagory[0]}",
                      color: const Color(0xff9bc5f9),
                    ),
                    Catagory(
                      onTap: () {
                        addTask(taskController.text, 2);
                        Navigator.pop(context);
                        taskController.text = '';
                        setState(() {});
                      },
                      icon: Icons.person_4_rounded,
                      text: "Add ${catagory[1]}",
                      color: const Color(0xfff4bf8d),
                    ),
                    Catagory(
                      onTap: () {
                        addTask(taskController.text, 3);
                        Navigator.pop(context);
                        taskController.text = '';
                        setState(() {});
                      },
                      icon: Icons.shopping_cart,
                      text: "Add ${catagory[2]}",
                      color: const Color(0xffb0d6a7),
                    ),
                    Catagory(
                      onTap: () {
                        addTask(taskController.text, 4);
                        Navigator.pop(context);
                        taskController.text = '';
                        setState(() {});
                      },
                      icon: Icons.favorite,
                      text: "Add ${catagory[3]}",
                      color: const Color(0xfff38ea8),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        backgroundColor: const Color(0xff8eabe0),
        elevation: 0,
        child: const Icon(Icons.add_task_rounded),
      ),
    );
  }
}
