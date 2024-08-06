INSERT INTO FORM_TYPES(TYPE)
VALUES ('Вытянутая'),
       ('Сплюснутая'),
       ('Круглая'),
       ('Квардратная'),
       ('Прямоугольная');

INSERT INTO POINTS_GROUP(NAME, COUNT, DESCRIPTION, FORM_TYPES_ID)
VALUES ('Точки', 1000000, 'Загадочные', 31),
     ('Песчинки', 14848, 'Обыкновенные', 33),
     ('Пупырки', 0, 'Неизвестные', 33),
     ('Крапинки', 3, 'Прекрасные', 32),
     ('Звездочки', 100000009, 'Далекие', 34);

INSERT INTO SPACE_SHIP(NAME, TYPE, CAPACITY, HAVING_WEAPON)
VALUES ('LOL', 'Helix', 1020, true),
       ('Исследователь', 'Explorer', 90, true),
       ('Захватчик', 'Terminator', 9012, true);

INSERT INTO TEAM(NAME, GOAL_DESCRIPTION, SPACE_SHIP_ID)
VALUES ('Звездные исследователи', 'Покорение галактики', 10),
       	   ('Космические питбули', 'Исследование сатурна', 11),
       	   ('Межгалактические шептуны', 'Побег с места преступления', 12);

INSERT INTO HUMAN(NAME, SURNAME, PATRONYMIC, GENDER, AGE, POETRY, TEAM)
VALUES ('Катерина', 'Иванова', 'Владимировна', 'Женский', 19, 0, 1),
	   ('Jack', 'Paul', NULL, 'Мужской', 45, 6, 1),
	   ('Павел', 'Пупкин', 'Сергеевич', 'Мужской', 34, 9, 3),
	   ('Michael', 'Jordan', NULL, 'Мужской', 52, 8, 3),
	   ('Jessica', 'Dyke', NULL, 'Женский', 23, 10, 2);

INSERT INTO PLANET(NAME, RADIUS, TYPE, AGE, IS_POPULATED)
VALUES ('Юпитер', 847, 'Газовый гигант', 98471995, false),
       ('Меркурий', 653, 'Торресториальная планета', 9458798, false),
       ('Земля', 700, 'Экзопланета', 4897293, true);

INSERT INTO DESTINATION(TEAM_ID, PLANET_ID)
VALUES (1, 1),
	   (2, 2),
	   (2, 3);

INSERT INTO COLOR(NAME, HEX_CODE)
VALUES ('Черный', '000000'),
	   ('Красный', 'FF0000'),
	   ('Зеленый', '008000'),
	   ('Синий', '000080'),
	   ('Желтый', 'FFFF00');

INSERT INTO CEREAL(NAME, COUNT)
VALUES ('Рис', 9328048234),
	   ('Овсянка', 1244243),
	   ('Гречка', 57987);

INSERT INTO COMPARISION(HUMAN_ID, POINTS_GROUP_ID, CEREAL_ID, PLANET_ID)
VALUES (1, 31, 1, 1),
		(2, 33, 1, 2),
		(2, 32, 2, 3);

INSERT INTO SURPRISING(COMPARISION_ID, TEAM_ID)
VALUES (1, 1),
	   (2, 3),
	   (3, 2);

INSERT INTO COLORING(CEREAL_ID, COLOR_ID)
VALUES (1, 1),
  	   (2, 4),
   	   (3, 2)
