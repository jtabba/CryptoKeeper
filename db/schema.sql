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


insert into announcements (title, image_url, content) values ('Bitcoin soars to new all-time high!', 'https://g.foolcdn.com/editorial/images/605256/bitcoin-price-chart-cryptocurrency-ethereum-ripple-getty.jpg', 'BITCOIN IS NOW SUPER DUPER EXPENSIVE WOWEEEE LOOK AT IT GO HSFSAJASBJASGJSAGSAJKBSJHGBSKGSKDGBSGBSBVSKBGSKJGJKEKJWKGFHWSKGWBJFWKFBWJKBFWJKBFWJKHFKJWEHWJKHFWJKWJHFJKWBFWKJBFJKWFBJKWENFKJANFLSNGWLKGLKWNGFKLWEBLGKNSLKNWLSEANFKBNFLKANFDLKBWLFLSJGBLSRKHBPSFKDNVLSKKNBVLKSBNLSKNGLKWNGLKSNVLK STONKS');