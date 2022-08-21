USE master;
GO
DROP DATABASE IF EXISTS Anime_Quiz;

CREATE DATABASE Anime_Quiz;
GO

USE Anime_Quiz;
GO

CREATE TABLE questions (
    question_id int IDENTITY(1, 1) NOT NULL,
    question_text varchar(300) NOT NULL,
	CONSTRAINT PK_question_id PRIMARY KEY(question_id)
	);
	
CREATE TABLE answers (
    answer_id int IDENTITY(1, 1) NOT NULL,
    question_id int NOT NULL,
	answer_text varchar(500) NOT NULL,
    sincerity_vs_satire_impact int NOT NULL,
	light_vs_heavy_impact int NOT NULL,
	surface_vs_depth_impact int NOT NULL,
	optimism_vs_pessimism_impact int NOT NULL,
	fantasy_vs_reality_impact int NOT NULL,
	sentimentality_impact int NOT NULL,
	humor_impact int NOT NULL,
	romance_impact int NOT NULL,
	controversy_impact int NOT NULL,
	CONSTRAINT PK_answer_id PRIMARY KEY(answer_id),
	CONSTRAINT FK_questions_answers FOREIGN KEY(question_id) REFERENCES questions (question_id)
	);

	--populate quiz data
	--15 total questions
	INSERT INTO questions (question_text)
	VALUES ('You''re walking along the sidewalk towards an intersection, when you see a truck speeding out of control, headed towards a child who is playing in the road. It''s a classic isekai set-up! What do you do?'), --1
	('You''ve been isekai''d! The beast king''s sorcerer has summoned you to another world. He tells you that you are the chosen hero who must defeat a demon lord threatening to destroy the kingdom. You can choose one ally from the adventurer''s guild to join your party for the quest. Who do you choose?'), --2
	('Your class is on a school trip in Kyoto. You have a few hours of free time to explore the city. How do you use it?'), --3
	('Giant bug monsters are attacking your town! How do you fight back?'),--4
	('Your class president asks you to meet her on the roof after school, alone. What does she want?'), --5
	('So, what will you vote for to be your class''s booth for the culture festival?'), --6
	('You discover that you can travel back in time and enter the body of your younger self. What do you do with your new power?'), --7
	('Your friends invite you to the arcade. What type of games do you play?'), --8
	('What is your after-school club?'), --9
	('You wake up and discover that you''ve switched bodies with someone you know. But whose body are you in…and what now?'), --10
	('How will you convince your crush to give you a chance?'), --11
	('Uh oh, you''re in a "kill or be killed" survival game! How did you get into this mess?'), --12
	('What''s your role in the guild?'), --13
	('Your parents are never home…what’s the deal with that?'), --14
	('Someone important to you has died. How do you react?'); --15

	--85 total answers
	INSERT INTO answers (question_id, answer_text, sincerity_vs_satire_impact, light_vs_heavy_impact, surface_vs_depth_impact, optimism_vs_pessimism_impact, fantasy_vs_reality_impact, sentimentality_impact, humor_impact, romance_impact, controversy_impact)
	VALUES (1, 'Finally – you''ve been waiting for the isekai truck your whole life! Time to leave this stinking world behind. "TAKE ME NOW!" you shout as you dive in front of the truck. But wait – did you even remember to push the kid out of the way?!',	3, -1, -1,	0,	0,	-2,	2,	0,	0),
	(1,	'Call an ambulance. You feel sorry for the child, but you''ve got a life here and a five-year plan. You can''t afford to be spirited away today.',	0,	1,	0,	0,	3,	-1,	0, 0, 1),
	(1,	'Take out your smart phone and start recording. The portal to another world is about to open, and you''re gonna get it all on tape! But, you know, sucks for the kid and all…',	0,	0,	-1,	0,	1,	-1,	1,	0,	0),
	(1,	'You use your time freezing ability to secretly stop time and rescue the little girl, then unfreeze once you''re out of sight. It''s all in a day''s work and a hero needs no thanks.',	-1,	0,	0,	-1,	0,	1,	0,	0,	-1),
	(1,	'Nothing. Random accidents happen every day. It''s sad, but it''s not your responsibility. You''re nobody''s unwitting protagonist – in this world or any other.',	0,	1,	1,	2,	0,	-1,	-1,	0,	1),
	(2, 'You pick the king''s purrfect princess! Sure, she''s a little spoiled and cold, but you''re a sucker for a tsundere – especially one with a cute tail and fuzzy ears, meow!',	0,	-1,	0,	0,	0,	1,	1,	1,	0),
	(2,	'You choose the sorcerer – duh! The king''s personal sorcerer, who was powerful enough to summon you here from another world…Who better to teach you this world''s magic? You''ll be a supreme spellcaster in no time!',	1,	0,	0,	0,	-1,	0,	0,	0,	0),
	(2,	'It''s gotta be the creepy loner in the shadowy corner of the guild house. You don''t care what they say he''s done, or why everyone seems to be afraid of him. He''s obviously a misunderstood badass with a secretly soft heart, and once you''re done kicking some demon tail, you can be part of his redemption arc!',	0,	0,	1,	1,	0,	1,	0,	1,	0),
	(2,	'You pick the pint-sized pig-person everybody''s laughing at. Comic relief mascot? Heck yes! Plus, you''re pretty sure he packs a secret punch. You just need some sufficient danger to unlock his hidden power. You begin plotting all the ways you''re going to torture, ahem, train him to unleash it – KuKuKu!',	1,	0,	1,	0,	0,	-1,	0,	-1,	2),
	(2,	'No one! You didn''t ask to come here, and you have zero interest in fighting a demon lord. After all, what''s he done to you? ''Good luck with that!'' You tell the king, as you head out in search of a tavern to party in.',	0,	0,	0,	1,	2,	-1,	0,	0,	-1),
	(3,	'Shopping! You and your friends are determined to hit every shop in the city to find souvenirs for everyone you know. Of course, while you''re at it, you''ll be sure to find a few things for yourself.',	0,	-1,	-1,	0,	0,	0,	0,	0,	0),
	(3,	'Finally, a chance to express yourself and connect with a whole new city of fans! You gather your girls and prepare for a surprise idol concert in the city center. They won''t know what hit them!',	-1,	-1,	0,	-1,	0,	2,	0,	0,	-1),
	(3,	'Is these even a question – it''s the Kyoto class trip! You use your time to soak up all the city''s amazing culture, touring every museum and temple you can.',	0,	0,	1,	0,	1,	0,	-1,	0,	-1),
	(3,	'Nom nom nom nom! FOOD! Kyoto ramen, sushi, kushikatsu, yatsuhashi. You''re gonna eat everything!',	1,	0,	-1,	0,	0,	-1,	1,	0,	0),
	(3,	'Where''s the arcade? You miss your video games and your legs are tired from traipsing all over the city.',	0,	0,	0,	1,	-1,	0,	0,	0,	0),
	(3,	'Eh, you''ve seen enough. Time to head back to the inn for a nap – screw culture!',	1,	0,	0,	1,	0,	-1,	0,	0,	0),
	(3,	'You don''t really care what you do, as long as you get to spend some time with your crush!',	0,	-1,	0,	-1,	0,	0,	0,	3,	0),
	(4,	'Fight back? More bugs…less people…what''s the problem? You start making yourself a bug costume so you can blend in.',	2,	0,	0, 1,0,-1,	0,	0,	1),
	(4,	'Giant bugs? Gross gross gross! You''ll be running and hiding, thank you very much.',	0,	0,	-1,	0,	0,	0,	1,	0,	-1),
	(4,	'Giant bugs, meet giant flamethrower. Collateral damage is half the fun!',	0,	1,	0,	1,	1,	-1,	0,	0,	2),
	(4,	'You know exactly what to do – clench your fists, bend your knees, and scream really loudly. If anime has taught you anything, this will bring you incredible power, and then you can rip them apart with your bare hands!',	1,	0,	0,	-1,	-1,	0,	1,	0,	1),
	(4,	'Finally – a use for your mech suit! You''ve been waiting for the perfect opportunity to test its specs.',	0,	0,	1,	-1,	0,	0,	0,	0,	0),
	(5,	'The roof alone after school? Obviously it''s a love confession. You better freshen up before you head up there!',	-1,	0,	0,	-1,	0,	0,	0,	2,	0),
	(5,	'Great timing, you''ve been itching for a good fight. You''re not afraid to hit a girl! If the president wants to try to lay down some discipline, she''s got another think coming!',	0,	1,	0,	1,	0,	-1,	0,	0,	1),
	(5,	'Finally – You''re being called for duty! You''ve been waiting your entire high school career for this, and you''ll do anything. Clean up the school, start a new club, go undercover in the seedy underbelly of delinquent society – whatever it is, you''re ready to serve!',	-1,	0,	1,	0,	0,	0,	0,	0,	-1),
	(5,	'It''s gotta be about the culture festival. The president knows you have influence among your classmates, and probably wants to make sure you steer the class towards doing something with your booth that will reflect well on the school – rather than something tawdry, like a maid café.',	0,	0,	1,	0,	1,	0,	0,	0,	0),
	(5,	'Um, who cares? The only one who will be alone on the roof after school is the president. Meanwhile, you''ll be at karaoke, or the local café, or home taking a nap, literally anywhere else but your stupid high school.',	0,	1,	0,	1,	0,	-1,	0,	0,	0),
	(6,	'A maid café, duh! Everyone knows a culture festival is the only time a high school boy can ask a high school girl to dress up like a maid for him without getting hit, and you''re not going to miss out!',	1,	0,	-1,	0,	0,	0,	0,	1,	1),
	(6,	'You vote to put on a play based on a tragic love story. You''ll pour your heart into the role and bring the whole audience to tears.',	-2,	0,	1,	0,	0,	2,	0,	1,	0),
	(6,	'People don''t come to the culture festival for the culture – they come for the food! That''s why you''re doing a build-your-own-bento-box buffet. That is, if you don''t eat all the food yourself first.',	1,	-1,	0,	0,	0,	0,	1,	0,	0),
	(6,	'You just want to make your classmates and community happy! Maybe a civic service booth that will clean up the school – or maybe you''ll put on a concert for everybody and dazzle them with cuteness! Whatever gets the people smiling is good for you.',	-1,	0,	0, -1,	0,	2,	0,	0,	-1),
	(6,	'You''ll host athletic competitions (and secretly gamble on them). After all, you know you''re faster than everyone in your year-might as well make some money with your talent.',	0,	1,	0,	1,	0,	-1,	0,	0,	1),
	(6,	'You asked your home room teacher if you could stay home and play MMORPGs, but she said no. So instead you''ll sit at your booth and play MMORPGs. It''s okay, the other students can play too, and what''s more cultural than exploring a whole other world together?',	1,	0,	0,	0,	-1,	0,	1,	0,	0),
	(7,	'With great power comes great responsibility. You don''t care what happens to you. You''re going to save the life of your childhood love, who was killed before her time! Even if it means becoming a delinquent yourself.',	-1,	1,	1,	0,	0,	1,	0,	2,	0),
	(7,	'What a perfect opportunity! You start a detective agency and solve crimes using your knowledge of the future. And while you''re at it, you place a few lucrative bets and pick some lucky lottery numbers. It''s all in the name of financing your good deeds! And if you get a fancy car or two out of the deal, who does it hurt?',	1,	0,	0,	-1,	0,	-1,	0,	0,	1),
	(7,	'"You mean, do adolescence again? No thanks!" You stay right where you belong, in the present. Literally nothing you could change is worth being a teenager again.',	0,	0,	0,	1,	1,	0,	1,	0,	0),
	(7,	'You''ll relive your high school years and reconnect with the innocence and inspiration of youth! You don''t want to make any grand changes or lead a conspicuous life. You just want to enjoy this precious time and inspire the people around you along the way.',	-2,	0,	0,	-1,	0,	2,	0,	0,	-1),
	(7,	'This is your chance to make bold choices! The first time around, you played it safe and practical. This time, you''re going to follow your passions, and let your heart lead you to your true destiny!',	-1,	0,	0,	-2,	0,	1,	0,	1,	0),
	(8,	'Fighting games all the way – believe it! You learned a new triple hit move on your favorite game that you''ve been waiting to show off.',	0,	1,	0,	0,	0,	0,	0,	0,	1),
	(8,	'You counter-offer karaoke instead. You''ve got a song in your heart that you can''t hold back!',	-1,	0,	0,	0,	1,	1,	0,	0,	-1),
	(8,	'A sports game would be great. Better yet, let''s just play a game of basketball or soccer! Screens are for the unathletic!',	0,	0,	-1,	0,	1,	0,	0,	0,	0),
	(8,	'Ew, no way – if they invited you to the arcade, those are nerds, not your friends. You''ll be at the mall.',	0,	0,	0,	1,	1,	-1,	0,	0,	0),
	(8,	'Anything with great graphics and a rich backstory – you want to be spirited away, completely immersed in the game''s world.',	0,	0,	1,	0,	-1,	0,	0,	0,	0),
	(8,	'There''s too many people at the arcade…You''ll just stay home and play your favorite MMORPG online.',	0,	0,	0,	1,	-2,	-1,	0,	0,	0),
	(9,	'Is there a club for going home and writing down the names of everyone you hate? DIE SCUM!',	0,	1,	0,	2,	0,	-2,	0,	0,	1),
	(9,	'Gamers'' club! Playing video games, talking about video games, making video games. Literally anything video game related works for you.',	0,	0,	0,	0,	-2,	0,	0,	0, 0),
	(9,	'High School Idols Club – you have so much to express, and you want to express it as cutely as possible so your fans can connect and feel your love!',	-1,	-1,	-1,	0,	0,	1,	0,	0,	-1),
	(9,	'Literature club! Dazai once said, ‘There is one thing that humans have that other creatures don''t... and that''s secrets.'' You want to discover all the secrets of the human heart.',	-1,	0,	1,	0,	0,	0,	0,	1,	0),
	(9,	'You''ll join any club if your friends are there! You just want to hang out and gossip with your favorite people, you don''t really care about the particulars.',	0,	-1,	0,	0,	0,	1,	0,	0,	0),
	(9,	'You''re too busy with the student council to join some social club. Let the kids play, you''re going to run the world one day.',	-1,	1,	1,	0,	1,	-1,	0,	0,	1),
	(9,	'It''s gotta be martial arts or contact sports for you! You''ll join whichever one has an open spot – and crush all your opponents! You''ll do whatever it takes to win.',	0,	1,	0,	1,	0,	0,	0,	0,	1),
	(10, 'You''ve become your greatest rival! Now you have to decide; do you compete at your maximum ability, and risk defeating yourself and winning for your enemy, or do you throw the contest – allowing ‘you'' to be victorious and bringing shame to your rival, at the expense of your own integrity, and without ever knowing who would have truly won?',	-1,	0,	1,	0,	0,	0,	0,	0,	1),
	(10, 'You''re in the body of your crush. So…they''re in yours? This is so awkward! You can''t do (or touch) anything that would embarrass them! You have to find yourself and switch back ASAP – and maybe fall in love in the process.',	0,	-1,	0,	-1,	0,	1,	0,	2,	0),
	(10, 'You''ve become your cat! Meanwhile, your body is acting crazy – well, crazy for a human anyway! You''d love to bask in the leisurely life of a housecat, but you have to follow your body around and make sure your cat doesn''t get you both killed with his mischievous and oblivious antics!',	0,	-1,	-1,	0,	-1,	0,	1,	0,	0),
	(10, 'You body swapped with your….mom?! What kind of anime is this, some lame Freaky Friday rip-off? You may as well do what all the anime parents do and take an indefinite overseas trip while your kid stays home alone! Aloha, Hawaii!',	2,	0,	0,	0,	0,	-1,	1,	0,	0),
	(10, 'You''re in the body of your school''s principal. You can''t wait to get to school and announce casual Fridays, a whole new lunch menu, and no more homework! Gotta take advantage of the situation now since you could switch back at any moment. Hmm…think there''s time to boost your grades and make yourself top of the class?!',	1,	0,	0,	0,	0,	0,	1,	0,	1),
	(11, 'Relentlessly nag them and play practical jokes on them – it''s the only way you know how to show your feelings! Besides, they''re cute when they''re flustered.',	0,	-1,	0,	0,	0,	0,	1,	0,	1),
	(11, 'You write them an epic poem about your love and leave it unsigned in their shoe locker. Since you''re obviously soulmates, they''ll know who it''s from…probably.',	0,	0,	1,	0,	0,	1,	0,	1,	0),
	(11, 'You''ll probably just trip and fall on top of them, landing in a tantalizing and compromising position – the classic anime meet-cute!',	1,	0,	-1,	0,	0,	0,	1,	0,	1),
	(11, 'You''re going to make them swoon by beating up all their enemies! Who wouldn''t develop romantic feelings for the person who just saved their life?',	0,	1,	0,	0,	0,	-1,	0,	0,	1),
	(11, 'You''ll get summoned to another world together, where unfamiliar lands and dangers will force you to work together…and fall in love.',	0,	0,	1,	0,	-2,	0,	0,	1,	0),
	(11, 'Simple – you''ll just kidnap them and hold them captive until they promise to love you and stay by your side forever!',	0,	2,	0,	1,	0,	-1,	0,	0,	2),
	(12, 'It was an accident; You thought you were in a full dive RPG! A gratuitously violent game, sure, but how were you supposed to know it was real?',	0,	1,	0,	0,	-1,	-1,	0,	0,	1),
	(12, 'Actually, you''re the one who started the game, and now you feel so alive! Bwahahaha!',	0,	2,	1,	1,	0,	-1,	0,	0,	3),
	(12, 'You had to enter the game. It was the only way to protect the one you love!',	-1,	0,	0,	-1,	0,	1,	0,	2,	0),
	(12, 'The winner becomes a god. Who can pass that up? You will rule this universe!',	0,	0,	1,	0,	-1,	0,	0,	0,	1),
	(12, 'So there was this girl – more like an angel – and she had the most beautiful body, and she was talking really fast and saying all these nice things about living in a castle together and…Oops. You might have been tricked.',	1,	0,	0,	-1,	0,	1,	0,	1,	0),
	(13, 'You''re a battle mage. You''ve mastered all of the elements. When the guild goes into battle, you are a second-line combatant, throwing fierce spells at your enemies while your tanks hold the front line.',	0,	1,	0,	0,	-1,	0,	0,	0,	1),
	(13, 'You just want everyone to be friends and get along! You plan to bring peace to the warring guilds using the healing power of music; gather your besties and get ready to sing, dance, and spread the love!',	-1,	-1,	0,	-2,	0,	1,	0,	0,	-1),
	(13, 'You''re a tank. You like being on the front lines, pounding your enemies into the dirt and whipping out some cool sword skills. Blades all day!',	0,	0,	0,	1,	0,	-1,	0,	0,	2),
	(13, 'You''d rather be the distraction and run around the enemy to make them lose focus, by whatever means necessary; flash them, release adorable furball creatures that stun them with cuteness, use a spell that causes everyone to slip and fall, launch slimes that deteriorate clothing, etc.',	1,	-1,	0,	0,	-1,	0,	2,	0,	0),
	(13, 'You''re a support magician. You help boost your guild''s stats, debuff your enemies, heal injuries, and cure status ailments.',	0,	-1,	0,	-1,	0,	1,	0,	0,	-1),
	(13, 'You''re the leader. You don''t always play a consistent role, but you involve yourself in all of them. You''re the one deciding how to keep everyone alive and take your guild to the next level.',	0,	0,	1,	0,	0,	1,	0,	0,	1),
	(13, 'Ugh, what is this, dungeons and dragons? That''s a hard pass for you, way too nerdy.',	1,	0,	0,	1,	2,	0,	1,	0,	0),
	(14, 'It was just you and your mom until she got remarried. Now she lives abroad with your new stepfather, and you live unsupervised in your old house with the hot new stepsibling you''ve just met…well this could be interesting! ;) ',	1,	-1,	0,	0,	-1,	0,	1,	2,	1),
	(14, 'Both of your parents travel for business. You actually have no idea what they do, and you couldn''t care less. You don''t need anyone, you can take care of yourself.',	0,	1,	0,	1,	0,	-1,	0,	0,	0),
	(14, 'What kind of question is this – your parents are always home. They''re just in another room...all the time…? Come to think, you haven''t actually seen them in years. But someone''s always leaving you leftovers, so they must be around here somewhere!',	2,	0,	0,	0,	0,	0,	1,	0,	0),
	(14, 'Both your parents are dead. You raise your younger sibling alone even though you''re only 16. Good thing you are unusually mature for your age, live in a time vortex so you can work two jobs and get straight A''s in school, and no one in your community pays attention.',	1,	1,	1,	0,	1,	0,	0,	0,	0),
	(14, 'You had parents in your old life, but ever since you got isekai''d, you''ve been on your own. You thought about them for about a day, but then you got distracted by living a way more awesome life.',	1,	0,	-1,	0,	-2,	-1,	1,	0,	0),
	(14, 'Never home?! You wish they would leave, maybe then you''d get some peace and quiet! Your family is always nagging you about living up to your potential and they''re way too interested in your romantic life.',	0,	1,	0,	1,	1,	0,	0,	1,	0),
	(15, 'You don''t accept it. You will go back and change the past, no matter what happens to you!',	-1,	0,	1,	-1,	-1,	1,	0,	0,	0),
	(15, 'You will dedicate the rest of your life to murderous vengeance!',	0,	2,	0,	1,	0,	-1,	0,	0,	2),
	(15,'You will cry, grieve, and eventually move on. Death and life go hand-in-hand. You can accept it.',	-1,	0,	1,	-1,	1,	0,	0,	0,	0),
	(15, 'Time to drink tons of alcohol until you forget everything!',	0,	0,	-1,	0,	0,	0,	1,	0,	1),
	(15, 'They left you a myriad of cryptic clues about how and why they died, so you have no choice but to unravel the mystery. You have to restore their honor!',	-1,	1,	1,	0,	-1,	1,	0,	0,	0);


	--Select * from questions
	--Select * from answers
	--Select * from questions join answers on questions.question_id = answers.question_id

	--Select SUM (sincerity_vs_satire_impact) from answers --s/b 5
	--Select SUM (light_vs_heavy_impact) from answers --s/b 9
	--Select SUM (surface_vs_depth_impact) from answers --s/b 10
	--Select SUM (optimism_vs_pessimism_impact) from answers --s/b 5
	--Select SUM (fantasy_vs_reality_impact) from answers --s/b -2
	--Select SUM (sentimentality_impact) from answers --s/b -4
	--Select SUM (humor_impact) from answers --s/b 20
	--Select SUM (romance_impact) from answers --s/b 22
	--Select SUM (controversy_impact) from answers --s/b 24