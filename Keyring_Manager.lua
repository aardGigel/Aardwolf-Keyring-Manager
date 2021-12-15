require "gmcphelper"
require "serialize"
require "colors"
require "utility"

require "tprint"
require "utility"

local keysBag = "backpack"
local   areas = {
  Unknown = {
    lmin = 1,
    lmax = 291,
    },
  Wildwood = {
    lmin = 10,
    lmax = 40,
    },
  ["Dhal'Gora Outlands"] = {
    lmin = 10,
    lmax = 50,
    },
  ["The Temple of Shouggoth"] = {
    lmin = 10,
    lmax = 50,
    },
  ["Keep of the Kobaloi"] = {
    lmin = 10,
    lmax = 201,
    },
  ["Aerial City of Cineko"] = {
    lmin = 15,
    lmax = 30,
    },
  ["Kul Tiras"] = {
    lmin = 15,
    lmax = 30,
    },
  ["Necromancers' Guild"] = {
    lmin = 15,
    lmax = 30,
    },
  ["The UnderDark"] = {
    lmin = 15,
    lmax = 50,
    },
  ["Realm of the Zodiac"] = {
    lmin = 20,
    lmax = 30,
    },
  Atlantis = {
    lmin = 20,
    lmax = 40,
    },
  ["Bloodlust Dungeon"] = {
    lmin = 201,
    lmax = 201,
    },
  ["Death's Manor"] = {
    lmin = 20,
    lmax = 40,
    },
  ["The Emerald Clan HQ"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Fractured Lands"] = {
    lmin = 20,
    lmax = 40,
    },
  ["Weather Observatory"] = {
    lmin = 20,
    lmax = 40,
    },
  ["The Maelstrom"] = {
    lmin = 20,
    lmax = 45,
    },
  ["Ancient Greece"] = {
    lmin = 20,
    lmax = 50,
    },
  ["Kingdom of Ahner"] = {
    lmin = 20,
    lmax = 50,
    },
  ["Thandeld's Conflict"] = {
    lmin = 20,
    lmax = 50,
    },
  ["Sheila's Cat Sanctuary"] = {
    lmin = 25,
    lmax = 35,
    },
  ["Mudwog's Swamp"] = {
    lmin = 30,
    lmax = 40,
    },
  Cradlebrook = {
    lmin = 30,
    lmax = 50,
    },
  ["The Coral Kingdom"] = {
    lmin = 30,
    lmax = 50,
    },
  ["The Labyrinth"] = {
    lmin = 30,
    lmax = 60,
    },
  Kingsholm = {
    lmin = 30,
    lmax = 65,
    },
  ["Gold Rush"] = {
    lmin = 30,
    lmax = 70,
    },
  ["The Imperial City of Reme"] = {
    lmin = 30,
    lmax = 100,
    },
  ["The Silver Volcano"] = {
    lmin = 30,
    lmax = 100,
    },
  ["Descent to Hell"] = {
    lmin = 35,
    lmax = 55,
    },
  ["Onyx Bazaar"] = {
    lmin = 35,
    lmax = 55,
    },
  ["The Blighted Tundra of Andarin"] = {
    lmin = 35,
    lmax = 60,
    },
  ["Diamond Soul Revelation"] = {
    lmin = 35,
    lmax = 85,
    },
  ["Tournament Camps"] = {
    lmin = 1,
    lmax = 10,
    },
  ["Art of Melody"] = {
    lmin = 1,
    lmax = 15,
    },
  ["The Call of Heroes"] = {
    lmin = 1,
    lmax = 15,
    },
  ["Hotel Orlando"] = {
    lmin = 1,
    lmax = 20,
    },
  ["Zangar's Demonic Grotto"] = {
    lmin = 40,
    lmax = 60,
    },
  ["The Land of Oz"] = {
    lmin = 40,
    lmax = 70,
    },
  ["Paradise Lost"] = {
    lmin = 50,
    lmax = 70,
    },
  ["The Flying Citadel"] = {
    lmin = 50,
    lmax = 70,
    },
  ["Castle Vlad-Shamir"] = {
    lmin = 50,
    lmax = 80,
    },
  ["Earth Plane 4"] = {
    lmin = 50,
    lmax = 80,
    },
  ["The Old Cathedral"] = {
    lmin = 50,
    lmax = 80,
    },
  ["Tilule Rehabilitation Clinic"] = {
    lmin = 50,
    lmax = 80,
    },
  ["Jenny's Tavern"] = {
    lmin = 50,
    lmax = 100,
    },
  ["Storm Ships of Lem-Dagor"] = {
    lmin = 50,
    lmax = 100,
    },
  ["The Yurgach Domain"] = {
    lmin = 50,
    lmax = 100,
    },
  ["Hedgehogs' Paradise"] = {
    lmin = 60,
    lmax = 80,
    },
  ["Plains of Nulan'Boar"] = {
    lmin = 60,
    lmax = 80,
    },
  ["The Goblin Fortress"] = {
    lmin = 60,
    lmax = 80,
    },
  ["The Great City of Knossos"] = {
    lmin = 60,
    lmax = 80,
    },
  ["The Killing Fields"] = {
    lmin = 60,
    lmax = 80,
    },
  ["The Palace of Song"] = {
    lmin = 60,
    lmax = 80,
    },
  ["The Three Pillars of Diatz"] = {
    lmin = 60,
    lmax = 80,
    },
  ["Realm of Deneria"] = {
    lmin = 60,
    lmax = 85,
    },
  ["The Upper Planes"] = {
    lmin = 60,
    lmax = 100,
    },
  ["The DarkLight"] = {
    lmin = 60,
    lmax = 120,
    },
  ["The Ruins of Diamond Reach"] = {
    lmin = 60,
    lmax = 120,
    },
  ["Tumari's Diner"] = {
    lmin = 125,
    lmax = 145,
    },
  ["The Blood Opal of Rauko'ra"] = {
    lmin = 125,
    lmax = 201,
    },
  ["Foolish Promises"] = {
    lmin = 130,
    lmax = 140,
    },
  ["The Dark Temple of Zyian"] = {
    lmin = 130,
    lmax = 150,
    },
  ["The Drageran Empire"] = {
    lmin = 130,
    lmax = 150,
    },
  ["Tir na nOg"] = {
    lmin = 130,
    lmax = 150,
    },
  ["A Peaceful Giant Village"] = {
    lmin = 130,
    lmax = 160,
    },
  ["The Reman Conspiracy"] = {
    lmin = 130,
    lmax = 170,
    },
  ["The Mountains of Desolation"] = {
    lmin = 130,
    lmax = 175,
    },
  ["The Desert Prison"] = {
    lmin = 130,
    lmax = 201,
    },
  ["Desert Doom"] = {
    lmin = 135,
    lmax = 150,
    },
  ["Imagi's Nation"] = {
    lmin = 140,
    lmax = 160,
    },
  ["Nanjiki Ruins"] = {
    lmin = 140,
    lmax = 160,
    },
  ["The Abyssal Caverns of Sahuagin"] = {
    lmin = 140,
    lmax = 160,
    },
  ["The Cougarian Queendom"] = {
    lmin = 140,
    lmax = 160,
    },
  ["The Gathering Horde"] = {
    lmin = 140,
    lmax = 170,
    },
  ["Unearthly Bonds"] = {
    lmin = 140,
    lmax = 170,
    },
  ["The Empire of Aiighialla"] = {
    lmin = 140,
    lmax = 180,
    },
  ["Takeda's Warcamp"] = {
    lmin = 140,
    lmax = 201,
    },
  ["Arisian Realm"] = {
    lmin = 150,
    lmax = 170,
    },
  Winterlands = {
    lmin = 150,
    lmax = 170,
    },
  ["Battlefields of Adaldar"] = {
    lmin = 150,
    lmax = 180,
    },
  ["Sagewood Grove"] = {
    lmin = 150,
    lmax = 180,
    },
  ["Rebellion of the Nix"] = {
    lmin = 150,
    lmax = 190,
    },
  ["The Cataclysm"] = {
    lmin = 150,
    lmax = 201,
    },
  ["The Ruins of Stormhaven"] = {
    lmin = 150,
    lmax = 201,
    },
  ["Black Lagoon"] = {
    lmin = 155,
    lmax = 195,
    },
  Annwn = {
    lmin = 160,
    lmax = 180,
    },
  ["Dread Tower"] = {
    lmin = 160,
    lmax = 180,
    },
  ["Helegear Sea"] = {
    lmin = 160,
    lmax = 180,
    },
  ["The Covenant of Mistridge"] = {
    lmin = 160,
    lmax = 201,
    },
  ["The Witches of Omen Tor"] = {
    lmin = 160,
    lmax = 201,
    },
  ["Tribal Origins"] = {
    lmin = 165,
    lmax = 190,
    },
  ["Avian Kingdom"] = {
    lmin = 170,
    lmax = 190,
    },
  ["Empyrean, Streets of Downfall"] = {
    lmin = 170,
    lmax = 200,
    },
  ["Eternal Autumn"] = {
    lmin = 170,
    lmax = 201,
    },
  ["The Glamdursil"] = {
    lmin = 170,
    lmax = 201,
    },
  ["The Tree of Life"] = {
    lmin = 170,
    lmax = 201,
    },
  ["Black Rose"] = {
    lmin = 175,
    lmax = 201,
    },
  ["Intrigues of Times Past"] = {
    lmin = 175,
    lmax = 201,
    },
  ["Mount duNoir"] = {
    lmin = 175,
    lmax = 201,
    },
  ["The Deadlights"] = {
    lmin = 175,
    lmax = 201,
    },
  ["The Keep of Kearvek"] = {
    lmin = 175,
    lmax = 201,
    },
  ["Artificer's Mayhem"] = {
    lmin = 180,
    lmax = 201,
    },
  ["Tanra'vea"] = {
    lmin = 180,
    lmax = 201,
    },
  ["The Astral Travels"] = {
    lmin = 180,
    lmax = 201,
    },
  ["The Blood Sanctum"] = {
    lmin = 180,
    lmax = 201,
    },
  ["The Nine Hells"] = {
    lmin = 180,
    lmax = 201,
    },
  ["The Partroxis"] = {
    lmin = 180,
    lmax = 201,
    },
  ["The Temple of Shal'indrael"] = {
    lmin = 180,
    lmax = 201,
    },
  ["Yggdrasil: The World Tree"] = {
    lmin = 180,
    lmax = 201,
    },
  ["Kiksaadi Cove"] = {
    lmin = 190,
    lmax = 200,
    },
  ["Entrance to Hades"] = {
    lmin = 190,
    lmax = 201,
    },
  Nottingham = {
    lmin = 190,
    lmax = 201,
    },
  ["The Council of the Wyrm"] = {
    lmin = 190,
    lmax = 201,
    },
  ["The Icy Caldera of Mauldoon"] = {
    lmin = 190,
    lmax = 201,
    },
  ["The Trouble with Gwillimberry"] = {
    lmin = 190,
    lmax = 201,
    },
  ["Crynn's Church"] = {
    lmin = 195,
    lmax = 201,
    },
  ["Umari's Castle"] = {
    lmin = 195,
    lmax = 201,
    },
  ["A Genie's Last Wish"] = {
    lmin = 200,
    lmax = 201,
    },
  Afterglow = {
    lmin = 200,
    lmax = 201,
    },
  ["Andolor's Ocean Adventure Park"] = {
    lmin = 200,
    lmax = 201,
    },
  ["Gypsy Caravan"] = {
    lmin = 200,
    lmax = 201,
    },
  Icefall = {
    lmin = 200,
    lmax = 201,
    },
  ["Journey to the Inferno"] = {
    lmin = 200,
    lmax = 201,
    },
  ["Ketu Uplands"] = {
    lmin = 200,
    lmax = 201,
    },
  ["Nebulous Horizon"] = {
    lmin = 200,
    lmax = 201,
    },
  ["Oradrin's Chosen"] = {
    lmin = 200,
    lmax = 201,
    },
  ["Realm of the Sacred Flame"] = {
    lmin = 200,
    lmax = 201,
    },
  ["Shadow's End"] = {
    lmin = 200,
    lmax = 201,
    },
  ["The Cracks of Terra"] = {
    lmin = 200,
    lmax = 201,
    },
  ["The Earth Lords"] = {
    lmin = 200,
    lmax = 201,
    },
  ["The Nyne Woods"] = {
    lmin = 200,
    lmax = 201,
    },
  ["The Titans' Keep"] = {
    lmin = 200,
    lmax = 201,
    },
  ["The Were Wood"] = {
    lmin = 200,
    lmax = 201,
    },
  Transcendence = {
    lmin = 200,
    lmax = 201,
    },
  ["Winds of Fate"] = {
    lmin = 200,
    lmax = 201,
    },
  Qong = {
    lmin = 200,
    lmax = 220,
    },
  ["Black Claw Crag"] = {
    lmin = 201,
    lmax = 201,
    },
  ["Crossroads of Fortune"] = {
    lmin = 201,
    lmax = 201,
    },
  ["Ookushka Garrison"] = {
    lmin = 201,
    lmax = 201,
    },
  ["Radiance Woods"] = {
    lmin = 201,
    lmax = 201,
    },
  ["Sea King's Dominion"] = {
    lmin = 201,
    lmax = 201,
    },
  ["The Curse of the Midnight Fens"] = {
    lmin = 201,
    lmax = 201,
    },
  ["The Dungeon of Doom"] = {
    lmin = 201,
    lmax = 201,
    },
  ["The Realm of Infamy"] = {
    lmin = 201,
    lmax = 201,
    },
  ["A Clearing in the Woods"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Boot Training Grounds"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Cathedral of the Elements"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Dark Temple of Zhamet"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Disciples of Hassan Clan Hall"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Wayfarer's Caravan"] = {
    lmin = 200,
    lmax = 201,
    },
  ["The Keep of the Asherodan"] = {
    lmin = 80,
    lmax = 90,
    },
  ["Twilight Hall"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Touchstone Cavern"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Xunti Cult"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The World of the Watchmen"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The White Dragon Clan"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Underground Hall"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Twinlobe Clan HQ"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Stronghold of the Imperium"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Shadokil Guildhouse"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The S.S. Hook"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Realm of Chaos"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Order of Light"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Legendary City of Tanelorn"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Ivory City"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Halls of Vanir"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Halls of Retribution"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Fortress of Knowledge"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Em"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Crusader Clan"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Uncharted Oceans"] = {
    lmin = 1,
    lmax = 210,
    },
  ["The Collective Mind of Tao"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Rosewood Castle"] = {
    lmin = 60,
    lmax = 150,
    },
  ["The Children of Ba'alzamon HQ"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Imperial Nation"] = {
    lmin = 65,
    lmax = 201,
    },
  ["The Bard Clan"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Aardington Estate"] = {
    lmin = 70,
    lmax = 90,
    },
  ["Secret Imm Project #69"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Tournament of Illoria"] = {
    lmin = 70,
    lmax = 90,
    },
  ["Rogues Clan Hall"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Wayward Alehouse"] = {
    lmin = 70,
    lmax = 90,
    },
  ["Perdition Clan Area"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Nenukon and the Far Country"] = {
    lmin = 70,
    lmax = 100,
    },
  ["Old clan holding area 4"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Lower Planes"] = {
    lmin = 70,
    lmax = 100,
    },
  ["Old clan holding area 3"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Relinquished Tombs"] = {
    lmin = 70,
    lmax = 100,
    },
  ["Old clan holding area 2"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Tai'rha Laym"] = {
    lmin = 70,
    lmax = 110,
    },
  ["Old clan holding area 1"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Empire of Talsa"] = {
    lmin = 70,
    lmax = 130,
    },
  ["Midgaardian Publishing House"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Fabled City of Stone"] = {
    lmin = 70,
    lmax = 130,
    },
  ["Masaki Clan Area"] = {
    lmin = 210,
    lmax = 210,
    },
  Northstar = {
    lmin = 70,
    lmax = 140,
    },
  ["Loqui Clan Area"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Kobold Siege Camp"] = {
    lmin = 80,
    lmax = 100,
    },
  ["Isle of Anglesey"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Snuckles Village"] = {
    lmin = 80,
    lmax = 100,
    },
  ["Dominion Clan Area"] = {
    lmin = 210,
    lmax = 210,
    },
  ["The Gladiator's Arena"] = {
    lmin = 80,
    lmax = 100,
    },
  ["Kimr's Farm"] = {
    lmin = 1,
    lmax = 5,
    },
  ["The Realm of the Hawklords"] = {
    lmin = 80,
    lmax = 100,
    },
  ["Lowlands Paradise '96"] = {
    lmin = 1,
    lmax = 10,
    },
  ["Wedded Bliss"] = {
    lmin = 80,
    lmax = 100,
    },
  ["Land of Legend"] = {
    lmin = 1,
    lmax = 20,
    },
  Anthrox = {
    lmin = 80,
    lmax = 110,
    },
  ["The Path of the Believer"] = {
    lmin = 1,
    lmax = 10,
    },
  ["Island of Lost Time"] = {
    lmin = 80,
    lmax = 110,
    },
  Jotunheim = {
    lmin = 1,
    lmax = 40,
    },
  ["Realm of the Firebird"] = {
    lmin = 80,
    lmax = 110,
    },
  ["Sen'narre Lake"] = {
    lmin = 1,
    lmax = 20,
    },
  ["Deathtrap Dungeon"] = {
    lmin = 80,
    lmax = 130,
    },
  ["The Aylorian Academy"] = {
    lmin = 1,
    lmax = 10,
    },
  Pompeii = {
    lmin = 90,
    lmax = 110,
    },
  ["Gallows Hill"] = {
    lmin = 1,
    lmax = 30,
    },
  ["The Scarred Lands"] = {
    lmin = 90,
    lmax = 110,
    },
  ["A Bad Trip"] = {
    lmin = 1,
    lmax = 210,
    },
  ["The Monastery"] = {
    lmin = 90,
    lmax = 120,
    },
  ["Challenge Area"] = {
    lmin = 1,
    lmax = 201,
    },
  ["Dark Elf Stronghold"] = {
    lmin = 90,
    lmax = 125,
    },
  Gelidus = {
    lmin = 1,
    lmax = 210,
    },
  ["Elemental Chaos"] = {
    lmin = 90,
    lmax = 150,
    },
  ["The Grand City of Aylor"] = {
    lmin = 1,
    lmax = 201,
    },
  ["Halls of the Damned"] = {
    lmin = 95,
    lmax = 115,
    },
  ["Chaprenula's Laboratory"] = {
    lmin = 5,
    lmax = 15,
    },
  Insanitaria = {
    lmin = 95,
    lmax = 115,
    },
  ["Alagh, the Blood Lands"] = {
    lmin = 1,
    lmax = 210,
    },
  ["Ascension Bluff Nursing Home"] = {
    lmin = 100,
    lmax = 120,
    },
  ["Siren's Oasis Resort"] = {
    lmin = 5,
    lmax = 15,
    },
  ["Dusk Valley"] = {
    lmin = 100,
    lmax = 120,
    },
  ["The Continent of Mesolar"] = {
    lmin = 1,
    lmax = 210,
    },
  ["Faerie Tales"] = {
    lmin = 100,
    lmax = 120,
    },
  ["The Fire Swamp"] = {
    lmin = 5,
    lmax = 15,
    },
  ["Seven Wonders"] = {
    lmin = 100,
    lmax = 120,
    },
  ["The Laser Zone"] = {
    lmin = 1,
    lmax = 210,
    },
  ["Xyl's Mosaic"] = {
    lmin = 100,
    lmax = 120,
    },
  ["The Wobbly Woes of Woobleville"] = {
    lmin = 40,
    lmax = 60,
    },
  ["Prosper's Island"] = {
    lmin = 100,
    lmax = 125,
    },
  ["The First Ascent"] = {
    lmin = 5,
    lmax = 15,
    },
  ["Masquerade Island"] = {
    lmin = 100,
    lmax = 130,
    },
  ["The Graveyard"] = {
    lmin = 5,
    lmax = 15,
    },
  ["Into the Long Night"] = {
    lmin = 100,
    lmax = 200,
    },
  ["Den of Thieves"] = {
    lmin = 5,
    lmax = 20,
    },
  ["Sanctity of Eternal Damnation"] = {
    lmin = 100,
    lmax = 201,
    },
  ["Giant's Pet Store"] = {
    lmin = 5,
    lmax = 20,
    },
  ["Gnoll's Quarry"] = {
    lmin = 105,
    lmax = 125,
    },
  ["Sundered Vale"] = {
    lmin = 5,
    lmax = 20,
    },
  ["The Marshlands of Agroth"] = {
    lmin = 105,
    lmax = 125,
    },
  ["The Amusement Park"] = {
    lmin = 5,
    lmax = 20,
    },
  Arboretum = {
    lmin = 110,
    lmax = 130,
    },
  ["The Chessboard"] = {
    lmin = 5,
    lmax = 20,
    },
  ["Tairayden Peninsula"] = {
    lmin = 110,
    lmax = 130,
    },
  ["Child's Play"] = {
    lmin = 5,
    lmax = 25,
    },
  ["The Stuff of Shadows"] = {
    lmin = 110,
    lmax = 130,
    },
  Dortmund = {
    lmin = 5,
    lmax = 25,
    },
  ["Living Mines of Dak'Tai"] = {
    lmin = 110,
    lmax = 140,
    },
  ["Canyon Memorial Hospital"] = {
    lmin = 5,
    lmax = 30,
    },
  ["Christmas Vacation"] = {
    lmin = 110,
    lmax = 150,
    },
  ["Fantasy Fields"] = {
    lmin = 5,
    lmax = 30,
    },
  ["The Misty Shores of Yarr"] = {
    lmin = 115,
    lmax = 135,
    },
  Kerofk = {
    lmin = 5,
    lmax = 30,
    },
  ["Gilda And The Dragon"] = {
    lmin = 120,
    lmax = 140,
    },
  ["The Gauntlet"] = {
    lmin = 5,
    lmax = 30,
    },
  ["The Eighteenth Dynasty"] = {
    lmin = 120,
    lmax = 140,
    },
  ["The Wood Elves of Nalondir"] = {
    lmin = 5,
    lmax = 30,
    },
  ["The Sanguine Tavern"] = {
    lmin = 120,
    lmax = 140,
    },
  ["A Magical Hodgepodge"] = {
    lmin = 5,
    lmax = 35,
    },
  ["Verdure Estate"] = {
    lmin = 120,
    lmax = 140,
    },
  ["Aardwolf Zoological Park"] = {
    lmin = 5,
    lmax = 35,
    },
  ["The Slaughter House"] = {
    lmin = 120,
    lmax = 145,
    },
  ["Brightsea and Glimmerdim"] = {
    lmin = 5,
    lmax = 35,
    },
  ["Faerie Tales II"] = {
    lmin = 120,
    lmax = 150,
    },
  ["Cloud City of Gnomalin"] = {
    lmin = 5,
    lmax = 35,
    },
  ["House of Cards"] = {
    lmin = 120,
    lmax = 150,
    },
  ["Olde Worlde Carnivale"] = {
    lmin = 5,
    lmax = 35,
    },
  ["The Archipelago of Entropy"] = {
    lmin = 120,
    lmax = 150,
    },
  ["The Infestation"] = {
    lmin = 5,
    lmax = 35,
    },
  ["The Uprising"] = {
    lmin = 120,
    lmax = 160,
    },
  ["The Shadows of Minos"] = {
    lmin = 5,
    lmax = 35,
    },
  ["The Broken Halls of Horath"] = {
    lmin = 120,
    lmax = 170,
    },
  ["The Town of Solan"] = {
    lmin = 5,
    lmax = 35,
    },
  ["The School of Horror"] = {
    lmin = 170,
    lmax = 175,
    },
  ["War of the Wizards"] = {
    lmin = 5,
    lmax = 35,
    },
  ["The Amazon Nation"] = {
    lmin = 120,
    lmax = 201,
    },
  ["Hatchling Aerie"] = {
    lmin = 5,
    lmax = 45,
    },
  ["The Crimson Horde Clan Hall"] = {
    lmin = 210,
    lmax = 210,
    },
  ["Adventures in Sendhia"] = {
    lmin = 5,
    lmax = 50,
    },
  ["Vidblain, the Ever Dark"] = {
    lmin = 1,
    lmax = 210,
    },
  ["Swordbreaker's Hoard"] = {
    lmin = 5,
    lmax = 50,
    },
  ["The Dark Continent, Abend"] = {
    lmin = 1,
    lmax = 210,
    },
  ["The Chasm and The Catacombs"] = {
    lmin = 10,
    lmax = 20,
    },
  ["The Southern Ocean"] = {
    lmin = 1,
    lmax = 210,
    },
  ["Warrior's Training Camp"] = {
    lmin = 10,
    lmax = 20,
    },
  ["The Warzone"] = {
    lmin = 1,
    lmax = 210,
    },
  ["All in a Fayke Day"] = {
    lmin = 10,
    lmax = 30,
    },
  ["Aardwolf Birthday Area"] = {
    lmin = 1,
    lmax = 220,
    },
  ["Guardian's Spyre of Knowledge"] = {
    lmin = 10,
    lmax = 30,
    },
  ["The Darkside of the Fractured Lands"] = {
    lmin = 40,
    lmax = 60,
    },
  ["Sho'aram, Castle in the Sand"] = {
    lmin = 10,
    lmax = 30,
    },
  Raganatittu = {
    lmin = 40,
    lmax = 60,
    },
  ["Fort Terramire"] = {
    lmin = 10,
    lmax = 35,
    },
  ["The Great Salt Flats"] = {
    lmin = 40,
    lmax = 50,
    },
  ["New Thalos"] = {
    lmin = 10,
    lmax = 35,
    },
  ["The Land of the Beer Goblins"] = {
    lmin = 1,
    lmax = 20,
    },
  ["Storm Mountain"] = {
    lmin = 10,
    lmax = 35,
    },
  ["The Forest of Li'Dnesh"] = {
    lmin = 1,
    lmax = 10,
    },
  ["Jungles of Verume"] = {
    lmin = 10,
    lmax = 40,
    },
  }

