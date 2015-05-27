Drop table videos;


CREATE TABLE videos(
  id serial8 primary key, 
  title varchar(225),
  description text,
  url varchar(225),
  genre varchar(30)
);

insert into videos (title, description, url, genre) values ('Blank Space', 'Taylor Swift music video', 'e-ORhEE9VVg', 'pop');

  insert into videos (title, description, url, genre) values ('Shake It Off', 'Taylor Swift music video,shaky shaky', 'nfWlot6h_JM', 'pop');

    insert into videos (title, description, url, genre) values ('Roar', 'Katy Perry music video', 'CevxZvSJLk8', 'pop');