-- INSTANCE FILES CLEANUP
-- supported maps (33,34,36,43,47,48,70,90,109,129,189,209,229,230,249,269,289,309,329,349,389,409,429,469,509,529,531,532,533,534,540,542,543,544,545,546,547,548,550,552,553,554,555,556,557,558,560,564,565,568,580,585)

UPDATE creature SET curhealth = (SELECT minlevelhealth FROM creature_template WHERE creature.id = creature_template.entry)
WHERE curhealth < (SELECT minlevelhealth FROM creature_template WHERE creature.id = creature_template.entry) AND id NOT IN (20869,21586) -- Arcatraz Sentinels Have Lower Health On Purpose (40% Max Health)
AND map IN (33,34,36,43,47,48,70,90,109,129,189,209,229,230,249,269,289,309,329,349,389,409,429,469,509,529,531,532,533,534,540,542,543,544,545,546,547,548,550,552,553,554,555,556,557,558,560,564,565,568,580,585);

UPDATE creature SET curmana = (SELECT minlevelmana FROM creature_template WHERE creature.id = creature_template.entry)
WHERE curmana < (SELECT minlevelmana FROM creature_template WHERE creature.id = creature_template.entry)
AND map IN (33,34,36,43,47,48,70,90,109,129,189,209,229,230,249,269,289,309,329,349,389,409,429,469,509,529,531,532,533,534,540,542,543,544,545,546,547,548,550,552,553,554,555,556,557,558,560,564,565,568,580,585);


