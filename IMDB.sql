mysql> create database IMDB_Database;
Query OK, 1 row affected (0.08 sec)

mysql> show IMDB_Database;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'IMDB_Database' at line 1
mysql> use IMDB_Database;
Database changed
mysql> create table movie(
    -> movie_id int PRIMARY KEY AUTO_INCREMENT,
    -> title varchar(200) NOT NULL,
    -> release_date DATE,
    -> duration int NOT NULL,
    -> description TEXT
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> show tables;
+-------------------------+
| Tables_in_imdb_database |
+-------------------------+
| movie                   |
+-------------------------+
1 row in set (0.05 sec)

mysql> desc movie;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| movie_id     | int          | NO   | PRI | NULL    | auto_increment |
| title        | varchar(200) | NO   |     | NULL    |                |
| release_date | date         | YES  |     | NULL    |                |
| duration     | int          | NO   |     | NULL    |                |
| description  | text         | YES  |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> create table media(
    -> media_id int primary key auto_increment,
    -> movie_id int not null,
    -> media_type varchar(50),
    -> media_url varchar(200),
    -> foreign key(movie_id) references movie(movie_id)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> desc media;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| media_id   | int          | NO   | PRI | NULL    | auto_increment |
| movie_id   | int          | NO   | MUL | NULL    |                |
| media_type | varchar(50)  | YES  |     | NULL    |                |
| media_url  | varchar(200) | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> create table genre(
    -> genre_id int primary key auto_increment,
    -> genre_name varchar(50)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> desc genre;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| genre_id   | int         | NO   | PRI | NULL    | auto_increment |
| genre_name | varchar(50) | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> create table movie_Genre(
    -> movie_id int not null,
    -> genre_id int not null,
    -> foreign key(movie_id) references movie(movie_id),
    -> foreign key(genre_id) references genre(genre_id)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> desc movie_Genre;
+----------+------+------+-----+---------+-------+
| Field    | Type | Null | Key | Default | Extra |
+----------+------+------+-----+---------+-------+
| movie_id | int  | NO   | MUL | NULL    |       |
| genre_id | int  | NO   | MUL | NULL    |       |
+----------+------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> create table user(
    -> user_id int primary key auto_increment,
    -> username varchar(50) not null,
    -> email varchar(20) not null,
    -> password varchar(20) not null
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> desc user;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| user_id  | int         | NO   | PRI | NULL    | auto_increment |
| username | varchar(50) | NO   |     | NULL    |                |
| email    | varchar(20) | NO   |     | NULL    |                |
| password | varchar(20) | NO   |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> create table review(
    -> review_id int primary key auto_increment,
    -> movie_id int not null,
    -> user_id int not null,
    -> rating decimal(2,1),
    -> comment text,
    -> foreign key(movie_id) references movie(movie_id),
    -> foreign key(user_id) references user(user_id)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> desc review;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| review_id | int          | NO   | PRI | NULL    | auto_increment |
| movie_id  | int          | NO   | MUL | NULL    |                |
| user_id   | int          | NO   | MUL | NULL    |                |
| rating    | decimal(2,1) | YES  |     | NULL    |                |
| comment   | text         | YES  |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> create table artist(
    -> artist_id int primary key auto_increment,
    -> artist_name varchar(50) not null
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> desc artist;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| artist_id   | int         | NO   | PRI | NULL    | auto_increment |
| artist_name | varchar(50) | NO   |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> create table skill(
    -> skill_id int primary key auto_increment,
    -> skill_name varchar(100) not null
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> desc skill;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| skill_id   | int          | NO   | PRI | NULL    | auto_increment |
| skill_name | varchar(100) | NO   |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> create table artist_Skill(
    -> artist_id int not null,
    -> skill_id int not null,
    -> foreign key(artist_id) references artist(artist_id),
    -> foreign key(skill_id) references skill(skill_id)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> desc artist_Skill;
+-----------+------+------+-----+---------+-------+
| Field     | Type | Null | Key | Default | Extra |
+-----------+------+------+-----+---------+-------+
| artist_id | int  | NO   | MUL | NULL    |       |
| skill_id  | int  | NO   | MUL | NULL    |       |
+-----------+------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> create table role(
    -> role_id int primary key auto_increment,
    -> role_name varchar(50)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> desc role;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| role_id   | int         | NO   | PRI | NULL    | auto_increment |
| role_name | varchar(50) | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> create table movie_Artist(
    -> movie_id int not null,
    -> artist_id int not null,
    -> role_id int not null,
    -> foreign key(movie_id) references movie(movie_id),
    -> foreign key(artist_id) references artist(artist_id),
    -> foreign key(role_id) references role(role_id)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> desc movie_Artist;
+-----------+------+------+-----+---------+-------+
| Field     | Type | Null | Key | Default | Extra |
+-----------+------+------+-----+---------+-------+
| movie_id  | int  | NO   | MUL | NULL    |       |
| artist_id | int  | NO   | MUL | NULL    |       |
| role_id   | int  | NO   | MUL | NULL    |       |
+-----------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> show tables;
+-------------------------+
| Tables_in_imdb_database |
+-------------------------+
| artist                  |
| artist_skill            |
| genre                   |
| media                   |
| movie                   |
| movie_artist            |
| movie_genre             |
| review                  |
| role                    |
| skill                   |
| user                    |
+-------------------------+
11 rows in set (0.00 sec)