function manage_keys(name, line, wildcards)

  local level_min = tonumber(wildcards[1]) or 1
  local level_max = tonumber(wildcards[2]) or (tonumber(wildcards[1]) or 291)
  
  ColourNote("red","white","keys usable between levels: ".. level_min.."-"..level_max)
  dinvQuery = "type key || flag iskey"
  dinvCommand = "dinv search objid " .. dinvQuery

  retval, itemIds = CallPlugin("88c86ea252fc1918556df9fe", "getItemIds", dinvQuery)

  --print(retval)
  --print(itemIds)
  items = utils.split(itemIds, ",")
  --tprint(items)
  keys = {}
  dupes = {}
  keep = {}
  for _, v in ipairs(items) do
      id = v
      a, foundAt = CallPlugin("88c86ea252fc1918556df9fe", "inv.items.getStatField", id, "foundat")
      a, lvl = CallPlugin("88c86ea252fc1918556df9fe", "inv.items.getStatField", id, "level")
      a, name = CallPlugin("88c86ea252fc1918556df9fe", "inv.items.getStatField", id, "name")
      if (foundAt == nil) then
        ColourNote("cyan",   "", "skiping key: " .. name)  
        goto continue        
      end
      if (level_max < areas[foundAt].lmin or level_min > areas[foundAt].lmax) then
        ColourNote("yellow", "", "notNeed key:" .." [".. areas[foundAt].lmin.."-"..areas[foundAt].lmax .."] ".. name .." : ".. foundAt)
        table.insert(dupes, id)
      else
        ColourNote("green" , "", "keeping key:" .." [".. areas[foundAt].lmin.."-"..areas[foundAt].lmax .."] ".. name .." : ".. foundAt)
        table.insert(keep, id)
      end

      if table.contains(keys, name .. ":" .. foundAt) then
          --Execute("dinv put backpack id "..id)
        ColourNote("red"   , "", "   dupe key:" .." [".. areas[foundAt].lmin.."-"..areas[foundAt].lmax .."] ".. name .." : ".. foundAt)
        table.insert(dupes, id)
      else
          keys[id] = name .. ":" .. foundAt
      end

      --print(foundAt)
      --print(lvl)
      --print(name)
      --print(a)
      
      ::continue::
  end
  --tprint(keys)
  --tprint(dupes)
  if(#dupes > 0) then
--    Execute("dinv get id " .. table.concat(keep, " || id "))
    Execute("dinv put "..keysBag.." id " .. table.concat(dupes, " || id "))
  end
end
