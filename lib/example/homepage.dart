import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   bool isSelected =false;

   void _changed(bool visible, String anser){
     setState(() {
       if(anser =='tag'){
         isSelected = visible;
       }

     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Pay',
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
        actions: [
         isSelected? IconButton(onPressed: (){
           _changed(false, 'tag');
         },
              icon: const Icon(Icons.cancel_outlined,
                color: Colors.deepPurple,))

             :IconButton(onPressed: (){
               _changed(true, 'tag');
         },
             icon:const  Icon(Icons.search,
               color: Colors.deepPurple,))


        ],
      ),
      body:  Container(
        padding:const  EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           isSelected? Container(
              padding: const EdgeInsets.all(10),
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  label: Text('Search',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontStyle: FontStyle.italic,
                  ),
                  ),
                ),
              ),
            ): Container(),
             const SizedBox(height: 10,),

             Card(
               color: Colors.white,
              shadowColor: Colors.black45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     const Text('Send to Beneficiary',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Container(
                        height: 40,
                        width: 80,
                        color: Colors.grey.shade200,
                        child: const Center(
                          child:  Text('Send',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                 const Text('Send money easy and smart',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
