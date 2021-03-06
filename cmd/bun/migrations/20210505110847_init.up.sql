CREATE TABLE users (
  id int8 PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  username varchar(500) NOT NULL,
  email varchar(500) NOT NULL,
  bio varchar(500),
  image varchar(500),
  password_hash varchar(500) NOT NULL
);

CREATE UNIQUE INDEX users_email_idx ON users (email);
CREATE UNIQUE INDEX users_username_idx ON users (username);

--bun:split

CREATE TABLE articles (
  id int8 PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  slug varchar(500),
  title varchar(500) NOT NULL,
  description varchar(500) NOT NULL,
  body text NOT NULL,
  author_id int8 NOT NULL REFERENCES users (id) ON DELETE CASCADE,

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

--bun:split

CREATE TABLE article_tags (
  article_id int8 NOT NULL REFERENCES articles (id) ON DELETE CASCADE,
  tag varchar(500)
);

CREATE UNIQUE INDEX article_tags_article_id_tag_idx
ON article_tags (article_id, tag);

--bun:split

CREATE TABLE favorite_articles (
  user_id int8 NOT NULL REFERENCES users (id) ON DELETE CASCADE,
  article_id int8 NOT NULL REFERENCES articles (id) ON DELETE CASCADE,

  PRIMARY KEY (user_id, article_id)
);

CREATE UNIQUE INDEX favorite_articles_user_id_article_id_idx
ON favorite_articles (user_id, article_id);

--bun:split

CREATE TABLE follow_users (
  user_id  int8 NOT NULL REFERENCES users (id) ON DELETE CASCADE,
  followed_user_id int8 NOT NULL REFERENCES users (id) ON DELETE CASCADE,

  PRIMARY KEY (user_id, followed_user_id)
);

CREATE UNIQUE INDEX follow_users_user_id_followed_user_id_idx
ON follow_users (user_id, followed_user_id);

--bun:split

CREATE TABLE comments (
  id int8 PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  author_id int8 NOT NULL REFERENCES users (id) ON DELETE CASCADE,
  article_id int8 NOT NULL REFERENCES articles (id) ON DELETE CASCADE,

  body text NOT NULL,

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
