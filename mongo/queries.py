from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")
db = client["dwarf_fight_club_db"]

comics_collection = db["Comics"]
characters_collection = db["Characters"]
customers_collection = db["Customers"]

fighters_collection = db["fighters"]
weapons_collection = db["weapons"]
environments_collection = db["environments"]
fights_collection = db["fights"]

def get_all_nba_players():
    fighters = fighters_collection.find(
        {
    'league': 'NBA'
}
    )
    return list(fighters)


def get_fighter_with_most_wins():
    fighter = fighters_collection.find().sort('wins', -1).limit(1)
    return list(fighter)

def get_most_used_weapon():
    weapon = weapons_collection.find().sort('times_used',-1).limit(1)
    return list(weapon)

def get_most_popular_environment():
    environment = environments_collection.find().sort('fights_held', -1).limit(1)
    return list(environment)

def get_fights_with_ai():
    fights = fights_collection.find(
        {
    'ai_used': True
}
    )
    return list(fights)
print(get_fights_with_ai())