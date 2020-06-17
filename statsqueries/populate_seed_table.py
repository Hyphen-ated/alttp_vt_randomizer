import psycopg2 

num_locations = 236
num_items = 146


conn = psycopg2.connect("host=localhost dbname=rando2 user=rando password=rando")

cur = conn.cursor()
items = [-1] * num_items
locs = [-1] * num_locations



all_seeds = set()
cur.execute('select id from seeds')
for row in cur.fetchall():
    all_seeds.add(row[0])
    
populated_seeds = set()
cur.execute('select seed from seed_details')

for row in cur.fetchall():
    populated_seeds.add(row[0])

seeds_to_do = all_seeds.difference(populated_seeds)

num_done = 0
limit = 100000
for seed in seeds_to_do:
    cur.execute('select loc, item from placements where seed = ' + str(seed))

    placements = cur.fetchall()
    for p in placements:

        loc = p[0]
        item = p[1]
        locs[loc-1] = item
        items[item-1] = loc
    
    insql = "insert into seed_details ("
    for i in range(num_locations):
        insql += "loc" + str(i+1) + ","
    for i in range(num_items):
        insql += "item" + str(i+1) + ","
    insql += "seed) values ("
    for i in range(num_locations):
        insql += str(locs[i]) + ","
    for i in range(num_items):
        insql += str(items[i]) + ","
    insql += str(seed) + ")"
    cur.execute(insql)
    num_done += 1
    if num_done % 10 == 0:
        conn.commit()
    if num_done % 1000 == 0:
        print(num_done)
    if num_done >= limit:
        break