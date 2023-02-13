use platform;
/*Task 1 */
SELECT users.fullname, amount
from donations
LEFT JOIN users ON donations.donator_id = users.user_id
LIMIT 1;

/*Task 2 */
Select users.fullname, amount
from donations
left join users on donations.donator_id=users.user_id
ORDER by amount DESC
limit 3;

/*Task 3 */
create database if not exists online_chat;
use online_chat;

CREATE TABLE users(
user_id int Primary key auto_increment,
fullname varchar(64),
email varchar(64),
is_blocked BOOL default false,
created_at datetime default current_timestamp);

INSERT INTO users (fullname, email)
values ('Anton Belov', 'abel@mail.ru'),
('Hans Rein', 'rein@gmail.com'),
('Anna Vogel', 'vogel@gmx.de'),
('Joerg Bluhm', 'bluhm@gmx.de'),
('Andre Steinbrink', 'andre@web.de');

SELECT * from users;

CREATE TABLE chats(
chat_id int Primary key auto_increment,
user_id integer,	
message_id integer,
foreign key (user_id) references users(user_id),
foreign key (message_id) references messages (message_id),
created_at datetime default current_timestamp);

SELECT * from chats;

CREATE TABLE messages(
message_id int Primary key auto_increment,
user_id integer,	
text varchar(256),
FOREIGN KEY (user_id) REFERENCES users(user_id),
created_at datetime default current_timestamp);

CREATE TABLE reactions(
reaction_id int Primary key auto_increment,
text varchar(256),
user_id integer,	
message_id integer,
foreign key (user_id) references users(user_id),
foreign key (message_id) references messages(message_id),
created_at datetime default current_timestamp);

SELECT * from messages;
SELECT * from reactions;




