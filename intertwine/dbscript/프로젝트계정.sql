CREATE USER C##intertwine IDENTIFIED BY intertwine;
GRANT CONNECT, RESOURCE TO c##intertwine;
GRANT CREATE VIEW TO c##intertwine;
ALTER USER c##intertwine
QUOTA 1024M ON USERS;
GRANT CREATE ANY JOB TO c##intertwine;