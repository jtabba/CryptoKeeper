CREATE DATABASE cryptokeeper;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT,
    user_name TEXT,
    password_digest TEXT
);

CREATE TABLE announcements (
    id SERIAL PRIMARY KEY,
    title TEXT,
    image_url TEXT,
    content TEXT
);

CREATE TABLE forumdata (
    id SERIAL PRIMARY KEY,
    title TEXT,
    content TEXT,
);