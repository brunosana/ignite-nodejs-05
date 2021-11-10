create table genres(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	title varchar(100) not null unique,
	created_at TIMESTAMP NOT NULL DEFAULT now(),
	updated_at TIMESTAMP NOT NULL DEFAULT now(),
	CONSTRAINT "PK_123" PRIMARY KEY ("id")
);

create table orders(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	userId uuid not null,
	created_at TIMESTAMP NOT NULL DEFAULT now(),
	updated_at TIMESTAMP NOT NULL DEFAULT now(),
	CONSTRAINT "PK_456" PRIMARY KEY ("id")
);

ALTER TABLE orders ADD CONSTRAINT FK_order_user FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE ON UPDATE NO action;

create table game_order(
	gameId uuid not null,
	orderId uuid not null,
	CONSTRAINT "PK_orders" PRIMARY KEY (gameId, orderId)
);

ALTER TABLE game_order ADD CONSTRAINT "FK_game_order" FOREIGN KEY (gameId) REFERENCES games(id) ON DELETE CASCADE ON UPDATE NO action;
ALTER TABLE game_order ADD CONSTRAINT "FK_game_order_2" FOREIGN KEY (orderId) REFERENCES orders(id) ON DELETE CASCADE ON UPDATE NO action;

create table game_genre(
	gameId uuid not null,
	genreId uuid not null,
	CONSTRAINT "PK_game_genre" PRIMARY KEY (gameId, genreId)
);

ALTER TABLE game_genre ADD CONSTRAINT "FK_game_genre" FOREIGN KEY (gameId) REFERENCES games(id) ON DELETE CASCADE ON UPDATE NO action;
ALTER TABLE game_genre ADD CONSTRAINT "FK_game_genre_2" FOREIGN KEY (genreId) REFERENCES genres(id) ON DELETE CASCADE ON UPDATE NO action;
