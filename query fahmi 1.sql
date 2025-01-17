SELECT version();

CREATE TABLE `user` (
    `user_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `email` VARCHAR(50) NOT NULL DEFAULT '',
    `password` VARCHAR(50) NOT NULL DEFAULT '',
    PRIMARY KEY(`user_id`)
);
desc user;

CREATE TABLE `singer` (
    `singer_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    PRIMARY KEY (`singer_id`)
);


desc singer;

CREATE TABLE `album` (
    `album_id` INT(10) NOT NULL,
    `name` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
    PRIMARY KEY(`album_id`) USING BTREE
);
desc album;

CREATE TABLE `track` (
    `track_id` INT(10) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
    `singer` INT(10) NOT NULL,
    `album` INT(10) NOT NULL,
    PRIMARY KEY(`track_id`),
    CONSTRAINT `fk_album` FOREIGN KEY (`album`) REFERENCES `sql12617746`.`album`(`album_id`) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `fk_singer` FOREIGN KEY (`singer`) REFERENCES `sql12617746`.`singer`(`singer_id`) ON UPDATE CASCADE ON DELETE CASCADE
);


desc track;

CREATE TABLE `playlist` (
    `playlist_id` INT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`playlist_id`),
    CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON UPDATE CASCADE ON DELETE CASCADE
);
desc playlist;

CREATE TABLE `playlist_track` (
    `playlist_id` INT NOT NULL,
    `track_id` INT NOT NULL,
    CONSTRAINT `fk_playlist` FOREIGN KEY (`playlist_id`) REFERENCES `playlist`(`playlist_id`) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `fk_track` FOREIGN KEY (`track_id`) REFERENCES `track`(`track_id`) ON UPDATE CASCADE ON DELETE CASCADE
);
desc playlist_track;