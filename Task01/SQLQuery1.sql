create schema Film;
go
--actor table
create table Movie.Film.actor(
act_id int primary key,
act_fname char(20),
act_lname char(20),
act_gender char(1),
);
--movie table
create table Film.movie(
mov_id int primary key ,
mov_title char(50),
mov_year int ,
mov_time int,
mov_lang char(50),
mov_dt_rel date ,
mov_rel_country char(5)
);
--dirictor table 
create table Film.director(
dir_id int primary key ,
dir_fname char(20),
dir_lname char(20)
);
--reviewer table
create table Film.reviewer(
rev_id int primary key,
rev_name char(30)
);
--genres table 
create table Film.genres(
gen_id int primary key,
gen_title char(20)
);
--movie_cast table
create table Film.movie_cast(
act_id int,
mov_id int,
role char(30),
primary key (act_id ,mov_id ),
FOREIGN KEY (act_id) 
        REFERENCES Film.actor (act_id),

FOREIGN KEY (mov_id) 
        REFERENCES Film.movie (mov_id)
);
--move_dirictor table
create table Film.movie_direction(
dir_id int ,
mov_id int,
primary key (dir_id ,mov_id ),
FOREIGN KEY (dir_id) 
        REFERENCES Film.director (dir_id),

FOREIGN KEY (mov_id) 
        REFERENCES Film.movie (mov_id)

);
--movie_genres table
create table Film.movie_genres(
mov_id int ,
gen_id int ,
primary key (mov_id ,gen_id ),
FOREIGN KEY (gen_id) 
        REFERENCES Film.genres (gen_id),

FOREIGN KEY (mov_id) 
        REFERENCES Film.movie (mov_id)
);
--rating table 
create table Film.rating(
mov_id int ,
rev_id int ,
rev_stars int ,
num_o_ratings int ,
primary key (mov_id ,rev_id ),
FOREIGN KEY (mov_id) 
        REFERENCES Film.movie (mov_id),
FOREIGN KEY (rev_id) 
        REFERENCES Film.reviewer (rev_id)
);