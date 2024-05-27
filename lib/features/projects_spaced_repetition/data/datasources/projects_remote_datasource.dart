import 'package:spaced_repetition_app/core/data/datasources/datasource.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

import '../../../../core/data/models/project_model.dart';

class ProjectsRemoteDataSource extends DataSource<ProjectModel> {
  static const _databaseName = "example.db";
  static const _databaseVersion = 1;
  static const table = 'projects';
  static const columnId = 'rowid';
  static const columnName = 'name';
  static const columns = [columnId, columnName];


  ProjectsRemoteDataSource._privateConstructor();
  static final ProjectsRemoteDataSource instance = ProjectsRemoteDataSource._privateConstructor();


  static late Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }


  _initDatabase() async {
    String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }


  Future _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE IF NOT EXISTS $table ($columnName TEXT NOT NULL)"
    );
  }


  @override
  Future<ProjectModel> insert(ProjectModel newEntry) async {
    Database db = await instance.database;
    int newProjectId = await db.insert(
      table, 
      newEntry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    ProjectModel newProject = ProjectModel(
      name: newEntry.name, 
      id: newProjectId
    );

    return newProject;
  }


  @override
  Future<List<ProjectModel>> queryAllRows() async {
    Database db = await instance.database;
    final List<Map<String, Object?>> result = await db.query(table, columns: columns);
    var projectsList = result.map(
      (projectRaw) => ProjectModel(
          id: projectRaw["rowid"] as int,
          name: projectRaw["name"] as String,
        )
    );

    return projectsList.toList();
  }


  @override
  Future<ProjectModel> update(ProjectModel newEntry) async {
    Database db = await instance.database;
    int id = newEntry.id;
    await db.update(
      table, 
      newEntry.toMap(), 
      where: '$columnId = ?', 
      whereArgs: [id]
    );

    return newEntry;
  }


  @override
  Future<int> delete(ProjectModel newEntry) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [newEntry.id]);
  }
}