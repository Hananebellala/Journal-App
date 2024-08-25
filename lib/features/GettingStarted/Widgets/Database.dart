import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Database? _database; //init null

  Future<Database> get database async {
    //getter that returns the database and initialiaze it if nessec
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        password TEXT,
        profilePic TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE journal (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER,
        date TEXT,
        title TEXT,
        text TEXT,
        pictures TEXT,
        category TEXT,
        FOREIGN KEY (userId) REFERENCES user (id)
        
      )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 3) {
      await db.execute('''
        ALTER TABLE user ADD COLUMN profilePic TEXT
      ''');
    }
    // Handle other upgrades if necessary
  }

  

}



Future<void> deleteDatabaseFile() async {
  try {
    // Define the path to the database file
    String path = join(await getDatabasesPath(), 'user_database.db');
    
    // Delete the database file
    await deleteDatabase(path);
    print('Database deleted successfully.');
  } catch (e) {
    print('Error deleting database: $e');
  }
}

class User {
  int? id;
  String name;
  String password;
  String? profilePic;

  User({this.id, required this.name, required this.password, this.profilePic});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'profilePic': profilePic,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      password: map['password'],
      profilePic: map['profilePic'],
    );
  }
}

class Journal {
  int? id;
  int userId;
  String date;
  String title;
  String text;
  String pictures;
  String category;

  Journal(
      {required this.id,
      required this.userId,
      required this.date,
      required this.title,
      required this.text,
      required this.pictures,
      required this.category});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'date': date,
      'title': title,
      'text': text,
      'pictures': pictures,
      'category': category
    };
  }

  factory Journal.fromMap(Map<String, dynamic> map) {
    return Journal(
        id: map['id'],
        userId: map['userId'],
        date: map['date'],
        title: map['title'],
        text: map['text'],
        pictures: map['pictures'],
        category: map['category']);
  }
}

class UserDao {
  final DatabaseHelper _databaseHelper = DatabaseHelper();





  Future<int> createUser(User user) async {
    final db = await _databaseHelper.database;
    return await db.insert('user', user.toMap());
  }


  Future<User?> getUser(int id) async {
    final db = await _databaseHelper.database;
    List<Map<String, dynamic>> maps = await db.query(
      'user',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<int> updateUser(User user) async {
    final db = await _databaseHelper.database;
    return await db.update(
      'user',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await _databaseHelper.database;
    return await db.delete(
      'user',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class JournalDao {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<int> createJournal(Journal journal) async {
    final db = await _databaseHelper.database;
    return await db.insert('journal', journal.toMap());
  }

  /*Future<List<Journal>> getJournals(int userId) async {
    final db = await _databaseHelper.database;
    List<Map<String, dynamic>> maps = await db.query(
      'journal',
      where: 'userId = ?',
      whereArgs: [userId],
    );

    return List.generate(maps.length, (i) {
      return Journal.fromMap(maps[i]);
    });
  }*/

  Future<Journal?> getJournal(int id) async {
    final db = await _databaseHelper.database;
    List<Map<String, dynamic>> maps =
        await db.query('journal', where: 'id = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Journal.fromMap(maps.first);
    }
    return null;
  }

  Future<int> updateJournal(Journal journal) async {
    final db = await _databaseHelper.database;
    return await db.update('journal', journal.toMap(),
        where: 'id=?', whereArgs: [journal.id]);
  }

  Future<int> deleteJournal(int id) async {
    final db = await _databaseHelper.database;
    return await db.delete('journal', where: 'id=?', whereArgs: [id]);
  }
}
