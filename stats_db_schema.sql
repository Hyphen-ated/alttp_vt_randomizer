
CREATE TABLE seeds
(
  id serial NOT NULL,
  hash text NOT NULL,
  CONSTRAINT seeds_pkey PRIMARY KEY (id)
);

CREATE INDEX seeds_hash_idx
  ON seeds
  USING btree
  (hash COLLATE pg_catalog."default");
  
  
CREATE SEQUENCE location_id_seq; 
CREATE TABLE locations
(
  id smallint NOT NULL DEFAULT nextval('location_id_seq'::regclass),
  name text NOT NULL,
  CONSTRAINT locations_pkey PRIMARY KEY (id)
);

CREATE INDEX locations_name_idx
  ON locations
  USING btree
  (name COLLATE pg_catalog."default");
  
CREATE SEQUENCE items_id_seq;   
CREATE TABLE items
(
  id smallint NOT NULL DEFAULT nextval('items_id_seq'::regclass),
  name text NOT NULL,
  CONSTRAINT item_names_pkey PRIMARY KEY (id)
);

CREATE INDEX items_name_idx
  ON items
  USING btree
  (name COLLATE pg_catalog."default");
  
CREATE TABLE placements
(
  seed_id integer NOT NULL,
  location_id smallint NOT NULL,
  item_id smallint NOT NULL,
  sphere smallint NOT NULL,
  required boolean NOT NULL,
  CONSTRAINT placements_pkey PRIMARY KEY (seed_id, location_id)
);

CREATE TABLE findable_without
(
  seed_id integer NOT NULL,
  item_id smallint NOT NULL,
  items bit(146),
  locations bit(236),
  CONSTRAINT findable_without_pkey PRIMARY KEY (seed_id, item_id)
);

CREATE OR REPLACE FUNCTION itemid(text)
  RETURNS smallint AS
'select id from items where name = $1;'
  LANGUAGE sql VOLATILE
  COST 100;
  
CREATE OR REPLACE FUNCTION itemname(smallint)
  RETURNS text AS
'select name from items where id = $1;'
  LANGUAGE sql VOLATILE
  COST 100;

CREATE OR REPLACE FUNCTION locationid(text)
  RETURNS smallint AS
'select id from locations where name = $1;'
  LANGUAGE sql VOLATILE
  COST 100;
  
CREATE OR REPLACE FUNCTION locationname(smallint)
  RETURNS text AS
'select name from locations where id = $1;'
  LANGUAGE sql VOLATILE
  COST 100;

