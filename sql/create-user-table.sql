CREATE DATABASE 'demo';
USE demo;

create table user (
	`user_id`  int(3) NOT NULL AUTO_INCREMENT,
	`username` varchar(120) NOT NULL,
	`email` varchar(220) NOT NULL,
	`password` varchar(120) NOT NULL,
	PRIMARY KEY (`user_id`)
);

create table book (
	`book_id` int(11) NOT NULL AUTO_INCREMENT,
	`title` varchar(120) NOT NULL,
	`author` varchar(50) NOT NULL,
	`price` float NOT NULL,
  `user_id` int(11) NOT NULL,
	PRIMARY KEY (`book_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
);