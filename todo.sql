todolistdb=# CREATE TABLE todos(
id SERIAL PRIMARY KEY,
title VARCHAR(255) NOT NULL,
details TEXT NULL,
priority INTEGER NOT NULL DEFAULT 1,
created_at timestamp NOT NULL,
completed_at timestamp
);
CREATE TABLE
todolistdb=# \dt;
         List of relations
 Schema | Name  | Type  |  Owner
--------+-------+-------+----------
 public | todos | table | tylermay
(1 row)

todolistdb=# INSERT INTO todos(title,details,priority) VALUES('Feed Dog','Wah car','Bath baby','Kiss wife','Drink beer');
ERROR:  INSERT has more expressions than target columns
LINE 1: ...priority) VALUES('Feed Dog','Wah car','Bath baby','Kiss wife...
                                                             ^
todolistdb=# INSERT INTO todos(title,details,priority) VALUES('Feed Dog','Put food in bowl',1);
ERROR:  null value in column "created_at" violates not-null constraint
DETAIL:  Failing row contains (1, Feed Dog, Put food in bowl, 1, null, null).
todolistdb=# INSERT INTO todos(title,details,priority,created_at) VALUES('Feed Dog','Put food in bowl',1,current_timestamp);
INSERT 0 1
todolistdb=# select * from todos;
 id |  title   |     details      | priority |         created_at         | completed_at
----+----------+------------------+----------+----------------------------+--------------
  2 | Feed Dog | Put food in bowl |        1 | 2017-09-05 13:53:49.784062 |
(1 row)

todolistdb=# INSERT INTO todos(title,details,priority,created_at) VALUES('Play with Zoe','Take her to the park',2,current_timestamp);
INSERT 0 1
todolistdb=# select * from todos;
 id |     title     |       details        | priority |         created_at         | completed_at
----+---------------+----------------------+----------+----------------------------+--------------
  2 | Feed Dog      | Put food in bowl     |        1 | 2017-09-05 13:53:49.784062 |
  3 | Play with Zoe | Take her to the park |        2 | 2017-09-05 13:57:49.337514 |
(2 rows)

todolistdb=# INSERT INTO todos(title,details,priority,created_at) VALUES('Wash the car','Use new soap',3,current_timestamp);
INSERT 0 1
todolistdb=# select * from todos;
 id |     title     |       details        | priority |         created_at         | completed_at
----+---------------+----------------------+----------+----------------------------+--------------
  2 | Feed Dog      | Put food in bowl     |        1 | 2017-09-05 13:53:49.784062 |
  3 | Play with Zoe | Take her to the park |        2 | 2017-09-05 13:57:49.337514 |
  4 | Wash the car  | Use new soap         |        3 | 2017-09-05 13:58:27.319026 |
(3 rows)

todolistdb=# INSERT INTO todos(title,details,priority,created_at) VALUES('Kiss the wife','Put your lips to hers',4,current_timestamp);
INSERT 0 1
todolistdb=# select * from todos;
 id |     title     |        details        | priority |         created_at         | completed_at
----+---------------+-----------------------+----------+----------------------------+--------------
  2 | Feed Dog      | Put food in bowl      |        1 | 2017-09-05 13:53:49.784062 |
  3 | Play with Zoe | Take her to the park  |        2 | 2017-09-05 13:57:49.337514 |
  4 | Wash the car  | Use new soap          |        3 | 2017-09-05 13:58:27.319026 |
  5 | Kiss the wife | Put your lips to hers |        4 | 2017-09-05 13:59:21.805336 |
(4 rows)

todolistdb=# INSERT INTO todos(title,details,priority,created_at) VALUES('Drink beer','Put beer in your mouth and swallon',5,current_timestamp);
INSERT 0 1
todolistdb=# select * from todos;
 id |     title     |              details               | priority |         created_at         | completed_at
----+---------------+------------------------------------+----------+----------------------------+--------------
  2 | Feed Dog      | Put food in bowl                   |        1 | 2017-09-05 13:53:49.784062 |
  3 | Play with Zoe | Take her to the park               |        2 | 2017-09-05 13:57:49.337514 |
  4 | Wash the car  | Use new soap                       |        3 | 2017-09-05 13:58:27.319026 |
  5 | Kiss the wife | Put your lips to hers              |        4 | 2017-09-05 13:59:21.805336 |
  6 | Drink beer    | Put beer in your mouth and swallon |        5 | 2017-09-05 14:00:12.307691 |
(5 rows)

todolistdb=# INSERT INTO todos(title,details,priority,completed_at) VALUES('Drink beer','Put beer in your mouth and swallon',5,current_timestamp);
ERROR:  null value in column "created_at" violates not-null constraint
DETAIL:  Failing row contains (7, Drink beer, Put beer in your mouth and swallon, 5, null, 2017-09-05 14:05:18.233796).
todolistdb=# INSERT INTO todos(title,details,priority,completed_at) VALUES('Drink beer','Put beer in your mouth and swallon',5);
ERROR:  INSERT has more target columns than expressions
LINE 1: INSERT INTO todos(title,details,priority,completed_at) VALUE...
todolistdb=# INSERT INTO todos(title,details,priority,completed_at) VALUES('Drink beer','Put beer in your mouth and swallon',5,current_timestamp); ERROR:  null value in column "created_at" violates not-null constraint
DETAIL:  Failing row contains (8, Drink beer, Put beer in your mouth and swallon, 5, null, 2017-09-05 14:06:40.343548).
todolistdb=# INSERT INTO todos(title,details,priority,created_at,completed_at) VALUES('Drink beer','Put beer in your mouth and swallon',5,current_timestamp);
ERROR:  INSERT has more target columns than expressions
LINE 1: ...SERT INTO todos(title,details,priority,created_at,completed_...
                                                             ^
todolistdb=# UPDATE INFO = UPDATE todos SET completed_at = current_timestamp;
ERROR:  syntax error at or near "="
LINE 1: UPDATE INFO = UPDATE todos SET completed_at = current_timest...
                    ^
todolistdb=# UPDATE INFO = UPDATE todos SET completed_at = current_timestamp WHERE todoid = 6;
ERROR:  syntax error at or near "="
LINE 1: UPDATE INFO = UPDATE todos SET completed_at = current_timest...
                    ^
todolistdb=# UPDATE todos SET completed_at = current_timestamp WHERE todoid = 6;
ERROR:  column "todoid" does not exist
LINE 1: ... todos SET completed_at = current_timestamp WHERE todoid = 6...
                                                             ^
todolistdb=# UPDATE todos SET completed_at = current_timestamp WHERE todoid = 5;
ERROR:  column "todoid" does not exist
LINE 1: ... todos SET completed_at = current_timestamp WHERE todoid = 5...
                                                             ^
todolistdb=# UPDATE todos SET completed_at = current_timestamp WHERE todoid = 6 IS NULL;
ERROR:  column "todoid" does not exist
LINE 1: ... todos SET completed_at = current_timestamp WHERE todoid = 6...
                                                             ^
todolistdb=# UPDATE todos SET completed_at = current_timestamp WHERE todoid = 6;
ERROR:  column "todoid" does not exist
LINE 1: ... todos SET completed_at = current_timestamp WHERE todoid = 6...
                                                             ^
todolistdb=# UPDATE todos SET completed_at = current_timestamp WHERE id = 6;
UPDATE 1
todolistdb=# select * from todos;
 id |     title     |              details               | priority |         created_at         |        completed_at
----+---------------+------------------------------------+----------+----------------------------+----------------------------
  2 | Feed Dog      | Put food in bowl                   |        1 | 2017-09-05 13:53:49.784062 |
  3 | Play with Zoe | Take her to the park               |        2 | 2017-09-05 13:57:49.337514 |
  4 | Wash the car  | Use new soap                       |        3 | 2017-09-05 13:58:27.319026 |
  5 | Kiss the wife | Put your lips to hers              |        4 | 2017-09-05 13:59:21.805336 |
  6 | Drink beer    | Put beer in your mouth and swallon |        5 | 2017-09-05 14:00:12.307691 | 2017-09-05 14:18:27.360266
(5 rows)

todolistdb=# SELECT title FROM completed_at WHERE current_timestamp IS NULL;
ERROR:  relation "completed_at" does not exist
LINE 1: SELECT title FROM completed_at WHERE current_timestamp IS NU...
                          ^
todolistdb=# SELECT title FROM todos WHERE completed_at IS NULL;
     title
---------------
 Feed Dog
 Play with Zoe
 Wash the car
 Kiss the wife
(4 rows)

todolistdb=# SELECT title FROM todos WHERE priority > 1;
     title
---------------
 Play with Zoe
 Wash the car
 Kiss the wife
 Drink beer
(4 rows)

todolistdb=# UPDATE todos SET completed_at = current_timestamp WHERE id = 3;
UPDATE 1
todolistdb=# select * from todos
todolistdb-# select * from todos;
ERROR:  syntax error at or near "select"
LINE 2: select * from todos;
        ^
todolistdb=# SELECT * FROM todos;
 id |     title     |              details               | priority |         created_at         |        completed_at
----+---------------+------------------------------------+----------+----------------------------+----------------------------
  2 | Feed Dog      | Put food in bowl                   |        1 | 2017-09-05 13:53:49.784062 |
  4 | Wash the car  | Use new soap                       |        3 | 2017-09-05 13:58:27.319026 |
  5 | Kiss the wife | Put your lips to hers              |        4 | 2017-09-05 13:59:21.805336 |
  6 | Drink beer    | Put beer in your mouth and swallon |        5 | 2017-09-05 14:00:12.307691 | 2017-09-05 14:18:27.360266
  3 | Play with Zoe | Take her to the park               |        2 | 2017-09-05 13:57:49.337514 | 2017-09-05 14:39:22.473012
(5 rows)

todolistdb=# ^Z
[4]+  Stopped                 psql todolistdb
Tylers-MBP:/ tylermay$ 