INSERT INTO locations (name)
VALUES
    ('Sahasrahla''s Hut - Left'),
    ('Sahasrahla''s Hut - Middle'),
    ('Sahasrahla''s Hut - Right'),
    ('Sahasrahla'),
    ('King Zora'),
    ('Potion Shop'),
    ('Zora''s Ledge'),
    ('Waterfall Fairy - Left'),
    ('Waterfall Fairy - Right'),
    ('Master Sword Pedestal'),
    ('King''s Tomb'),
    ('Kakariko Tavern'),
    ('Chicken House'),
    ('Kakariko Well - Top'),
    ('Kakariko Well - Left'),
    ('Kakariko Well - Middle'),
    ('Kakariko Well - Right'),
    ('Kakariko Well - Bottom'),
    ('Blind''s Hideout - Top'),
    ('Blind''s Hideout - Left'),
    ('Blind''s Hideout - Right'),
    ('Blind''s Hideout - Far Left'),
    ('Blind''s Hideout - Far Right'),
    ('Pegasus Rocks'),
    ('Bottle Merchant'),
    ('Magic Bat'),
    ('Sick Kid'),
    ('Lost Woods Hideout'),
    ('Lumberjack Tree'),
    ('Graveyard Ledge'),
    ('Mushroom'),
    ('Floodgate Chest'),
    ('Link''s House'),
    ('Aginah''s Cave'),
    ('Mini Moldorm Cave - Far Left'),
    ('Mini Moldorm Cave - Left'),
    ('Mini Moldorm Cave - Right'),
    ('Mini Moldorm Cave - Far Right'),
    ('Ice Rod Cave'),
    ('Hobo'),
    ('Bombos Tablet'),
    ('Cave 45'),
    ('Checkerboard Cave'),
    ('Mini Moldorm Cave - NPC'),
    ('Library'),
    ('Maze Race'),
    ('Desert Ledge'),
    ('Lake Hylia Island'),
    ('Sunken Treasure'),
    ('Flute Spot'),
    ('Sanctuary'),
    ('Sewers - Secret Room - Left'),
    ('Sewers - Secret Room - Middle'),
    ('Sewers - Secret Room - Right'),
    ('Sewers - Dark Cross'),
    ('Hyrule Castle - Boomerang Chest'),
    ('Hyrule Castle - Map Chest'),
    ('Hyrule Castle - Zelda''s Cell'),
    ('Link''s Uncle'),
    ('Secret Passage'),
    ('Zelda'),
    ('Eastern Palace - Compass Chest'),
    ('Eastern Palace - Big Chest'),
    ('Eastern Palace - Cannonball Chest'),
    ('Eastern Palace - Big Key Chest'),
    ('Eastern Palace - Map Chest'),
    ('Eastern Palace - Boss'),
    ('Eastern Palace - Prize'),
    ('Desert Palace - Big Chest'),
    ('Desert Palace - Map Chest'),
    ('Desert Palace - Torch'),
    ('Desert Palace - Big Key Chest'),
    ('Desert Palace - Compass Chest'),
    ('Desert Palace - Boss'),
    ('Desert Palace - Prize'),
    ('Old Man'),
    ('Spectacle Rock Cave'),
    ('Ether Tablet'),
    ('Spectacle Rock'),
    ('Spiral Cave'),
    ('Mimic Cave'),
    ('Paradox Cave Lower - Far Left'),
    ('Paradox Cave Lower - Left'),
    ('Paradox Cave Lower - Right'),
    ('Paradox Cave Lower - Far Right'),
    ('Paradox Cave Lower - Middle'),
    ('Paradox Cave Upper - Left'),
    ('Paradox Cave Upper - Right'),
    ('Floating Island'),
    ('Tower of Hera - Big Key Chest'),
    ('Tower of Hera - Basement Cage'),
    ('Tower of Hera - Map Chest'),
    ('Tower of Hera - Compass Chest'),
    ('Tower of Hera - Big Chest'),
    ('Tower of Hera - Boss'),
    ('Tower of Hera - Prize'),
    ('Castle Tower - Room 03'),
    ('Castle Tower - Dark Maze'),
    ('Agahnim'),
    ('Superbunny Cave - Top'),
    ('Superbunny Cave - Bottom'),
    ('Hookshot Cave - Top Right'),
    ('Hookshot Cave - Top Left'),
    ('Hookshot Cave - Bottom Left'),
    ('Hookshot Cave - Bottom Right'),
    ('Spike Cave'),
    ('Catfish'),
    ('Pyramid'),
    ('Pyramid Fairy - Sword'),
    ('Pyramid Fairy - Bow'),
    ('Ganon'),
    ('Pyramid Fairy - Left'),
    ('Pyramid Fairy - Right'),
    ('Brewery'),
    ('C-Shaped House'),
    ('Chest Game'),
    ('Hammer Pegs'),
    ('Bumper Cave'),
    ('Blacksmith'),
    ('Purple Chest'),
    ('Hype Cave - Top'),
    ('Hype Cave - Middle Right'),
    ('Hype Cave - Middle Left'),
    ('Hype Cave - Bottom'),
    ('Stumpy'),
    ('Hype Cave - NPC'),
    ('Digging Game'),
    ('Mire Shed - Left'),
    ('Mire Shed - Right'),
    ('Palace of Darkness - Shooter Room'),
    ('Palace of Darkness - Big Key Chest'),
    ('Palace of Darkness - The Arena - Ledge'),
    ('Palace of Darkness - The Arena - Bridge'),
    ('Palace of Darkness - Stalfos Basement'),
    ('Palace of Darkness - Map Chest'),
    ('Palace of Darkness - Big Chest'),
    ('Palace of Darkness - Compass Chest'),
    ('Palace of Darkness - Harmless Hellway'),
    ('Palace of Darkness - Dark Basement - Left'),
    ('Palace of Darkness - Dark Basement - Right'),
    ('Palace of Darkness - Dark Maze - Top'),
    ('Palace of Darkness - Dark Maze - Bottom'),
    ('Palace of Darkness - Boss'),
    ('Palace of Darkness - Prize'),
    ('Swamp Palace - Entrance'),
    ('Swamp Palace - Big Chest'),
    ('Swamp Palace - Big Key Chest'),
    ('Swamp Palace - Map Chest'),
    ('Swamp Palace - West Chest'),
    ('Swamp Palace - Compass Chest'),
    ('Swamp Palace - Flooded Room - Left'),
    ('Swamp Palace - Flooded Room - Right'),
    ('Swamp Palace - Waterfall Room'),
    ('Swamp Palace - Boss'),
    ('Swamp Palace - Prize'),
    ('Skull Woods - Big Chest'),
    ('Skull Woods - Big Key Chest'),
    ('Skull Woods - Compass Chest'),
    ('Skull Woods - Map Chest'),
    ('Skull Woods - Bridge Room'),
    ('Skull Woods - Pot Prison'),
    ('Skull Woods - Pinball Room'),
    ('Skull Woods - Boss'),
    ('Skull Woods - Prize'),
    ('Thieves'' Town - Attic'),
    ('Thieves'' Town - Big Key Chest'),
    ('Thieves'' Town - Map Chest'),
    ('Thieves'' Town - Compass Chest'),
    ('Thieves'' Town - Ambush Chest'),
    ('Thieves'' Town - Big Chest'),
    ('Thieves'' Town - Blind''s Cell'),
    ('Thieves'' Town - Boss'),
    ('Thieves'' Town - Prize'),
    ('Ice Palace - Big Key Chest'),
    ('Ice Palace - Compass Chest'),
    ('Ice Palace - Map Chest'),
    ('Ice Palace - Spike Room'),
    ('Ice Palace - Freezor Chest'),
    ('Ice Palace - Iced T Room'),
    ('Ice Palace - Big Chest'),
    ('Ice Palace - Boss'),
    ('Ice Palace - Prize'),
    ('Misery Mire - Big Chest'),
    ('Misery Mire - Main Lobby'),
    ('Misery Mire - Big Key Chest'),
    ('Misery Mire - Compass Chest'),
    ('Misery Mire - Bridge Chest'),
    ('Misery Mire - Map Chest'),
    ('Misery Mire - Spike Chest'),
    ('Misery Mire - Boss'),
    ('Misery Mire - Prize'),
    ('Turtle Rock - Chain Chomps'),
    ('Turtle Rock - Compass Chest'),
    ('Turtle Rock - Roller Room - Left'),
    ('Turtle Rock - Roller Room - Right'),
    ('Turtle Rock - Big Chest'),
    ('Turtle Rock - Big Key Chest'),
    ('Turtle Rock - Crystaroller Room'),
    ('Turtle Rock - Eye Bridge - Bottom Left'),
    ('Turtle Rock - Eye Bridge - Bottom Right'),
    ('Turtle Rock - Eye Bridge - Top Left'),
    ('Turtle Rock - Eye Bridge - Top Right'),
    ('Turtle Rock - Boss'),
    ('Turtle Rock - Prize'),
    ('Ganon''s Tower - Bob''s Torch'),
    ('Ganon''s Tower - DMs Room - Top Left'),
    ('Ganon''s Tower - DMs Room - Top Right'),
    ('Ganon''s Tower - DMs Room - Bottom Left'),
    ('Ganon''s Tower - DMs Room - Bottom Right'),
    ('Ganon''s Tower - Randomizer Room - Top Left'),
    ('Ganon''s Tower - Randomizer Room - Top Right'),
    ('Ganon''s Tower - Randomizer Room - Bottom Left'),
    ('Ganon''s Tower - Randomizer Room - Bottom Right'),
    ('Ganon''s Tower - Firesnake Room'),
    ('Ganon''s Tower - Map Chest'),
    ('Ganon''s Tower - Big Chest'),
    ('Ganon''s Tower - Hope Room - Left'),
    ('Ganon''s Tower - Hope Room - Right'),
    ('Ganon''s Tower - Bob''s Chest'),
    ('Ganon''s Tower - Tile Room'),
    ('Ganon''s Tower - Compass Room - Top Left'),
    ('Ganon''s Tower - Compass Room - Top Right'),
    ('Ganon''s Tower - Compass Room - Bottom Left'),
    ('Ganon''s Tower - Compass Room - Bottom Right'),
    ('Ganon''s Tower - Big Key Chest'),
    ('Ganon''s Tower - Big Key Room - Left'),
    ('Ganon''s Tower - Big Key Room - Right'),
    ('Ganon''s Tower - Mini Helmasaur Room - Left'),
    ('Ganon''s Tower - Mini Helmasaur Room - Right'),
    ('Ganon''s Tower - Pre-Moldorm Chest'),
    ('Ganon''s Tower - Moldorm Chest'),
    ('Agahnim 2'),
    ('Turtle Rock Medallion'),
    ('Misery Mire Medallion'),
    ('Waterfall Bottle'),
    ('Pyramid Bottle');


