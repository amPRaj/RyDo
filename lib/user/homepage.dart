import 'package:eride/user/Profileuser.dart';
import 'package:eride/user/homepageH.dart';
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';



class Message {
  final String sender;
  final String content;
  final bool isMe;

  Message({
    required this.sender,
    required this.content,
    required this.isMe,
  });
}

class Payment {
  final String description;
  final DateTime date;
  final double amount;
  final bool isDebited;

  Payment({
    required this.description,
    required this.date,
    required this.amount,
    required this.isDebited,
  });
}

class Homeuser extends StatefulWidget {
  const Homeuser({super.key});

  @override
  _HomeuserState createState() => _HomeuserState();
}


class _HomeuserState extends State<Homeuser> {
  final String userPhotoUrl = 'https://example.com/user_photo.jpg';


  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    Widget currentPage;
    switch (_currentIndex) {
      case 0:
        currentPage = _buildHomePage();
        break;
      case 1:
        currentPage = _buildMessagePage();
        break;
      case 2:
        currentPage = _buildPaymentPage();
        break;
      case 3:
        currentPage = _buildProfilePage();
        break;
      default:
        currentPage = _buildHomePage();
    }

    return Scaffold(
  backgroundColor: Colors.white,
  body: currentPage,
  bottomNavigationBar: SafeArea( // Prevents overflow
    child: Container(
      height: 110, // Set a fixed height
      child: FloatingNavbar(
        backgroundColor: Colors.black,
        onTap: _onTap,
        currentIndex: _currentIndex,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Message'),
          FloatingNavbarItem(icon: Icons.payment_outlined, title: 'Payment'),
          FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    ),
  ),
);

  }

  Widget _buildHomePage() {
    return homepage();
  }

  Widget _buildMessagePage() {
    List<Chat> chats = [
      Chat(name: 'John Doe', message: 'Hello!', timestamp: '10:00 AM'),
      Chat(
          name: 'Jane Smith',
          message: 'Hi, how are you?',
          timestamp: '11:30 AM'),
      Chat(
          name: 'David Johnson',
          message: 'Good morning!',
          timestamp: 'Yesterday'),
    ];

    return SafeArea(
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
              NetworkImage('https://example.com/${chat.name}_photo.jpg'),
            ),
            title: Text(chat.name),
            subtitle: Text(chat.message),
            trailing: Text(chat.timestamp),
            onTap: () {
              // Navigate to the chat section
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatSection(chat: chat),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildPaymentPage() {
    final List<Payment> paymentHistory = [
      Payment(
        description: 'Payment 1',
        date: DateTime.now(),
        amount: 20.0,
        isDebited: true,
      ),
      Payment(
        description: 'Payment 2',
        date: DateTime.now(),
        amount: 15.0,
        isDebited: false,
      ),
      Payment(
        description: 'Payment 3',
        date: DateTime.now(),
        amount: 30.0,
        isDebited: true,
      ),
    ];

    List<Payment> filteredPayments =
        paymentHistory; // Initialize with all payments
    bool? isDebitedFilter; // Selected filter option

    // Filter logic
    void filterPayments(bool? isDebited) {
      setState(() {
        isDebitedFilter = isDebited;
        filteredPayments = isDebited == null
            ? paymentHistory
            : paymentHistory
            .where((payment) => payment.isDebited == isDebited)
            .toList();
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Wallet',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(Icons.account_balance_wallet),
          title: Text('Balance: \$100'),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Payment History',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<bool?>(
                value: isDebitedFilter,
                hint: const Text('Filter'),
                items: const [
                  DropdownMenuItem<bool?>(
                    value: null,
                    child: Text('All'),
                  ),
                  DropdownMenuItem<bool?>(
                    value: true,
                    child: Text('Debited'),
                  ),
                  DropdownMenuItem<bool?>(
                    value: false,
                    child: Text('Credited'),
                  ),
                ],
                onChanged: (value) {
                  filterPayments(value);
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredPayments.length,
            itemBuilder: (context, index) {
              final payment = filteredPayments[index];
              final paymentType = payment.isDebited ? 'Debited' : 'Credited';
              final paymentAmount = payment.isDebited
                  ? '-\$${payment.amount}'
                  : '+\$${payment.amount}';
              final paymentColor =
              payment.isDebited ? Colors.red : Colors.purpleAccent;
              return ListTile(
                title: Text(payment.description),
                subtitle: Text('Date: ${payment.date.toString()}'),
                trailing: Text(
                  '$paymentType: $paymentAmount',
                  style: TextStyle(
                    color: paymentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }


  Widget _buildProfilePage() {
    return const ProfileUser();
  }
}
class Chat {
  final String name;
  final String message;
  final String timestamp;

  Chat({required this.name, required this.message, required this.timestamp});
}

List<Message> messages = [
  Message(
    sender: 'User',
    content: 'Hello!',
    isMe: true,
  ),
  Message(
    sender: 'Driver',
    content: 'Hi there!',
    isMe: false,
  ),
  Message(
    sender: 'User',
    content: 'How are you?',
    isMe: true,
  ),
  Message(
    sender: 'Driver',
    content: 'I\'m good. Thanks for asking!',
    isMe: false,
  ),
];

class ChatSection extends StatelessWidget {
  final Chat chat;

  const ChatSection({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.purpleAccent),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(chat.name, style: const TextStyle(color: Colors.purpleAccent)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: message.isMe
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: message.isMe ? Colors.blue : Colors.grey[200],
                        ),
                        child: Text(
                          message.content,
                          style: TextStyle(
                            color: message.isMe ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for sending the message here
                  },
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


