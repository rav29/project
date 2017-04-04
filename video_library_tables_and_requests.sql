CREATE DATABASE video_library;
USE video_library;

CREATE TABLE users (id INT AUTO_INCREMENT, user_name VARCHAR(60), password VARCHAR(10), 
					email VARCHAR(40), PRIMARY KEY(id));
                    
CREATE TABLE crew_members (id INT AUTO_INCREMENT, member_name VARCHAR(60), 
					birth_date DATE, PRIMARY KEY(id));
                    
CREATE TABLE films (id INT AUTO_INCREMENT, film_name VARCHAR(40), actor_id INT, 
					director_id INT, release_date DATE, 
					country VARCHAR(40), genere VARCHAR(20), PRIMARY KEY(id), 
                    FOREIGN KEY (actor_id) REFERENCES crew_members(id),
					FOREIGN KEY (director_id) REFERENCES crew_members(id));

CREATE TABLE reviews (id INT AUTO_INCREMENT, film_id INT, user_id INT, text TEXT, mark INT,  PRIMARY KEY(id),
					FOREIGN KEY (user_id) REFERENCES users(id),
                    FOREIGN KEY (film_id) REFERENCES films(id));

CREATE TABLE films_crew_members (film_id INT, crew_member_id INT, 
								PRIMARY KEY(film_id, crew_member_id),
								FOREIGN KEY (film_id) REFERENCES films(id),
                                FOREIGN KEY (crew_member_id) REFERENCES crew_members(id));
                                
CREATE TABLE films_reviews (film_id INT, review_id INT, PRIMARY KEY(film_id, review_id),
							FOREIGN KEY (film_id) REFERENCES films(id),
                            FOREIGN KEY (review_id) REFERENCES reviews(id));
                            
CREATE TABLE users_reviews (user_id INT, review_id INT, PRIMARY KEY (user_id, review_id),
							FOREIGN KEY (user_id) REFERENCES users(id),
                            FOREIGN KEY (review_id) REFERENCES reviews(id));
                            
INSERT INTO users (user_name, password, email) VALUES ('Иван Иванов', '123456q', 'mail@mail.ru');

INSERT INTO	crew_members (member_name, birth_date) VALUES ('Юрий Никулин', '1921-01-01');
INSERT INTO	crew_members (member_name, birth_date) VALUES ('Леонид Гайдай', '1920-02-02');

INSERT INTO films (film_name, actor_id, director_id, release_date, country, genere)
			VALUES('Ы', 1, 2, '1965-04-15', 'СССР', 'комедия');
            
INSERT INTO reviews (film_id, user_id, text, mark)VALUES(1, 1, 'lol', 10);

INSERT INTO films_crew_members (film_id, crew_member_id) VALUES(1, 1);
INSERT INTO films_crew_members (film_id, crew_member_id) VALUES(1, 2);

INSERT INTO films_reviews (film_id, review_id)VALUES(1,1);

INSERT INTO users_reviews (user_id, review_id)VALUES(1,1);


/*1 - просмотр всех фильмов вышедших в определенном году*/
SELECT films.film_name FROM films WHERE year(films.release_date)  = '1965';

/*2 - просмотр актеров, снимавшихся в выбранном фильме*/
SELECT cm.member_name  FROM crew_members AS cm
					JOIN films_crew_members AS fcm ON cm.id = fcm.crew_member_id
                    JOIN films AS f ON fcm.film_id = 1;
                    
/*3 - просмотр всех отзывов о выбранном фильме*/
SELECT r.text FROM reviews AS r
					JOIN films_reviews AS fr ON fr.review_id = r.id
                    JOIN films AS f ON fr.film_id = 1;
                    
/*4 - просмотр всех фильмов в которых снимался выбранный актер*/
SELECT f.film_name FROM films AS f
					JOIN films_crew_members AS fcm ON fcm.film_id = f.id
                    JOIN crew_members AS cm ON fcm.crew_member_id =1;

/*5 - просмотр всех отзывов выбранного пользователя*/
SELECT r.text FROM reviews AS r
					JOIN users_reviews AS ur ON r.id = ur.review_id
                    JOIN users AS u ON ur.user_id = 1;