INSERT INTO items (name)
VALUES
    ('ProgressiveBow1'),
    ('ProgressiveBow2'),
    ('Boomerang'),
    ('RedBoomerang'),
    ('Hookshot'),
    ('Mushroom'),
    ('Powder'),
    ('FireRod'),
    ('IceRod'),
    ('Bombos'),
    ('Ether'),
    ('Quake'),
    ('Lamp'),
    ('Hammer'),
    ('Shovel'),
    ('OcarinaInactive'),
    ('BugCatchingNet'),
    ('BookOfMudora'),
    ('Bottle'),
    ('BottleWithFairy'),
    ('BottleWithRedPotion'),
    ('BottleWithGreenPotion'),
    ('BottleWithBluePotion'),
    ('BottleWithBee'),
    ('BottleWithGoldBee'),
    ('CaneOfSomaria'),
    ('CaneOfByrna'),
    ('Cape'),
    ('MagicMirror'),
    ('PegasusBoots'),
    ('ProgressiveGlove1'),
    ('ProgressiveGlove2'),
    ('Flippers'),
    ('MoonPearl'),
    ('ProgressiveSword1'),
    ('ProgressiveSword2'),
    ('ProgressiveSword3'),
    ('ProgressiveSword4'),
    ('ProgressiveShield1'),
    ('ProgressiveShield2'),
    ('ProgressiveShield3'),
    ('ProgressiveArmor1'),
    ('ProgressiveArmor2'),
    ('ProgressiveArmor3'),
    ('HalfMagic'),
    ('QuarterMagic'),
    ('PieceOfHeart'),
    ('BossHeartContainer'),
    ('HeartContainer'),
    ('Heart'),
    ('Bomb'),
    ('ThreeBombs'),
    ('TenBombs'),
    ('Arrow'),
    ('TenArrows'),
    ('OneRupee'),
    ('FiveRupees'),
    ('TwentyRupees'),
    ('FiftyRupees'),
    ('OneHundredRupees'),
    ('ThreeHundredRupees'),
    ('Bee'),
    ('RedPotion'),
    ('GreenPotion'),
    ('BluePotion'),
    ('SmallMagic'),
    ('BombUpgrade5'),
    ('BombUpgrade10'),
    ('BombUpgrade50'),
    ('ArrowUpgrade5'),
    ('ArrowUpgrade10'),
    ('ArrowUpgrade70'),
    ('BigKeyA1'),
    ('BigKeyA2'),
    ('BigKeyP1'),
    ('BigKeyP2'),
    ('BigKeyP3'),
    ('BigKeyD1'),
    ('BigKeyD2'),
    ('BigKeyD3'),
    ('BigKeyD4'),
    ('BigKeyD5'),
    ('BigKeyD6'),
    ('BigKeyD7'),
    ('BigKeyH1'),
    ('BigKeyH2'),
    ('KeyA1'),
    ('KeyA2'),
    ('KeyP1'),
    ('KeyP2'),
    ('KeyP3'),
    ('KeyD1'),
    ('KeyD2'),
    ('KeyD3'),
    ('KeyD4'),
    ('KeyD5'),
    ('KeyD6'),
    ('KeyD7'),
    ('KeyGK'),
    ('KeyH1'),
    ('KeyH2'),
    ('MapA1'),
    ('MapA2'),
    ('MapP1'),
    ('MapP2'),
    ('MapP3'),
    ('MapD1'),
    ('MapD2'),
    ('MapD3'),
    ('MapD4'),
    ('MapD5'),
    ('MapD6'),
    ('MapD7'),
    ('MapH1'),
    ('MapH2'),
    ('CompassA1'),
    ('CompassA2'),
    ('CompassP1'),
    ('CompassP2'),
    ('CompassP3'),
    ('CompassD1'),
    ('CompassD2'),
    ('CompassD3'),
    ('CompassD4'),
    ('CompassD5'),
    ('CompassD6'),
    ('CompassD7'),
    ('CompassH1'),
    ('CompassH2'),
    ('PendantOfCourage'),
    ('PendantOfWisdom'),
    ('PendantOfPower'),
    ('Crystal1'),
    ('Crystal2'),
    ('Crystal3'),
    ('Crystal4'),
    ('Crystal5'),
    ('Crystal6'),
    ('Crystal7'),
    ('Triforce'),
    ('RescueZelda'),
    ('DefeatAgahnim'),
    ('BigRedBomb'),
    ('DefeatAgahnim2'),
    ('DefeatGanon'),
    ('Nothing');



