DROP DATABASE if exists eurocapi;
CREATE DATABASE eurocapi;
USE eurocapi;

DROP TABLE if exists post;
DROP TABLE if exists user;
DROP TABLE if exists capital; 

CREATE TABLE user(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password` CHAR(255) NOT NULL
);
CREATE TABLE capital(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL,
    `population` BIGINT NOT NULL,
    `language` VARCHAR(255) NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `currency` VARCHAR(30) NOT NULL,
    `description_title` VARCHAR(100) NOT NULL,
    `description_subtitle_1` VARCHAR(100) NOT NULL,
    `description_text_1` LONGTEXT NOT NULL,
    `description_subtitle_2` VARCHAR(100) NOT NULL,
    `description_text_2` LONGTEXT NOT NULL,
    `description_subtitle_3` VARCHAR(100) NOT NULL,
    `description_text_3` LONGTEXT NOT NULL
);
CREATE TABLE post(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `capital_id` INT UNSIGNED NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` LONGTEXT NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `local` TINYINT(1) NOT NULL,
    `date` DATE NOT NULL
);


CREATE TABLE activity(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `capital_id` INT UNSIGNED NOT NULL,
    `city`VARCHAR(100) NOT NULL,
    `title` VARCHAR(100) NOT NULL,
    `url1` VARCHAR(255) NOT NULL,
    `url2` VARCHAR(255) NOT NULL,
    `url3` VARCHAR(255) NOT NULL,
    `url4` VARCHAR(255) NOT NULL,
    `url5` VARCHAR(255) NOT NULL,
    `url6` VARCHAR(255) NOT NULL,
    `url7` VARCHAR(255) NOT NULL,
    `url8` VARCHAR(255) NOT NULL,
    `introduction` LONGTEXT NOT NULL,
    `price` DOUBLE(8, 2) NOT NULL,
    `description1` VARCHAR(255) NOT NULL,
    `description2` VARCHAR(255) NOT NULL,
    `description3` VARCHAR(255) NOT NULL,
    `description4` VARCHAR(255) NOT NULL,
    `description5` VARCHAR(255) NOT NULL,
    `what_to_expect` LONGTEXT NOT NULL,
    `transportation` LONGTEXT NOT NULL,
    `additional_Information` LONGTEXT NOT NULL,
    `cancellation` VARCHAR(255) NOT NULL
);


ALTER TABLE
    post ADD CONSTRAINT `post_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    post ADD CONSTRAINT `post_capital_id_foreign` FOREIGN KEY(`capital_id`) REFERENCES `capital`(`id`);
ALTER TABLE
    activity ADD CONSTRAINT `activity_capital_id_foreign` FOREIGN KEY(`capital_id`) REFERENCES `capital`(`id`);

INSERT INTO capital 
    (name, 
    country, 
    population, 
    language, 
    url, 
    currency, 
    description_title, 
    description_subtitle_1, 
    description_text_1, 
    description_subtitle_2, 
    description_text_2, 
    description_subtitle_3, 
    description_text_3)
VALUES
    (
        "Amsterdam", 
        "the Netherlands", 
        825080, 
        "Dutch", 
        "https://images.pexels.com/photos/14419920/pexels-photo-14419920.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "euro (EUR)", 
        "Amsterdam Unveiled: A Journey Through Culture and Charm",
        "Navigating Amsterdam's Cultural Tapestry",
        "Amsterdam's cultural diversity is a true testament to its status as a global city. From the iconic Rijksmuseum, housing masterpieces by Dutch masters like Rembrandt and Vermeer, to the thought-provoking Anne Frank House, where poignant stories of wartime resilience come to life, this guide provides insights that help you delve into the city's cultural treasures. Discover the intertwining threads of Amsterdam's past and present as you wander along its charming streets, passing by centuries-old buildings and lively markets. Immerse yourself in the Van Gogh Museum, where the genius of the renowned artist unfolds in a mesmerizing collection of his finest works, and embrace the vibrant nightlife that paints the city with a modern, energetic palette.",
        "Beyond Canals: Unveiling Hidden Gems",
        "While Amsterdam's iconic canals are a sight to behold, there's more to explore beyond their beauty. Discover the quaint neighborhood of Jordaan, where artisan boutiques and cozy cafes beckon, offering a taste of local life. Indulge in the delectable culinary scene, from hearty Dutch pancakes to tantalizing Indonesian rijsttafel. Uncover insider knowledge as you admire the innovative architecture at NDSM Wharf or cycle through Vondelpark, where nature's tranquility offers a respite from the urban hustle.",
        "Discover Amsterdam's Must-Visit Gems",
        "No visit to Amsterdam is complete without exploring its key attractions. Wander through the historic streets of Dam Square, where the Royal Palace and the Nieuwe Kerk stand as testaments to the city's regal past. Embark on a leisurely canal cruise to admire the charming canal houses and iconic bridges that have earned Amsterdam its «Venice of the North» nickname. Delight in the blooms at Keukenhof Gardens during tulip season, a dazzling display of vibrant colors that epitomizes Dutch springtime. And don't forget to soak in the cultural ambiance of Leidseplein, a lively square adorned with theaters, cafes, and street performances. As you traverse these key sites, Amsterdam's allure and enchantment will surely leave an indelible mark on your journey."
    ),
    (
        "Andorra la Vella",
        "Andorra",
        22205,
        "Catalan",
        "https://images.pexels.com/photos/5828197/pexels-photo-5828197.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "euro (EUR)",
        "Andorra Unveiled: Exploring the Heart of the Pyrenees",
        "Navigating Andorra la Vella's Unique Charms",
        "Nestled among the breathtaking Pyrenees mountains, Andorra la Vella stands as a captivating gem, inviting you to embark on an unforgettable journey through its rich culture and natural beauty. This guide leads you through the enchanting streets of the capital city, offering insights that reveal the tapestry of Andorra's history, traditions, and modern allure. From the iconic Casa de la Vall, a historic parliament building, to the inspiring Església de Sant Esteve, a Romanesque church that has witnessed centuries of devotion, this guide opens doors to Andorra la Vella's cultural treasures. Roam through charming alleys and bustling markets, discover the captivating stories behind its landmarks, and immerse yourself in a city that beautifully harmonizes tradition with the contemporary.",
        "Beyond City Limits: Exploring Natural Wonders",
        "While Andorra la Vella is a delightful urban hub, there's a world of natural wonders waiting to be explored just beyond its limits. Journey into the Pyrenees and embrace the exhilarating outdoor experiences that Andorra is renowned for. Lace up your hiking boots and trek along scenic trails that reveal panoramic vistas of rugged peaks and lush valleys. For thrill-seekers, winter brings the promise of world-class skiing and snowboarding on pristine slopes. As you venture through the surrounding landscapes, from the calming beauty of Engolasters Lake to the adventurous pursuits of Vallnord Bike Park, you'll discover that Andorra's allure extends far beyond the cityscape.",
        "Embracing Andorra la Vella's Essence",
        "To truly seize the essence of Andorra la Vella, you must immerse yourself in its unique blend of history, culture, and nature. Whether you're strolling through the vibrant Meritxell Avenue, where boutiques and cafes beckon, or exploring the Casa de la Vall's chambers that have witnessed the evolution of Andorra's governance, every step unveils a piece of this city's captivating story. Allow the aromas of traditional Andorran cuisine to guide you to local eateries, where hearty dishes like trinxat and escudella reflect the essence of the land. And, of course, no exploration is complete without a visit to Caldea, Europe's largest thermal spa, where relaxation and rejuvenation merge amidst modern architectural wonders. As you embrace the beauty and soul of Andorra la Vella, you'll discover that this small capital holds an irresistible allure that leaves a lasting imprint on your journey through the Pyrenees."
    ),
    (
        "Athens",
        "Greece",
        664046,
        "Greek",
        "https://images.pexels.com/photos/15238869/pexels-photo-15238869/free-photo-of-vacances-fita-estiu-viatjar.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "euro (EUR)",
        "Athens Unveiled: Embarking on a Journey through Ancient Splendor",
        "Navigating Athens' Historical and Cultural Tapestry",
        "With a history that spans millennia, Athens stands as a beacon of ancient splendor and modern vitality. This guide invites you to traverse the captivating streets of Greece's capital, where echoes of philosophers, poets, and warriors resound through the ruins. Explore the awe-inspiring Acropolis, where the Parthenon reigns majestically over the city, and delve into the treasures of the National Archaeological Museum, home to a breathtaking collection that chronicles Greece's rich past. Wander through the bustling Plaka district, where charming alleys and traditional tavernas create an atmosphere that bridges the gap between the past and the present. Athens' cultural tapestry comes to life as you journey from the historic Odeon of Herodes Atticus to the vibrant Monastiraki Square, revealing a city that proudly wears its history on its sleeve.",
        "Beyond Ancient Ruins: Embracing the Modern Spirit",
        "While Athens is renowned for its ancient heritage, its modern spirit is equally captivating. Immerse yourself in the vibrant atmosphere of Syntagma Square, where the Hellenic Parliament and the Tomb of the Unknown Soldier stand as symbols of Greece's enduring democracy. Stroll through the Athens Central Market, where colorful displays of fresh produce, spices, and local delicacies showcase the city's culinary diversity. Indulge in the arts at the Stavros Niarchos Foundation Cultural Center, a contemporary marvel that hosts world-class performances and exhibitions. As you explore the modern facets of Athens, you'll discover a city that gracefully harmonizes its storied past with its dynamic present.",
        "Embracing Greek Flavors and Sunset Serenity",
        "To truly unveil Athens' essence, you must delve into its treasures and immerse yourself in its vibrant culture. Savor the flavors of Greek cuisine, from the tangy allure of tzatziki to the savory embrace of moussaka. Traverse the historic Agora, once the heart of Athenian life, and imagine the philosophical debates that once echoed through its columns. Wander through the charming neighborhoods of Anafiotika and Exarcheia, each offering a distinct perspective on the city's character. And don't miss the opportunity to witness a breathtaking sunset from the summit of Lycabettus Hill, casting a golden glow over the city that has inspired poets and dreamers for centuries. Athens' allure is boundless, inviting you to embark on a journey that weaves together ancient marvels and contemporary wonders, leaving an indelible mark on your exploration of Greece's captivating capital."
    ),
    (
        "Belgrade",
        "Republic of Serbia",
        1387422,
        "Serbian",
        "https://images.unsplash.com/photo-1613601740367-410ae03b2ec7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
        "dinar (RSD)",
        "Belgrade Unveiled: Embracing the Soul of the Balkans",
        "Navigating Belgrade's Historic and Cultural Mosaic",
        "At the crossroads of the Balkans, Belgrade beckons with a rich tapestry of history, culture, and resilience. This guide invites you to traverse the dynamic streets of Serbia's capital, where the confluence of influences has shaped a city that wears its scars and triumphs proudly. Explore the formidable Kalemegdan Fortress, where centuries of conquests and battles have left their mark, and venture into the depths of the Belgrade Underground, a labyrinth of tunnels that whispers tales of past eras. Delve into the heart of Belgrade's creative scene at the Mikser House, a hub for art, design, and innovation, and wander through the historic Skadarlija district, where cobblestone streets and traditional kafanas invite you to relish the city's bohemian spirit.",
        "Beyond Urban Charms: Discovering Natural Oases",
        "While Belgrade's urban charms are captivating, there's a world of natural beauty awaiting your exploration. Embrace the tranquility of Ada Ciganlija, a lush peninsula surrounded by the shimmering waters of Lake Sava, offering a perfect escape for leisure and recreation. Discover the majesty of Avala Mountain, where the iconic Avala Tower offers panoramic views of the city and beyond. Or venture to the confluence of the Sava and Danube rivers, where the Great War Island's wetlands provide a haven for diverse wildlife. Amidst the city's hustle and bustle, these natural oases offer a serene respite that highlights the harmonious blend of urban and natural elements that define Belgrade.",
        "Market Buzz and Nocturnal Revelry",
        "To truly unveil Belgrade's essence, you must immerse yourself in its captivating character and diverse spirit. Indulge in the bold flavors of Serbian cuisine, from hearty pljeskavica to the comforting embrace of sarma. Engage with the locals at the bustling Kalenic Market, where the vibrancy of daily life unfolds in a colorful array of produce and artisanal goods. Explore the Nikola Tesla Museum, a tribute to the visionary inventor whose legacy resonates through the city's veins. And, as night falls, experience the renowned Belgrade nightlife, where the beats of its music scene reverberate through riverside clubs and hidden bohemian venues. Belgrade's allure lies in its ability to be both a historical crossroads and a modern playground, inviting you to uncover its layers and celebrate its unbreakable spirit as you navigate its captivating streets."
    ),
    (
        "Berlin",
        "Germany",
        3644826,
        "German",
        "https://images.pexels.com/photos/9392358/pexels-photo-9392358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "euro (EUR)",
        "Berlin Unveiled: A Fusion of History and Modernity",
        "Navigating Berlin's Historical and Cultural Kaleidoscope",
        "Berlin, a city steeped in history and pulsating with modern energy, invites you to embark on a captivating journey through its multifaceted streets. This guide leads you through the remnants of the Berlin Wall, a poignant symbol of the city's divided past, and into the grandeur of the Brandenburg Gate, an emblem of unity and rebirth. Explore the somber yet powerful Holocaust Memorial, a testament to remembrance and reflection, and indulge in the world-class art collections of Museum Island, a treasure trove that spans centuries and styles. Traverse the charming lanes of Nikolaiviertel, Berlin's oldest district, and immerse yourself in the creativity and innovation that thrive within the urban canvas of this remarkable capital.",
        "Beyond Urban Frontiers: Embracing Modern Vistas",
        "While Berlin's historical landmarks are captivating, the city's modern spirit offers a contrasting allure. Experience the architectural wonder of the Reichstag Building, where historic significance merges seamlessly with contemporary design. Stroll along the trendy Hackescher Markt, a district where art galleries, boutiques, and cafés create an artistic ambiance. Delve into the dynamic atmosphere of Potsdamer Platz, a hub of entertainment and commerce that reflects Berlin's ever-evolving identity. Amidst the city's bustling streets, discover the East Side Gallery, an open-air gallery that adorns a surviving stretch of the Berlin Wall with vibrant murals, representing a collective expression of hope and transformation.",
        "Embarking on Berlin's Cultural Odyssey",
        "To truly embrace Berlin's essence, you must immerse yourself in its vibrant culture and multifaceted character. Relish the culinary diversity that graces the city, from traditional currywurst to international fusion cuisine. Engage with the locals at the Mauerpark Flea Market, where vintage treasures and musical performances create an electric atmosphere. Explore the technological wonders of the Futurium, a museum that delves into the possibilities of tomorrow. And as the day transitions into night, venture into the heart of Berlin's nightlife, where a myriad of clubs, from historic venues to cutting-edge spaces, offer an unforgettable nocturnal adventure. Berlin's allure lies in its ability to bridge the gap between its tumultuous past and its vibrant present, inviting you to unravel its layers and celebrate its continuous journey of reinvention."
    ),
    (
        "Bern",
        "Switzerland",
        134794,
        "German, French",
        "https://images.pexels.com/photos/9214052/pexels-photo-9214052.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "franc (CHF)",
        "Bern Unveiled: Where History and Modernity Converge",
        "Navigating Bern's Historical and Cultural Treasures",
        "Bern, the charming capital of Switzerland, extends a warm invitation to embark on a captivating journey through its rich history and vibrant present. This guide leads you through the iconic Zytglogge clock tower, a living testament to medieval craftsmanship, and into the grandeur of the Federal Palace, where the country's democracy takes center stage. Explore the cobbled streets of the Old Town, a UNESCO World Heritage site, and immerse yourself in the cultural treasures of the Bern Historical Museum, where Swiss heritage comes to life through art and artifacts. Wander along the Aare River, where nature's serenity blends harmoniously with the city's architectural elegance, and uncover the essence of Bern's timeless allure.",
        "Beyond the Facade: Discovering Modern Charms",
        "While Bern's historical landmarks hold undeniable allure, the city's modernity offers a compelling counterpoint. Experience the immersive wonder of the Zentrum Paul Klee, a museum dedicated to the iconic Swiss painter, where innovative exhibitions captivate the senses. Stroll through the lively Bundesplatz, a central square that transforms with the seasons, hosting markets, festivals, and political gatherings. Delve into the vibrant culture of Bern's «Matte» district, where local eateries, artisan boutiques, and art studios converge, offering a glimpse into the contemporary pulse of the city. Amidst the architectural splendor of Bern, modern facets come to life, adding layers of intrigue to your exploration.",
        "Embracing Bern's Flavors and Traditions",
        "To fully embrace Bern's essence, you must savor its culinary delights and partake in its time-honored traditions. Indulge in the Swiss fondue experience, where melted cheese becomes a communal delight, or sample Bern's delectable «Älplermagronen», a comforting dish that embodies the region's Alpine heritage. Engage with the locals at the Federal Palace's weekly market, where fresh produce and artisanal creations thrive. Immerse yourself in the city's Fasnacht carnival, a lively celebration of music, costumes, and merriment. As the sun sets over the medieval skyline, relish the tranquil beauty of the Rosengarten, a rose garden that offers panoramic views of Bern's rooftops and distant peaks. Bern's allure lies in its harmonious blend of past and present, inviting you to immerse yourself in its multifaceted charm and create lasting memories in the heart of Switzerland."
    ),
    (
        "Bratislava",
        "Slovakia",
        435296,
        "Slovak",
        "https://images.pexels.com/photos/10137863/pexels-photo-10137863.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "euro (EUR)",
        "Bratislava Unveiled: Where Past Meets Present with Elegance",
        "Navigating Bratislava's Historical and Cultural Splendor",
        "Bratislava, the capital of Slovakia, extends a warm invitation to explore its enchanting blend of history and modernity. This guide leads you through the medieval charm of the Bratislava Castle, a silent witness to centuries of transformation, and into the heart of St. Martin's Cathedral, a testament to architectural mastery and spiritual significance. Immerse yourself in the captivating atmosphere of the Old Town, where cobblestone streets lead to quaint squares adorned with elegant facades. Discover the Slovak National Theatre, a cultural beacon that offers artistic performances against a backdrop of grandeur. As you wander along the Danube River, the harmony between the city's storied past and its vibrant present comes to life, offering a glimpse into Bratislava's enduring allure.",
        "Beyond the Facade: Embracing Modern Vibes",
        "While Bratislava's historical gems are captivating, the city's modern spirit adds a dynamic dimension to your journey. Experience the innovative design of the UFO Observation Deck, an architectural marvel that provides panoramic views of the city and beyond. Stroll through Eurovea, a modern riverside complex where shopping, dining, and entertainment converge seamlessly. Delve into the art scene at the Nedbalka Gallery, where Slovak contemporary art takes center stage, offering a fresh perspective on the city's creative vitality. Amidst the historical charm, Bratislava's modernity offers a delightful contrast that enriches your exploration.",
        "Embracing Bratislava's Flavors and Traditions",
        "To fully embrace Bratislava's essence, immerse yourself in its culinary delights and cherished traditions. Savor traditional Slovak dishes such as «bryndzové halušky», where dumplings and sheep's cheese create a hearty delight, or indulge in the sweet pleasures of a «Rusín» pastry. Engage with the locals at the bustling farmers' markets, where regional produce and handicrafts showcase the city's authenticity. Immerse yourself in the vibrant atmosphere of Bratislava's annual Coronation Celebration, a lively reenactment of historical events complete with period costumes and festivities. As the sun sets behind Bratislava Castle, take a leisurely stroll along the Danube promenade, where the illuminated cityscape mirrors the harmony between its storied history and its vibrant present. Bratislava's allure lies in its ability to seamlessly blend the old with the new, inviting you to uncover its layers and create cherished memories in the heart of Slovakia."
    ),
    (
        "Brussels",
        "Belgium",
        177307,
        "French, Dutch",
        "https://images.pexels.com/photos/3847431/pexels-photo-3847431.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "euro (EUR)",
        "Brussels Unveiled: Embracing Belgium's Multicultural Heart",
        "Navigating Brussels' Historical and Cultural Mosaic",
        "Brussels, the captivating heart of Belgium and the European Union, invites you on a remarkable journey that weaves together history and diversity. This guide leads you through the architectural splendor of the Grand Place, a UNESCO World Heritage site, and into the inspiring realm of the Atomium, a futuristic monument that symbolizes progress and unity. Wander the cobbled streets of the Sablon district, where historic charm meets contemporary art galleries, and bask in the elegance of the Royal Palace, a regal masterpiece nestled in the heart of the city. As you explore the vibrant neighborhoods, each with its own distinct character, you'll come to appreciate how Brussels seamlessly melds its storied past with the multicultural tapestry that defines its present.",
        "Beyond the Facade: Embracing Global Vibes",
        "While Brussels' historical landmarks are captivating, the city's international essence offers an exciting twist to your exploration. Immerse yourself in the vibrant atmosphere of the European Quarter, where modern architecture houses institutions that shape the continent's future. Stroll through Parc du Cinquantenaire, where the grand triumphal arch stands as a testament to Belgium's rich heritage. Delve into the avant-garde scene at Wiels Contemporary Art Centre, where thought-provoking exhibitions redefine artistic boundaries. Amidst the city's historical grandeur, Brussels' global perspective adds a layer of intrigue that invites you to expand your horizons.",
        "Embracing Brussels' Flavors and Traditions",
        "To fully embrace Brussels' essence, immerse yourself in its culinary delights and cherished customs. Delight in the «gaufres de Liège», a treat of fluffy waffles adorned with caramelized sugar, or explore the world of Belgian chocolates, where artistry meets indulgence. Engage with the locals at the lively Marolles Flea Market, where vintage treasures and eclectic trinkets tell stories of bygone eras. Immerse yourself in the festive spirit of the biennial Flower Carpet event, where the Grand Place transforms into a fragrant tapestry of blossoms. As the sun sets over the city's enchanting landmarks, savor a leisurely dinner at a traditional brasserie, sipping on «gueuze» while relishing the fusion of flavors that mirror Brussels' cultural amalgamation. Brussels' allure lies in its ability to be a meeting point of cultures, a place where the old and the new, the local and the global, converge harmoniously, inviting you to unravel its layers and create lasting memories at the heart of Europe."
    ),
    (
        "Bucharest",
        "Romania",
        1823526,
        "Romanian",
        "https://images.unsplash.com/photo-1643786852373-d3093da7a40d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1544&q=80",
        "leu (RON)",
        "Bucharest Unveiled: Embracing Romania's Dynamic Capital",
        "Navigating Bucharest's Historical and Cultural Splendor",
        "Bucharest, the dynamic capital of Romania, beckons you to embark on a captivating journey through its rich history and vibrant culture. This guide leads you through the opulent halls of the Palace of the Parliament, an architectural marvel that tells the story of a nation's aspirations. Venture into the heart of the Old Town, where centuries-old churches and charming streets evoke a sense of nostalgia. Discover the artistry of the Romanian Athenaeum, a cultural beacon that hosts symphonies and performances, and wander through Herastrau Park, where nature's tranquility offers respite amidst the urban hustle. As you explore Bucharest's diverse neighborhoods and landmarks, you'll uncover the essence of a city that blends tradition with modernity.",
        "Beyond the Facade: Embracing Contemporary Vibes",
        "While Bucharest's historical charm is alluring, the city's contemporary pulse offers a fascinating contrast. Immerse yourself in the creative atmosphere of the National Museum of Contemporary Art, where thought-provoking exhibitions redefine artistic boundaries. Stroll along Victoriei Avenue, where modern boutiques and cafes converge with historic architecture. Delve into the trendy Lipscani district, a hub of art, design, and entertainment, where the spirit of innovation thrives. Amidst Bucharest's architectural diversity, the city's contemporary spirit adds a layer of excitement to your exploration.",
        "Embracing Bucharest's Flavors and Traditions",
        "To fully embrace Bucharest's essence, indulge in its culinary treasures and cherished customs. Savor the «mămăligă», a traditional dish of polenta served with various accompaniments, or delight in the iconic «sarmale», cabbage rolls filled with flavorful mixtures. Engage with the locals at the bustling Obor Market, where a colorful array of produce and artisanal goods reflects Bucharest's authenticity. Immerse yourself in the vibrant energy of the annual George Enescu International Festival, a celebration of classical music that echoes through the city's streets. As the sun sets over the majestic Parliament Palace, join the locals in a leisurely evening stroll along the Dâmbovița River, where the city's lights shimmer on the water's surface, epitomizing the fusion of Bucharest's past, present, and future. Bucharest's allure lies in its ability to be a captivating blend of old-world charm and contemporary spirit, inviting you to uncover its layers and create unforgettable memories in the heart of Romania."
    ),
    (
        "Budapest",
        "Hungary",
        1737026,
        "Hungarian",
        "https://images.pexels.com/photos/15552883/pexels-photo-15552883/free-photo-of-hungarian-parliament-building.jpeg",
        "forint (HUF)",
        "Budapest Unveiled: Embracing Hungary's Enchanting Capital",
        "Navigating Budapest's Historical and Cultural Splendor",
        "Budapest, the enchanting capital of Hungary, extends a warm invitation to embark on a captivating journey through its rich history and vibrant culture. This guide leads you through the majestic expanse of Buda Castle, perched atop Castle Hill, and into the ornate beauty of the Hungarian Parliament Building, a symbol of national pride. Wander through the charming alleys of the Castle District, where medieval charm meets modern boutiques, and immerse yourself in the artistic riches of the Hungarian National Museum. Discover the thermal wonders of Széchenyi Bath, a testament to Budapest's spa heritage, and stroll along the Danube Promenade, where the river's embrace showcases the city's enduring allure.",
        "Beyond the Facade: Embracing Contemporary Vibes",
        "While Budapest's historical allure is captivating, the city's contemporary energy offers an exciting contrast. Immerse yourself in the innovative realm of Müpa Budapest, a cultural complex that hosts a diverse array of artistic performances and exhibitions. Stroll along the bustling Váci Street, a hub of shopping and entertainment that blends tradition with modernity. Delve into the creative heart of the Jewish Quarter, where street art and ruin bars create a dynamic urban canvas. Amidst Budapest's architectural splendor, the city's modern pulse adds an extra layer of excitement to your exploration.",
        "Embracing Budapest's Flavors and Traditions",
        "To fully embrace Budapest's essence, indulge in its culinary treasures and time-honored customs. Savor the iconic «gulyás», a hearty Hungarian stew, or delight in the mouthwatering pastries of a traditional Hungarian bakery. Engage with the locals at the bustling Great Market Hall, where the scents and colors of fresh produce and handicrafts create a vibrant atmosphere. Immerse yourself in the lively atmosphere of the Budapest Wine Festival, a celebration of Hungary's viticultural heritage. As the sun sets over the city's iconic Chain Bridge, take a leisurely evening cruise on the Danube River, where the illuminated skyline reflects the harmonious blend of Budapest's rich history and its modern spirit. Budapest's allure lies in its ability to be a captivating fusion of old-world charm and contemporary vibrancy, inviting you to uncover its layers and create cherished memories in the heart of Hungary."
    ),
    (
        "Chisinau",
        "Moldova",
        339079,
        "Romanian",
        "https://images.unsplash.com/photo-1629045951387-6d86eb2aad3d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
        "leu (MDL)",
        "Chisinau Unveiled: Embracing Moldova's Hidden Gem",
        "Navigating Chisinau's Historical and Cultural Tapestry",
        "Chisinau, the hidden gem of Moldova, invites you to embark on a journey through its rich history and vibrant culture. This guide leads you through the elegant beauty of the Nativity Cathedral, a symbol of spiritual significance, and into the heart of the Central Market, where local flavors and traditions converge. Wander through the serene Valea Morilor Park, a tranquil oasis amidst the city's hustle, and explore the cherished artifacts of the National Museum of Ethnography and Natural History. Discover the unique architecture of Chisinau's neighborhoods, each telling a story of resilience and transformation, and as you traverse the city's streets, you'll uncover the essence of a place that blends heritage with modernity.",
        "Beyond the Facade: Embracing Local Charms",
        "While Chisinau's historical landmarks are captivating, the city's local charm offers an intimate perspective. Immerse yourself in the warmth of Chisinau's hospitality as you explore its authentic cafes and markets, where the locals gather and stories are exchanged. Stroll through the lively Stefan cel Mare Park, a popular meeting place, and experience the vibrant arts scene at the National Opera and Ballet Theatre. Delve into the heart of Chisinau's winemaking tradition with a visit to a local winery, where you can taste the fruits of Moldova's centuries-old viticulture. Amidst Chisinau's unassuming beauty, its local character adds a layer of authenticity to your exploration.",
        "Embracing Chisinau's Flavors and Traditions",
        "To fully embrace Chisinau's essence, immerse yourself in its culinary treasures and cherished customs. Savor the «mămăligă», a traditional dish made from maize, often accompanied by local cheese and sour cream. Engage with the locals at the bustling Piata Centrala, where fresh produce and handicrafts create a vibrant atmosphere. Immerse yourself in the festive atmosphere of Moldova's wine festivals, celebrating the nation's rich winemaking heritage. As the sun sets over Chisinau's picturesque skyline, take a leisurely stroll along the charming Bulevardul Ştefan cel Mare, where the city's lights twinkle like stars, reflecting the seamless blend of old-world traditions and modern aspirations. Chisinau's allure lies in its ability to be a true reflection of Moldova's spirit, inviting you to uncover its layers and create lasting memories in this unique corner of the world."
    ),
    (
        "Copenhagen",
        "Denmark",
        638790,
        "Danish",
        "https://images.pexels.com/photos/5193476/pexels-photo-5193476.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "krone (DKK)",
        "Copenhagen Unveiled: Embracing Denmark's Coastal Gem",
        "Navigating Copenhagen's Historical and Cultural Marvels",
        "Copenhagen, Denmark's coastal treasure, beckons you to embark on a captivating journey through its rich history and contemporary culture. This guide leads you through the regal elegance of Rosenborg Castle, a testament to Danish royalty, and into the iconic embrace of The Little Mermaid sculpture, a symbol of fairy-tale inspiration. Wander through the vibrant Nyhavn Harbor, where colorful facades and lively waterfront cafes create an inviting atmosphere. Immerse yourself in the artistry of the Ny Carlsberg Glyptotek, where classical and modern masterpieces entwine, and explore the innovative architecture of the Black Diamond, home to the Royal Danish Library. As you explore Copenhagen's charming streets, you'll unveil the essence of a city that seamlessly blends tradition with modernity.",
        "Beyond the Facade: Embracing Progressive Flair",
        "While Copenhagen's historical charm is captivating, the city's progressive spirit offers a fascinating contrast. Immerse yourself in the sustainability-focused atmosphere of Christiania, a self-governing commune that embodies alternative living. Stroll through the vibrant Meatpacking District, where former slaughterhouses have transformed into a hub of creativity, offering galleries, boutiques, and eateries. Delve into the contemporary art scene at the Louisiana Museum of Modern Art, where coastal landscapes complement cutting-edge exhibitions. Amidst Copenhagen's architectural elegance, the city's forward-thinking approach adds an exciting layer to your exploration.",
        "Embracing Copenhagen's Flavors and Traditions",
        "To fully embrace Copenhagen's essence, immerse yourself in its culinary delights and cherished customs. Savor the beloved «smørrebrød», an open-faced sandwich adorned with an array of delectable toppings, or indulge in traditional Danish pastries, such as «wienerbrød». Engage with the locals at the bustling Torvehallerne market, where fresh produce, artisanal goods, and international flavors create a dynamic food scene. Immerse yourself in the festive atmosphere of Tivoli Gardens, one of the world's oldest amusement parks, where entertainment and enchantment intertwine. As the sun sets over Copenhagen's waterfront, enjoy a leisurely canal cruise, where the city's illuminated landmarks reflect the harmonious blend of its rich heritage and contemporary spirit. Copenhagen's allure lies in its ability to be a captivating juxtaposition of old-world charm and modern innovation, inviting you to uncover its layers and create cherished memories along the shores of Denmark."
    ),
    (
        "Dublin",
        "Ireland",
        544197,
        "English, Irish",
        "https://cdn.pixabay.com/photo/2021/11/16/17/33/dublin-6801635_1280.jpg",
        "euro (EUR)",
        "Dublin Explored: Embracing Ireland's Literary Heart",
        "Navigating Dublin's Literary and Cultural Landscape",
        "Dublin, the spirited heart of Ireland, invites you on a captivating journey through its rich literary heritage and vibrant culture. This guide leads you through the historic halls of Trinity College, where the Book of Kells and Long Room celebrate centuries of scholarly achievement. Venture into the cobblestone streets of Temple Bar, a cultural quarter where galleries, pubs, and street performances thrive, and immerse yourself in the pages of history at Dublin Castle. Explore the tranquility of St. Stephen's Green, an urban oasis that embodies Dublin's connection with nature, and uncover the city's essence as a beacon of Irish creativity and thought.",
        "Beyond the Pages: Embracing Contemporary Charms",
        "While Dublin's literary legacy is enchanting, the city's contemporary energy offers a vibrant contrast. Immerse yourself in the cosmopolitan atmosphere of Grafton Street, a bustling hub of shopping, entertainment, and people-watching. Stroll along the revitalized River Liffey, where modern architecture and innovative design reflect Dublin's evolving identity. Delve into the modern art scene at the Irish Museum of Modern Art, housed in the historic Royal Hospital Kilmainham. Amidst the city's historic cobblestones, Dublin's modern spirit adds a layer of excitement and exploration.",
        "Embracing Dublin's Flavors and Traditions",
        "To fully embrace Dublin's essence, indulge in its culinary treasures and cherished customs. Savor traditional Irish dishes like «coddle», a hearty stew, or the iconic «full Irish breakfast», a hearty morning feast. Engage with the locals at the vibrant Temple Bar Food Market, where a kaleidoscope of flavors and artisanal goods awaits. Immerse yourself in the convivial atmosphere of a traditional Irish pub, where live music and storytelling create a sense of community. As the sun sets over Dublin's iconic Ha'penny Bridge, take a leisurely stroll along the River Liffey's boardwalk, where the city's lights dance on the water's surface, reflecting the harmonious blend of Dublin's rich history and its contemporary vibrancy. Dublin's allure lies in its ability to be a living testament to the past and a canvas for modern expression, inviting you to uncover its layers and create treasured memories in the heart of Ireland."
    ),
    (
        "Helsinki",
        "Finland",
        656920,
        "Finnish",
        "https://images.pexels.com/photos/3581820/pexels-photo-3581820.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "euro (EUR)",
        "Helsinki Explored: Embracing Finland's Nordic Charisma",
        "Navigating Helsinki's Cultural and Architectural Landscape",
        "Helsinki, the captivating capital of Finland, beckons you to embark on a captivating journey through its rich cultural tapestry and architectural splendor. This guide leads you through the neoclassical elegance of Senate Square, where the Helsinki Cathedral stands as a symbol of national identity, and into the contemporary brilliance of the Kamppi Chapel, a sanctuary of tranquility amidst the urban bustle. Wander through the vibrant Design District, where Finnish creativity thrives in boutiques, galleries, and cafes, and immerse yourself in the cultural treasures of the National Museum of Finland. Explore the serene beauty of Suomenlinna, a UNESCO World Heritage site spread across islands, and as you navigate Helsinki's diverse neighborhoods, you'll uncover the essence of a city that seamlessly blends tradition with modern innovation.",
        "Beyond the Facades: Embracing Contemporary Charms",
        "While Helsinki's historical landmarks are captivating, the city's modern spirit offers a captivating contrast. Immerse yourself in the innovative atmosphere of the Oodi Central Library, a hub of learning, creativity, and community. Stroll along the picturesque shores of the Baltic Sea, where modern urban planning meets natural beauty at the vibrant Hietaranta Beach. Delve into the modern art scene at the Kiasma Museum of Contemporary Art, where thought-provoking exhibitions redefine artistic boundaries. Amidst Helsinki's architectural gems, the city's contemporary flair adds an exciting layer to your exploration.",
        "Embracing Helsinki's Flavors and Traditions",
        "To fully embrace Helsinki's essence, indulge in its culinary treasures and cherished customs. Savor traditional Finnish dishes like «kalakukko», a savory fish pie, or «karjalanpiirakka», a Karelian pastry. Engage with the locals at the bustling Old Market Hall, where a tantalizing array of fresh produce, seafood, and local delicacies await. Immerse yourself in the joyous atmosphere of the Vappu festival, a celebration of spring and labor, where picnics, parades, and merriment fill the streets. As the sun sets over the serene Helsinki coastline, take a leisurely stroll along the Esplanade Park, where the city's lights twinkle like stars, reflecting the harmonious blend of Helsinki's rich heritage and its contemporary charm. Helsinki's allure lies in its ability to be a haven of tradition and a playground of modernity, inviting you to uncover its layers and create cherished memories in the heart of Finland."
    ),
    (
        "Kiev",
        "Ukrain",
        2893215,
        "Ukranian",
        "https://images.pexels.com/photos/12932192/pexels-photo-12932192.jpeg",
        "hryvnia (UAH)",
        "Kiev Explored: Embracing Ukraine's Historic Heart",
        "Navigating Kiev's Cultural and Architectural Riches",
        "Kiev, the historic heart of Ukraine, extends a warm invitation to embark on a captivating journey through its rich cultural tapestry and architectural wonders. This guide leads you through the golden domes of St. Sophia's Cathedral, a UNESCO World Heritage site that embodies centuries of spiritual significance, and into the grandeur of Kyiv Pechersk Lavra, a complex of monasteries and caves that stand as a testament to the nation's heritage. Wander through the charming streets of Andriyivsky Uzviz, where bohemian spirit meets artisanal treasures, and immerse yourself in the artistic treasures of the National Museum of Ukrainian History. Discover the tranquility of Mariyinsky Park, where nature and history intertwine, and as you traverse Kiev's neighborhoods, you'll unveil the essence of a city that embraces its past while looking toward the future.",
        "Beyond the Facades: Embracing Contemporary Charms",
        "While Kiev's historical allure is captivating, the city's contemporary energy adds a vibrant twist. Immerse yourself in the modernity of the Maidan Nezalezhnosti, Kiev's central square, where gatherings and events reflect the nation's aspirations. Stroll along Khreshchatyk Street, Kiev's main boulevard, where bustling shops, cafes, and vibrant street life create an energetic ambiance. Delve into the modern art scene at the PinchukArtCentre, where innovative exhibitions captivate the senses. Amidst Kiev's architectural marvels, the city's modern vibrancy adds an extra layer of intrigue to your exploration.",
        "Embracing Kiev's Flavors and Traditions",
        "To fully embrace Kiev's essence, indulge in its culinary treasures and cherished customs. Savor traditional Ukrainian dishes like «borscht», a hearty beet soup, or «varenyky», delicious dumplings with various fillings. Engage with the locals at the bustling Bessarabsky Market, where fresh produce and artisanal products create a vibrant tapestry of flavors. Immerse yourself in the festive atmosphere of the Vyshyvanka Festival, a celebration of traditional Ukrainian embroidery and culture. As the sun sets over the picturesque Dnipro River, take a leisurely walk along the Khreshchatyi Park, where the city's lights twinkle like stars, reflecting the harmonious blend of Kiev's rich history and its contemporary vitality. Kiev's allure lies in its ability to be a bridge between old and new, inviting you to uncover its layers and create cherished memories in the heart of Ukraine."
    ),
    (
        "Lisbon",
        "Portugal",
        509564,
        "Portuguese",
        "https://images.pexels.com/photos/4633656/pexels-photo-4633656.jpeg",
        "euro (EUR)",
        "Lisbon Explored: Embracing Portugal's Coastal Charm",
        "Navigating Lisbon's Historical and Cultural Treasures",
        "Lisbon, the captivating capital of Portugal, extends a warm invitation to embark on a captivating journey through its rich history and vibrant culture. This guide leads you through the iconic Belem Tower, a maritime marvel that tells tales of exploration, and into the enchanting interior of Jeronimos Monastery, a UNESCO World Heritage site that embodies centuries of spiritual significance. Wander through the narrow streets of Alfama, where traditional fado music and charming taverns create an intimate ambiance, and immerse yourself in the captivating collections of the National Museum of Ancient Art. Discover the breathtaking views from São Jorge Castle, where ancient walls stand as guardians of Lisbon's storied past, and as you explore the city's neighborhoods, you'll uncover the essence of a place that merges history with a modern outlook.",
        "Beyond the Facades: Embracing Modern Vibes",
        "While Lisbon's historical landmarks are captivating, the city's modern spirit offers an exciting contrast. Immerse yourself in the innovative atmosphere of the LX Factory, a creative hub housed in a former industrial complex, where art, design, and gastronomy flourish. Stroll along the waterfront at Parque das Nações, where modern architecture and leisure spaces harmonize with the Tagus River. Delve into the contemporary art scene at the Berardo Collection Museum, where international masterpieces provoke thought and dialogue. Amidst Lisbon's historic charm, the city's modernity offers a fresh layer of excitement to your exploration.",
        "Embracing Lisbon's Flavors and Traditions",
        "To fully embrace Lisbon's essence, indulge in its culinary treasures and cherished customs. Savor traditional Portuguese dishes like «bacalhau à Brás», a savory codfish creation, or «pasteis de nata», delectable custard tarts that are a true local delight. Engage with the locals at the bustling Mercado da Ribeira, where diverse food stalls and artisanal products create a vibrant tapestry of flavors. Immerse yourself in the festive atmosphere of Lisbon's traditional festivals, such as Santo António, a celebration of music, dance, and community spirit. As the sun sets over the tranquil waters of the Tagus, take a leisurely tram ride through the historic streets of Lisbon, where the city's illuminated landmarks reflect the harmonious blend of its rich heritage and its contemporary allure. Lisbon's allure lies in its ability to be a captivating fusion of past and present, inviting you to uncover its layers and create cherished memories along Portugal's stunning coastline."
    ),
    (
        "Ljubljana",
        "Slovenia",
        285604,
        "Slovene",
        "https://images.unsplash.com/photo-1599925355047-669e976bcd69?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
        "euro (EUR)",
        "Ljubljana Explored: Embracing Slovenia's Enchanting Capital",
        "Navigating Ljubljana's Historical and Cultural Delights",
        "Ljubljana, the enchanting capital of Slovenia, invites you on a captivating journey through its rich history and vibrant culture. This guide leads you through the charming alleys of the Old Town, where medieval architecture and picturesque squares exude a timeless allure, and into the splendor of Ljubljana Castle, perched on a hill overlooking the city. Wander through the vibrant atmosphere of Prešeren Square, where the iconic Triple Bridge connects the past and present, and immerse yourself in the artistry of the National Gallery of Slovenia. Discover the tranquility of Tivoli Park, a haven of greenery and art, and as you explore Ljubljana's neighborhoods, you'll uncover the essence of a city that celebrates tradition while embracing modernity.",
        "Beyond the Facades: Embracing Local Charms",
        "While Ljubljana's historical charm is captivating, the city's local character offers an intimate perspective. Immerse yourself in the warmth of Ljubljana's cafes, where locals gather for coffee and conversation, and stroll along the banks of the emerald-green Ljubljanica River, where outdoor markets and vibrant street art create a dynamic ambiance. Delve into the contemporary art scene at the Museum of Modern Art, where Slovenian and international works captivate the imagination. Amidst Ljubljana's architectural gems, the city's local vibrancy adds an extra layer of authenticity to your exploration.",
        "Embracing Ljubljana's Flavors and Traditions",
        "To fully embrace Ljubljana's essence, indulge in its culinary treasures and cherished customs. Savor traditional Slovenian dishes like «kranjska klobasa», a savory sausage, or «potica», a delectable nut-filled pastry. Engage with the locals at the bustling Central Market, where fresh produce, artisanal goods, and a bustling atmosphere reflect Ljubljana's authenticity. Immerse yourself in the festive atmosphere of Ljubljana Castle's Summer Nights, a cultural celebration of music, theater, and open-air gatherings. As the sun sets over the Ljubljana Castle's towers, take a leisurely boat cruise along the river, where the city's lights dance on the water's surface, reflecting the harmonious blend of Ljubljana's rich heritage and its local charm. Ljubljana's allure lies in its ability to be a captivating fusion of tradition and modernity, inviting you to uncover its layers and create cherished memories in the heart of Slovenia."
    ),
    (
        "London",
        "United Kingdom",
        8538689,
        "English",
        "https://images.pexels.com/photos/7245327/pexels-photo-7245327.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "sterling (GBP)",
        "London Explored: Embracing the United Kingdom's Cultural Melting Pot",
        "Navigating London's Historical and Cultural Marvels",
        "London, the vibrant capital of the United Kingdom, extends an open invitation to embark on a captivating journey through its rich history and diverse culture. This guide leads you through the regal elegance of Buckingham Palace, where centuries of monarchy come to life during the Changing of the Guard, and into the iconic embrace of the Tower of London, a medieval fortress that holds tales of intrigue and royalty. Wander through the bustling streets of Covent Garden, where street performers and artisanal markets create a lively atmosphere, and immerse yourself in the artistic treasures of the British Museum. Discover the serenity of Hyde Park, an expansive urban oasis where nature and city life harmonize, and as you traverse London's neighborhoods, you'll uncover the essence of a metropolis that seamlessly blends tradition with contemporary dynamism.",
        "Beyond the Facades: Embracing Modern Vibes",
        "While London's historical landmarks are captivating, the city's modern pulse offers an exciting contrast. Immerse yourself in the innovative spirit of the Tate Modern, a powerhouse of contemporary art housed in a former power station. Stroll along the vibrant Southbank, where cultural institutions, dining, and riverside views converge, and delve into the futuristic allure of the Shard's observation deck, offering panoramic views of London's iconic skyline. Amidst London's historic charm, the city's modernity adds an extra layer of excitement to your exploration.",
        "Embracing London's Flavors and Traditions",
        "To fully embrace London's essence, indulge in its culinary treasures and cherished customs. Savor classic British dishes like «fish and chips», a beloved comfort food, or «Afternoon Tea», an iconic tradition that blends elegance and indulgence. Engage with the locals at the bustling Borough Market, where a tapestry of international flavors and artisanal products create a culinary haven. Immerse yourself in the festive atmosphere of Notting Hill Carnival, a vibrant celebration of Caribbean culture that fills the streets with music and color. As the sun sets over the River Thames, take a leisurely stroll across the Millennium Bridge, where the city's lights twinkle like stars, reflecting the harmonious blend of London's storied past and its modern vibrancy. London's allure lies in its ability to be a captivating fusion of history and innovation, inviting you to uncover its layers and create cherished memories in this iconic global hub."
    ),
    (
        "Luxembourg",
        "Luxembourg",
        114303,
        "Luxembourgish, French, German",
        "https://images.unsplash.com/photo-1588336899284-950764f07147?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
        "euro (EUR)",
        "Luxembourg City Explored: Embracing the Grand Duchy's Cultural Gem",
        "Navigating Luxembourg City's Historical and Cultural Charms",
        "Luxembourg City, the cultural gem of the Grand Duchy, welcomes you to embark on a captivating journey through its rich history and diverse heritage. This guide leads you through the impressive stronghold of Luxembourg Castle, where medieval walls and panoramic views offer a glimpse into the past, and into the elegant interior of the Grand Ducal Palace, a regal symbol of the nation. Wander through the charming streets of the Grund district, where cobblestone alleys and riverside cafes create a picturesque ambiance, and immerse yourself in the artistic treasures of the Luxembourg City History Museum. Discover the tranquility of Pétrusse Valley Park, a green oasis in the heart of the city, and as you explore Luxembourg City's neighborhoods, you'll uncover the essence of a place that honors tradition while embracing a modern spirit.",
        "Beyond the Facades: Embracing Contemporary Charms",
        "While Luxembourg City's historical allure is captivating, the city's contemporary energy offers an exciting contrast. Immerse yourself in the vibrant atmosphere of the Kirchberg district, a modern hub of architecture and commerce, where the European Court of Justice and other institutions stand as symbols of European unity. Stroll along the lively Rives de Clausen, a former industrial area transformed into a hotspot of nightlife and entertainment, and delve into the innovative realm of the MUDAM (Musée d'Art Moderne Grand-Duc Jean), where modern artworks challenge conventions. Amidst Luxembourg City's architectural splendor, its modern pulse adds an extra layer of excitement to your exploration.",
        "Embracing Luxembourg City's Flavors and Traditions",
        "To fully embrace Luxembourg City's essence, indulge in its culinary treasures and cherished customs. Savor traditional Luxembourgish dishes like «judd mat gaardebounen», a hearty smoked pork dish, or the iconic «Gromperekichelcher», potato fritters enjoyed at markets and celebrations. Engage with the locals at the bustling Grund Market, where fresh produce, local delicacies, and handmade crafts create a vibrant tapestry of flavors. Immerse yourself in the festive atmosphere of the Schueberfouer, one of Europe's oldest fairs, where lights, rides, and laughter fill the night air. As the sun sets over the Alzette River, take a leisurely walk along the Chemin de la Corniche, often referred to as «Europe's most beautiful balcony», where the city's lights twinkle in the distance, reflecting the harmonious blend of Luxembourg City's historical roots and its modern allure. Luxembourg City's allure lies in its ability to be a captivating fusion of past and present, inviting you to uncover its layers and create cherished memories in the heart of the Grand Duchy."
    ),
    (
        "Madrid",
        "Spain",
        3320069,
        "Spanish",
        "https://images.unsplash.com/photo-1509356428672-3589ea634248?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80",
        "euro (EUR)",
        "Madrid Explored: Embracing Spain's Vibrant Capital",
        "Navigating Madrid's Historical and Cultural Marvels",
        "Madrid, the vibrant capital of Spain, invites you on a captivating journey through its rich history and dynamic culture. This guide leads you through the majestic halls of the Royal Palace, where regal elegance and opulent décor narrate centuries of Spanish monarchy, and into the artistic sanctuary of the Prado Museum, home to masterpieces that span the ages. Wander through the bustling Puerta del Sol, a central hub where city life converges, and immerse yourself in the captivating stories of the Reina Sofia Museum's modern art collection. Discover the serenity of Retiro Park, a lush escape amidst the urban landscape, and as you explore Madrid's neighborhoods, you'll uncover the essence of a city that pays homage to its heritage while embracing contemporary vitality.",
        "Beyond the Facades: Embracing Modern Charms",
        "While Madrid's historical landmarks are captivating, the city's modern spirit offers an exciting contrast. Immerse yourself in the innovative atmosphere of Matadero Madrid, a former slaughterhouse transformed into a cultural center where art, theater, and creativity flourish. Stroll along the upscale Gran Vía, a boulevard lined with theaters, boutiques, and cafes, and delve into the contemporary art scene at the CaixaForum, an architectural gem that hosts thought-provoking exhibitions. Amidst Madrid's architectural splendor, the city's modernity adds an extra layer of excitement to your exploration.",
        "Embracing Madrid's Flavors and Traditions",
        "To fully embrace Madrid's essence, indulge in its culinary treasures and cherished customs. Savor traditional Spanish dishes like «paella», a flavorful rice dish, or «tapas», an array of small bites that capture the essence of Spanish flavors. Engage with the locals at the bustling Mercado de San Miguel, where a diverse range of gourmet offerings create a feast for the senses. Immerse yourself in the festive atmosphere of Madrid's annual San Isidro Festival, a celebration of music, dance, and gastronomy that honors the city's patron saint. As the sun sets over the Puerta de Alcalá, take a leisurely stroll along the Gran Via's illuminated streets, where the city's lights come alive, reflecting the harmonious blend of Madrid's historical legacy and its modern vibrancy. Madrid's allure lies in its ability to be a captivating fusion of tradition and innovation, inviting you to uncover its layers and create cherished memories in the heart of Spain."
    ),
    (
        "Minsk",
        "Belarus",
        2020133,
        "Belarusian, Russian",
        "https://images.unsplash.com/photo-1597986728524-76be10541f58?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80",
        "rouble (BYN)",
        "Minsk Explored: Embracing Belarus's Enigmatic Capital",
        "Navigating Minsk's Historical and Cultural Enrichment",
        "Minsk, the enigmatic capital of Belarus, welcomes you to embark on a captivating journey through its rich history and diverse cultural tapestry. This guide leads you through the poignant echoes of World War II at the Mound of Glory, a solemn memorial honoring fallen soldiers, and into the grandeur of Independence Square, a bustling center where monuments and modernity converge. Wander through the serene beauty of Gorky Park, an expansive green oasis that invites leisure and reflection, and immerse yourself in the artistic treasures of the National Art Museum. Discover the charm of the Troitskoye Predmestye, an ancient neighborhood where the past harmonizes with contemporary life, and as you explore Minsk's neighborhoods, you'll uncover the essence of a city that values tradition while embracing a modern outlook.",
        "Beyond the Facades: Embracing Modern Flair",
        "While Minsk's historical charm is captivating, the city's modern pulse offers a unique contrast. Immerse yourself in the modern cultural hub of Oktyabrskaya Square, where theaters, galleries, and cafes create a lively atmosphere for artistic exploration. Stroll along the vibrant streets of Nemiga, a bustling area where shopping, dining, and entertainment intertwine, and delve into the contemporary art scene at the Ў Gallery of Contemporary Art. Amidst Minsk's architectural beauty, the city's modern vibrancy adds an extra layer of intrigue to your exploration.",
        "Embracing Minsk's Flavors and Traditions",
        "To fully embrace Minsk's essence, indulge in its culinary treasures and cherished customs. Savor traditional Belarusian dishes like «draniki», potato pancakes, or «machanka», a hearty meat stew. Engage with the locals at the bustling Komarovka Market, where fresh produce, regional delicacies, and bustling energy create an authentic Belarusian experience. Immerse yourself in the festive atmosphere of Minsk's Victory Day Parade, a commemoration of triumph and unity. As the sun sets over the Svisloch River, take a leisurely stroll across the Troitsky Bridge, where the city's lights reflect on the water's surface, symbolizing the harmonious blend of Minsk's historical roots and its modern allure. Minsk's allure lies in its ability to be a captivating fusion of past and present, inviting you to uncover its layers and create cherished memories in the heart of Belarus."
    ),
    (
        "Monaco",
        "Monaco",
        31109,
        "French",
        "https://images.pexels.com/photos/17346705/pexels-photo-17346705/free-photo-of-sea-city-vacation-water.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "euro (EUR)",
        "Monaco City Explored: Embracing the Glamour of the Principality",
        "Navigating Monaco City's Luxurious and Cultural Charms",
        "Monaco City, the epitome of luxury nestled on the Mediterranean coast, welcomes you to embark on a captivating journey through its opulent history and cultural allure. This guide leads you through the grandeur of the Prince's Palace, a symbol of sovereignty that overlooks the glittering harbor, and into the elegance of the Monaco Cathedral, where royal weddings and princely ceremonies echo through time. Wander through the narrow streets of the Old Town, where charming boutiques and cafes invite exploration, and immerse yourself in the artistic treasures of the Nouveau Musée National de Monaco. Discover the serenity of the Exotic Garden, a haven of rare flora atop a cliff, and as you traverse Monaco City's districts, you'll uncover the essence of a place that celebrates tradition while embodying a modern sense of sophistication.",
        "Beyond the Glitz: Embracing Understated Beauty",
        "While Monaco City's glamour is captivating, the city's subtler beauty offers a captivating contrast. Immerse yourself in the tranquility of the Japanese Garden, an oasis of calm amidst the urban hubbub, and stroll along the stunning Larvotto Beach, where the azure waters meet pristine sand. Delve into the contemporary art scene at the Grimaldi Forum, where international exhibitions stimulate thought and creativity. Amidst Monaco City's lavish exterior, its understated elegance adds an extra layer of fascination to your exploration.",
        "Embracing Monaco City's Flavors and Traditions",
        "To fully embrace Monaco City's essence, indulge in its culinary delights and cherished customs. Savor Mediterranean-inspired dishes like «barbajuan», a delectable spinach and cheese pastry, or «socca», a savory chickpea flour crepe. Engage with the locals at the vibrant Condamine Market, where fresh produce, artisanal products, and local charm create an authentic sensory experience. Immerse yourself in the festive atmosphere of Monaco's Grand Prix, a renowned motor racing event that adds excitement to the city's elegant ambiance. As the sun sets over Port Hercule, take a leisurely stroll along the waterfront, where the city's lights illuminate the harbor, reflecting the harmonious blend of Monaco City's timeless heritage and its modern allure. Monaco City's allure lies in its ability to be a captivating blend of glitz and understated beauty, inviting you to uncover its layers and create cherished memories in this luxurious principality."
    ),
    (
        "Moscow",
        "Russian Federation",
        12506468,
        "Russian",
        "https://images.pexels.com/photos/6214466/pexels-photo-6214466.jpeg?",
        "rouble (RUB)",
        "Moscow Explored: Embracing Russia's Dynamic Capital",
        "Navigating Moscow's Historical and Cultural Treasures",
        "Moscow, the dynamic capital of Russia, invites you on a captivating journey through its rich history and diverse cultural tapestry. This guide leads you through the majestic expanse of Red Square, where the iconic St. Basil's Cathedral stands as a testament to architectural ingenuity, and into the grandeur of the Kremlin, a historic complex that has been the heart of Russian power for centuries. Wander through the bustling streets of Arbat, a vibrant hub of shopping, dining, and street art, and immerse yourself in the artistic riches of the Tretyakov Gallery. Discover the serenity of Gorky Park, a sprawling urban oasis where leisure and culture intersect, and as you explore Moscow's neighborhoods, you'll uncover the essence of a city that upholds its traditions while embracing a modern energy.",
        "Beyond the Facades: Embracing Contemporary Vibes",
        "While Moscow's historical landmarks are captivating, the city's contemporary pulse offers an exciting contrast. Immerse yourself in the innovative atmosphere of the Artplay Design Center, a hub of creativity where art installations and design flourish. Stroll along the bustling Tverskaya Street, Moscow's main thoroughfare, where luxury boutiques, theaters, and cafes create a vibrant urban landscape. Delve into the contemporary art scene at the Garage Museum of Contemporary Art, where thought-provoking exhibitions challenge conventions. Amidst Moscow's architectural splendor, its modern vibrancy adds an extra layer of excitement to your exploration.",
        "Embracing Moscow's Flavors and Traditions",
        "To fully embrace Moscow's essence, indulge in its culinary treasures and cherished customs. Savor traditional Russian dishes like «borscht», a hearty beet soup, or «pelmeni», savory dumplings filled with meat. Engage with the locals at the bustling Danilovsky Market, where an array of fresh produce, gourmet treats, and lively conversations create an authentic atmosphere. Immerse yourself in the festive spirit of Moscow's Victory Day Parade, a celebration of courage and unity that resonates through the city. As the sun sets over the Moskva River, take a leisurely stroll along the historic Arbat Street, where the city's lights twinkle like stars, reflecting the harmonious blend of Moscow's historical legacy and its modern vibrancy. Moscow's allure lies in its ability to be a captivating fusion of tradition and innovation, inviting you to uncover its layers and create cherished memories in the heart of Russia."
    ),
    (
        "Nicosia",
        "Republic of Cyprus",
        276410,
        "Greek, Turkish",
        "https://cdn.pixabay.com/photo/2018/04/09/19/15/graffiti-3305173_1280.jpg",
        "euro (EUR)",
        "Nicosia Explored: Embracing Cyprus's Cultural Capital",
        "Navigating Nicosia's Historical and Cultural Riches",
        "Nicosia, the captivating cultural capital of Cyprus, welcomes you on a journey of exploration through its rich history and diverse heritage. This guide leads you through the timeless beauty of the Venetian Walls, where centuries of stories are etched into stone, and into the heart of the Old City, where narrow alleys and ancient architecture echo with the voices of the past. Wander through the bustling atmosphere of Ledra Street, a vibrant hub of shops and cafes, and immerse yourself in the artistic treasures of the Leventis Municipal Museum. Discover the serenity of the Cyprus Archaeological Museum, where ancient artifacts illuminate the island's history, and as you traverse Nicosia's neighborhoods, you'll uncover the essence of a city that cherishes its traditions while embracing modern aspirations.",
        "Beyond the Facades: Embracing Modern Charms",
        "While Nicosia's historical allure is captivating, the city's modern charm offers an enchanting contrast. Immerse yourself in the contemporary atmosphere of the Nicosia Municipal Arts Center, a hub for exhibitions and cultural events that showcase local talent. Stroll along the picturesque banks of the Pedieos River, where parks and promenades invite leisurely exploration, and delve into the modern art scene at the Point Centre for Contemporary Art. Amidst Nicosia's architectural treasures, its modern vitality adds an extra layer of intrigue to your exploration.",
        "Embracing Nicosia's Flavors and Traditions",
        "To fully embrace Nicosia's essence, indulge in its culinary treasures and cherished customs. Savor traditional Cypriot dishes like «halloumi», a delectable cheese unique to the island, or «kleftiko», tender lamb slow-cooked with herbs. Engage with the locals at the vibrant Ledra Street Market, where fresh produce, spices, and local crafts create a sensory feast. Immerse yourself in the festive atmosphere of Nicosia's annual Flower Festival, a celebration of colors and scents that adds vibrancy to the city's spirit. As the sun sets over the city's ancient walls, take a leisurely stroll along the Green Line, a buffer zone that divides the city, where the juxtaposition of old and new reflects the harmonious blend of Nicosia's historical roots and its modern vibrancy. Nicosia's allure lies in its ability to be a captivating fusion of tradition and contemporary allure, inviting you to uncover its layers and create cherished memories in the heart of Cyprus."
    ),
    (
        "Oslo",
        "Norway",
        681067,
        "Norwegian",
        "https://images.pexels.com/photos/15103965/pexels-photo-15103965/free-photo-of-city-buildings-near-a-river.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "kronw (NOK)",
        "Oslo Explored: Embracing Norway's Cultural Capital",
        "Navigating Oslo's Historical and Cultural Charms",
        "Oslo, the captivating cultural capital of Norway, invites you on a journey of exploration through its rich history and diverse heritage. This guide leads you through the majestic beauty of the Royal Palace, where regal elegance and sweeping gardens create a captivating scene, and into the heart of the Viking Ship Museum, where ancient vessels and artifacts tell tales of seafaring adventurers. Wander through the charming streets of Grünerløkka, a trendy district brimming with cafes and boutiques, and immerse yourself in the artistic treasures of the National Gallery. Discover the tranquility of Vigeland Park, a sprawling haven of sculptures and greenery, and as you traverse Oslo's neighborhoods, you'll uncover the essence of a city that reveres its past while embracing modern innovation.",
        "Beyond the Facades: Embracing Modern Vibes",
        "While Oslo's historical allure is captivating, the city's modern spirit offers an enchanting contrast. Immerse yourself in the contemporary atmosphere of Aker Brygge, a waterfront area where trendy restaurants, shops, and entertainment create a vibrant ambiance. Stroll along the iconic Karl Johans Gate, Oslo's main thoroughfare, where historic architecture and modern amenities merge seamlessly. Delve into the modern art scene at the Astrup Fearnley Museum, where cutting-edge works challenge convention. Amidst Oslo's architectural splendor, its modern vitality adds an extra layer of intrigue to your exploration.",
        "Embracing Oslo's Flavors and Traditions",
        "To fully embrace Oslo's essence, indulge in its culinary treasures and cherished customs. Savor traditional Norwegian dishes like «lutefisk», a delicacy made from dried fish, or «rømmegrøt», a creamy porridge enjoyed with a sprinkle of cinnamon. Engage with the locals at the bustling Mathallen Food Hall, where a diverse array of gourmet delights create a feast for the senses. Immerse yourself in the festive atmosphere of Oslo's National Day, a jubilant celebration of Norwegian independence that fills the streets with parades and merriment. As the sun sets over the Oslo Fjord, take a leisurely stroll along the boardwalk, where the city's lights dance on the water's surface, reflecting the harmonious blend of Oslo's storied past and its modern vibrancy. Oslo's allure lies in its ability to be a captivating fusion of tradition and innovation, inviting you to uncover its layers and create cherished memories in the heart of Norway."
    ),
    (
        "Paris",
        "France",
        2206488,
        "French",
        "https://images.pexels.com/photos/11783055/pexels-photo-11783055.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "euro (EUR)",
        "Paris Explored: Embracing France's Timeless Elegance",
        "Navigating Paris's Historical and Cultural Treasures",
        "Paris, the epitome of timeless elegance in France, welcomes you on a journey of discovery through its rich history and unparalleled cultural legacy. This guide leads you through the iconic splendor of the Eiffel Tower, a symbol of romance and architectural marvel, and into the grandeur of the Louvre Museum, home to artistic masterpieces that span centuries. Wander through the charming streets of Montmartre, an artistic enclave where cobblestone pathways and café culture embody the city's artistic spirit, and immerse yourself in the atmospheric treasures of Notre-Dame Cathedral. Discover the tranquility of Luxembourg Gardens, a serene oasis in the heart of the city, and as you explore Paris's arrondissements, you'll uncover the essence of a city that cherishes its past while embracing modern dynamism.",
        "Beyond the Facades: Embracing Contemporary Chic",
        "While Paris's historical allure is captivating, the city's contemporary charm offers a captivating contrast. Immerse yourself in the modern elegance of Le Marais, a district where historic architecture blends seamlessly with trendy boutiques and chic galleries. Stroll along the Seine River's embankments, where bookstalls, cafes, and vibrant street life create an atmosphere of urban sophistication. Delve into the modern art scene at the Centre Pompidou, a distinctive building that houses an eclectic collection of avant-garde works. Amidst Paris's architectural opulence, its modern flair adds an extra layer of intrigue to your exploration.",
        "Embracing Paris's Flavors and Traditions",
        "To fully embrace Paris's essence, indulge in its culinary delights and cherished customs. Savor classic French dishes like «coq au vin», a delectable chicken stew, or «croissant», a buttery pastry that embodies Parisian breakfasts. Engage with the locals at bustling markets like Rue Mouffetard, where vibrant stalls offer fresh produce, artisanal cheeses, and gourmet delights. Immerse yourself in the festive atmosphere of Bastille Day, a lively celebration of national pride marked by fireworks and festivities. As the sun sets over the Seine, take a leisurely boat cruise along the river, where the city's lights create a shimmering reflection of Paris's storied past and its contemporary allure. Paris's allure lies in its ability to be a captivating fusion of history and sophistication, inviting you to uncover its layers and create cherished memories in the heart of France."
    ),
    (
        "Podgorica",
        "Montenegro",
        150977,
        "Montenegrin, Albanian",
        "https://images.unsplash.com/photo-1641899936619-b3cc3cfe2cbd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1631&q=80",
        "euro (EUR)",
        "Podgorica Explored: Embracing Montenegro's Urban Gem",
        "Navigating Podgorica's Historical and Cultural Charms",
        "Podgorica, the vibrant urban gem of Montenegro, invites you on a journey of discovery through its unique blend of history and cultural diversity. This guide leads you through the traces of Ottoman heritage at Clock Tower Square, where ancient architecture and modern life intersect, and into the heart of the Millennium Bridge, a contemporary symbol that spans the Moraca River. Wander through the lively atmosphere of Stara Varoš, an old Turkish quarter now bustling with shops and cafes, and immerse yourself in the treasures of the Montenegrin Art Gallery. Discover the serenity of Gorica Park, a verdant oasis nestled within the city, and as you explore Podgorica's districts, you'll uncover the essence of a city that honors its past while embracing modern vitality.",
        "Beyond the Facades: Embracing Urban Vibes",
        "While Podgorica's historical elements are intriguing, the city's urban charm offers a captivating contrast. Immerse yourself in the modern ambiance of the City Kvart, a contemporary area where galleries, theaters, and trendy eateries create an artistic atmosphere. Stroll along the bustling Bulevar Svetog Petra Cetinjskog, a boulevard lined with shops and cultural institutions, and delve into the modern art scene at the Center for Contemporary Arts of Montenegro. Amidst Podgorica's architectural juxtaposition, its urban energy adds an extra layer of fascination to your exploration.",
        "Embracing Podgorica's Flavors and Traditions",
        "To fully embrace Podgorica's essence, indulge in its culinary delights and cherished customs. Savor traditional Montenegrin dishes like «kačamak», a hearty cornmeal porridge, or «priganice», sweet doughnuts that capture local flavors. Engage with the locals at the bustling Vjesnik Market, where fresh produce, artisanal cheeses, and warm conversations create a true Montenegrin experience. Immerse yourself in the festive atmosphere of Podgorica's Independence Day, a spirited celebration of national pride marked by parades and cultural events. As the sun sets over the Moraca River, take a leisurely stroll along the Ribnica Bridge, where the city's lights illuminate the water's surface, reflecting the harmonious blend of Podgorica's historical roots and its contemporary allure. Podgorica's allure lies in its ability to be a captivating fusion of tradition and modern urbanism, inviting you to uncover its layers and create cherished memories in the heart of Montenegro."
    ),
    (
        "Prague",
        "Czech Republic",
        1335084,
        "Czech",
        "https://images.pexels.com/photos/16922419/pexels-photo-16922419/free-photo-of-buildings-in-prague.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "koruna (CZK)",
        "Prague Explored: Embracing the Czech Republic's Enchanting Capital",
        "Navigating Prague's Historical and Cultural Treasures",
        "Prague, the enchanting capital of the Czech Republic, invites you on a journey of discovery through its rich history and captivating cultural heritage. This guide leads you through the fairy-tale beauty of Prague Castle, a majestic complex that overlooks the city's skyline, and into the heart of the Charles Bridge, where medieval architecture and artistic treasures create an immersive experience. Wander through the charming streets of Mala Strana, a picturesque district adorned with Baroque architecture and hidden courtyards, and immerse yourself in the artistic riches of the National Gallery. Discover the tranquility of Petrin Hill, a lush escape offering panoramic views, and as you explore Prague's neighborhoods, you'll uncover the essence of a city that treasures its past while embracing modern creativity.",
        "Beyond the Facades: Embracing Bohemian Flair",
        "While Prague's historical allure is captivating, the city's Bohemian spirit offers a captivating contrast. Immerse yourself in the contemporary atmosphere of Letná Park, a sprawling green space where locals gather to relax and socialize, and stroll along the vibrant Vltava Riverbank, lined with trendy cafes, galleries, and cultural hubs. Delve into the modern art scene at the DOX Centre for Contemporary Art, a dynamic space where exhibitions push boundaries. Amidst Prague's architectural wonders, its Bohemian essence adds an extra layer of intrigue to your exploration.",
        "Embracing Prague's Flavors and Traditions",
        "To fully embrace Prague's essence, indulge in its culinary treasures and cherished customs. Savor traditional Czech dishes like «svíčková», a tender beef roast in creamy sauce, or «trdelník», a sweet pastry spun on a spit. Engage with the locals at bustling markets like Havelská Market, where fresh produce, handicrafts, and local delicacies create a bustling atmosphere. Immerse yourself in the festive spirit of Prague's Easter Markets, a celebration of springtime flavors and artisanal crafts. As the sun sets over the Vltava, take a leisurely cruise along the river, where the city's lights twinkle like stars, reflecting the harmonious blend of Prague's historical legacy and its Bohemian charm. Prague's allure lies in its ability to be a captivating fusion of tradition and artistic flair, inviting you to uncover its layers and create cherished memories in the heart of the Czech Republic."
    ),
    (
        "Reykjavik",
        "Iceland",
        129964,
        "Icelandic",
        "https://cdn.pixabay.com/photo/2019/08/28/13/26/iceland-4436790_1280.jpg",
        "króna (ISK)",
        "Reykjavik Explored: Embracing Iceland's Captivating Capital",
        "Navigating Reykjavik's Natural and Cultural Marvels",
        "Reykjavik, the captivating capital of Iceland, welcomes you on a journey of discovery through its unique blend of natural wonders and cultural richness. This guide leads you through the awe-inspiring landscapes of the Golden Circle, where geysers erupt and waterfalls cascade in a symphony of nature's power, and into the heart of Hallgrimskirkja, an iconic church that stands as a testament to modern architecture and spiritual reflection. Wander through the colorful streets of Laugavegur, a bustling avenue adorned with shops and cafes, and immerse yourself in the artistic treasures of the National Museum. Discover the tranquility of Tjörnin, a serene urban lake surrounded by charming parks, and as you explore Reykjavik's neighborhoods, you'll uncover the essence of a city that reveres its environment while embracing contemporary creativity.",
        "Beyond the Facades: Embracing Creative Energy",
        "While Reykjavik's natural beauty is captivating, the city's creative energy offers a captivating contrast. Immerse yourself in the modern atmosphere of Harpa Concert Hall, a stunning architectural masterpiece that hosts performances and cultural events, and stroll along the picturesque Old Harbor, where maritime heritage and modern attractions harmonize. Delve into the modern art scene at the Reykjavik Art Museum, a collection of galleries that showcase Icelandic and international contemporary works. Amidst Reykjavik's contrasting landscapes, its creative vitality adds an extra layer of intrigue to your exploration.",
        "Embracing Reykjavik's Flavors and Traditions",
        "To fully embrace Reykjavik's essence, indulge in its culinary delights and cherished customs. Savor traditional Icelandic dishes like «skyr», a rich and creamy dairy product, or «plokkfiskur», a comforting fish stew. Engage with the locals at bustling markets like Kolaportid Flea Market, where an array of unique items and local treats await discovery. Immerse yourself in the festive spirit of Reykjavik's Winter Lights Festival, a celebration of art, culture, and the city's enchanting nights. As the sun sets over the Faxaflói Bay, take a leisurely stroll along the waterfront, where the city's lights dance on the water's surface, reflecting the harmonious blend of Reykjavik's natural wonders and its creative charm. Reykjavik's allure lies in its ability to be a captivating fusion of nature and innovation, inviting you to uncover its layers and create cherished memories in the heart of Iceland."
    ),
    (
        "Riga",
        "Latvia",
        614618,
        "Latvian",
        "https://images.pexels.com/photos/14050816/pexels-photo-14050816.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "euro (EUR)",
        "Riga Explored: Embracing Latvia's Cultural Gem",
        "Navigating Riga's Historical and Artistic Marvels",
        "Riga, the captivating cultural gem of Latvia, invites you on a journey of discovery through its rich history and artistic splendor. This guide leads you through the enchanting architecture of the Old Town, where medieval streets and Gothic spires create a captivating atmosphere, and into the heart of Riga Cathedral, a majestic masterpiece that echoes with centuries of devotion. Wander through the charming streets of Alberta iela, adorned with Art Nouveau facades, and immerse yourself in the artistic treasures of the Latvian National Museum of Art. Discover the serenity of Bastejkalns Park, a green oasis in the heart of the city, and as you explore Riga's districts, you'll uncover the essence of a city that cherishes its heritage while embracing contemporary creativity.",
        "Beyond the Facades: Embracing Modern Elegance",
        "While Riga's historical charm is captivating, the city's modern elegance offers a captivating contrast. Immerse yourself in the contemporary atmosphere of the Andrejsala district, a revitalized industrial area now home to galleries, studios, and cultural events, and stroll along the bustling Alberta iela, lined with cafes and boutique shops. Delve into the modern art scene at the Latvian Museum of Contemporary Art, a hub of thought-provoking exhibitions. Amidst Riga's architectural wonders, its modern vibrancy adds an extra layer of intrigue to your exploration.",
        "Embracing Riga's Flavors and Traditions",
        "To fully embrace Riga's essence, indulge in its culinary delights and cherished customs. Savor traditional Latvian dishes like «rūjiena», a savory pork dish, or «sklandrausis», a sweet and hearty pastry. Engage with the locals at bustling markets like Riga Central Market, where fresh produce, artisanal cheeses, and local crafts create a lively sensory experience. Immerse yourself in the festive spirit of Riga's Midsummer Festival, a celebration of ancient traditions and vibrant culture. As the sun sets over the Daugava River, take a leisurely stroll along the promenade, where the city's lights reflect on the water's surface, embodying the harmonious blend of Riga's historical legacy and its modern elegance. Riga's allure lies in its ability to be a captivating fusion of tradition and innovation, inviting you to uncover its layers and create cherished memories in the heart of Latvia."
    ),
    (
        "Rome",
        "Italy",
        2789259,
        "Italian",
        "https://images.pexels.com/photos/3469505/pexels-photo-3469505.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "euro (EUR)",
        "Rome Explored: Embracing Italy's Eternal City",
        "Navigating Rome's Historical and Artistic Treasures",
        "Rome, the eternal city of Italy, invites you on a journey of discovery through its rich history and unparalleled artistic heritage. This guide leads you through the awe-inspiring grandeur of the Colosseum, an iconic symbol of ancient Rome's power, and into the heart of Vatican City, where St. Peter's Basilica and the Sistine Chapel house artistic masterpieces of the Renaissance. Wander through the cobblestone streets of Trastevere, a charming district where medieval charm and bohemian spirit intertwine, and immerse yourself in the treasures of the Roman Forum. Discover the tranquility of Villa Borghese, a sprawling park offering respite amidst the urban hustle, and as you explore Rome's neighborhoods, you'll uncover the essence of a city that embraces its past while embracing modern vitality.",
        "Beyond the Facades: Embracing Modern Elegance",
        "While Rome's historical allure is captivating, the city's modern elegance offers a captivating contrast. Immerse yourself in the contemporary atmosphere of the MAXXI National Museum of 21st Century Arts, a cutting-edge space that showcases contemporary architecture and art. Stroll along the trendy Via del Governo Vecchio, lined with stylish boutiques and cafes, and delve into the modern art scene at the Museo d'Arte Contemporanea di Roma. Amidst Rome's ancient landmarks, its modern vibrancy adds an extra layer of intrigue to your exploration.",
        "Embracing Rome's Flavors and Traditions",
        "To fully embrace Rome's essence, indulge in its culinary treasures and cherished customs. Savor traditional Italian dishes like «carbonara», a creamy pasta delight, or «supplì», crispy rice croquettes with a gooey surprise inside. Engage with the locals at bustling markets like Campo de' Fiori, where fresh produce, spices, and artisanal goods create a sensory delight. Immerse yourself in the festive atmosphere of Rome's Carnival, a jubilant celebration of color and culture. As the sun sets over the Tiber River, take a leisurely stroll along Ponte Sant'Angelo, where the city's lights twinkle in the water's reflection, embodying the harmonious blend of Rome's ancient legacy and its modern elegance. Rome's allure lies in its ability to be a captivating fusion of history and innovation, inviting you to uncover its layers and create cherished memories in the heart of Italy."
    ),
    (
        "San Marino",
        "San Marino",
        4127,
        "Italian",
        "https://images.pexels.com/photos/14379870/pexels-photo-14379870.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "euro (EUR)",
        "San Marino City Explored: Embracing the Enchantment of the Republic",
        "Navigating San Marino City's Historical and Cultural Charms",
        "San Marino City, the captivating heart of the Republic of San Marino, invites you on a journey of discovery through its rich history and cultural allure. This guide leads you through the timeless beauty of the Three Towers, iconic symbols perched on the hills, and into the heart of Palazzo Pubblico, where the republic's governance has flourished for centuries. Wander through the charming streets of Borgo Maggiore, a historic district brimming with artisanal shops and charming cafes, and immerse yourself in the artistic treasures of the State Museum. Discover the serenity of Montale, a lush garden offering panoramic vistas, and as you explore San Marino City's corners, you'll uncover the essence of a city that cherishes its past while embracing a vibrant present.",
        "Beyond the Facades: Embracing Modern Vibes",
        "While San Marino City's historical allure is captivating, the city's modern vibes offer a captivating contrast. Immerse yourself in the contemporary atmosphere of the San Marino Innovation Institute, a hub for technological and creative endeavors, and stroll along the bustling Piazza della Libertà, where local life and modern conveniences converge. Delve into the modern art scene at the Galleria d'Arte Moderna, where innovative works inspire thought and reflection. Amidst San Marino City's historical tapestry, its modern vitality adds an extra layer of intrigue to your exploration.",
        "Embracing San Marino City's Flavors and Traditions",
        "To fully embrace San Marino City's essence, indulge in its culinary delights and cherished customs. Savor traditional Sanmarinese dishes like «torta tre monti», a layered cake paying homage to the republic's hills, or «passatelli», flavorful pasta cooked in rich broth. Engage with the locals at bustling markets like Mercato Coperto, where local produce, cheeses, and artisanal crafts create an authentic experience. Immerse yourself in the festive atmosphere of San Marino's National Day, a jubilant celebration of independence and national pride. As the sun sets over the rolling hills, take a leisurely walk along the city's walls, where the city lights create a magical spectacle, reflecting the harmonious blend of San Marino City's historical legacy and its contemporary spirit. San Marino City's allure lies in its ability to be a captivating fusion of tradition and modernity, inviting you to uncover its layers and create cherished memories in the heart of the republic."
    ),
    (
        "Sarajevo",
        "Bosnia and Herzegovina",
        275524,
        "Bosnian, Croatian, Serbian",
        "https://images.pexels.com/photos/7908770/pexels-photo-7908770.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "convertible mark (BAM)",
        "Sarajevo Explored: Embracing Bosnia and Herzegovina's Cultural Crossroads",
        "Navigating Sarajevo's Historical and Cultural Treasures",
        "Sarajevo, the captivating cultural crossroads of Bosnia and Herzegovina, invites you on a journey of discovery through its rich history and diverse heritage. This guide leads you through the poignant memory of the Sarajevo Roses, concrete scars that bear witness to the city's resilience, and into the heart of the Gazi Husrev-beg Mosque, a testament to Ottoman architectural grandeur. Wander through the bustling streets of Baščaršija, an atmospheric bazaar brimming with artisanal crafts and aromatic cafes, and immerse yourself in the treasures of the Historical Museum of Bosnia and Herzegovina. Discover the serenity of Vrelo Bosne, a natural spring oasis just beyond the city, and as you traverse Sarajevo's neighborhoods, you'll uncover the essence of a city that honors its past while embracing a harmonious future.",
        "Beyond the Facades: Embracing Cultural Diversity",
        "While Sarajevo's historical allure is captivating, the city's cultural diversity offers a captivating contrast. Immerse yourself in the modern atmosphere of the Sarajevo War Tunnel Museum, a poignant reminder of the city's recent history, and stroll along the vibrant Ferhadija Street, where East and West seamlessly blend. Delve into the modern art scene at the Ars Aevi Museum of Contemporary Art, a space that reflects the city's evolving identity. Amidst Sarajevo's architectural beauty, its cultural tapestry adds an extra layer of intrigue to your exploration.",
        "Embracing Sarajevo's Flavors and Traditions",
        "To fully embrace Sarajevo's essence, indulge in its culinary delights and cherished customs. Savor traditional Bosnian dishes like «ćevapi», mouthwatering grilled meat skewers, or «baklava», a sweet and flaky pastry enjoyed with Turkish coffee. Engage with the locals at bustling markets like Markale, where fresh produce, spices, and local crafts create a vibrant ambiance. Immerse yourself in the festive atmosphere of Sarajevo's Baščaršijske Noći, a celebration of arts, culture, and music. As the sun sets over the Miljacka River, take a reflective walk across the Latin Bridge, where the city lights shimmer on the water's surface, embodying the harmonious blend of Sarajevo's historical legacy and its diverse cultural essence. Sarajevo's allure lies in its ability to be a captivating fusion of heritage and harmony, inviting you to uncover its layers and create cherished memories in the heart of Bosnia and Herzegovina."
    ),
    (
        "Skopje",
        "Republic of Macedonia",
        544086,
        "Macedonian, Albanian",
        "https://images.pexels.com/photos/14630031/pexels-photo-14630031.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "denar (MKD)",
        "Skopje Explored: Embracing North Macedonia's Dynamic Capital",
        "Navigating Skopje's Historical and Cultural Marvels",
        "Skopje, the dynamic capital of North Macedonia, invites you on a journey of discovery through its rich history and vibrant cultural heritage. This guide leads you through the striking beauty of the Stone Bridge, an iconic link between past and present, and into the heart of Skopje Fortress, where centuries of stories are etched into the ancient walls. Wander through the charming streets of the Old Bazaar, a living tapestry of Ottoman architecture and modern life, and immerse yourself in the artistic treasures of the National Gallery of Macedonia. Discover the tranquility of Matka Canyon, a natural wonder just outside the city, and as you explore Skopje's neighborhoods, you'll uncover the essence of a city that celebrates its roots while embracing contemporary dynamism.",
        "Beyond the Facades: Embracing Modern Flair",
        "While Skopje's historical allure is captivating, the city's modern flair offers a captivating contrast. Immerse yourself in the contemporary atmosphere of the Museum of Contemporary Art, a haven of thought-provoking works, and stroll along the bustling Macedonia Street, lined with cafes, shops, and cultural centers. Delve into the modern art scene at the Center for Visual Arts, a space dedicated to nurturing local creativity. Amidst Skopje's architectural wonders, its modern vibrancy adds an extra layer of intrigue to your exploration.",
        "Embracing Skopje's Flavors and Traditions",
        "To fully embrace Skopje's essence, indulge in its culinary delights and cherished customs. Savor traditional Macedonian dishes like «ajvar», a flavorful pepper-based condiment, or «tavče gravče», a hearty bean stew. Engage with the locals at bustling markets like Bit Pazar, where an array of spices, produce, and local specialties tantalize the senses. Immerse yourself in the festive atmosphere of Skopje's Carnival, a joyful celebration of tradition and creativity. As the sun sets over the Vardar River, take a leisurely stroll across the Art Bridge, where the city lights mirror in the water's reflection, embodying the harmonious blend of Skopje's historical heritage and its modern vibrancy. Skopje's allure lies in its ability to be a captivating fusion of tradition and innovation, inviting you to uncover its layers and create cherished memories in the heart of North Macedonia."
    ),
    (
        "Sofia",
        "Bulgaria",
        1221785,
        "Bulgarian",
        "https://images.pexels.com/photos/16217875/pexels-photo-16217875/free-photo-of-saint-alexander-nevsky-cathedral.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "lev (BGN)",
        "Sofia Explored: Embracing Bulgaria's Dynamic Capital",
        "Navigating Sofia's Historical and Cultural Charms",
        "Sofia, the dynamic capital of Bulgaria, invites you on a journey of discovery through its rich history and vibrant cultural tapestry. This guide leads you through the majestic beauty of Alexander Nevsky Cathedral, an architectural masterpiece that stands as a symbol of national pride, and into the heart of Serdika, where ancient Roman ruins mingle with modern life. Wander through the charming streets of Vitosha Boulevard, a bustling thoroughfare lined with boutiques and cafes, and immerse yourself in the artistic treasures of the National Palace of Culture. Discover the tranquility of Borisova Gradina Park, an urban oasis that invites relaxation, and as you explore Sofia's neighborhoods, you'll uncover the essence of a city that cherishes its past while embracing contemporary dynamism.",
        "Beyond the Facades: Embracing Modern Flair",
        "While Sofia's historical allure is captivating, the city's modern flair offers a captivating contrast. Immerse yourself in the contemporary atmosphere of the Sofia Contemporary Art Gallery, a haven for innovative works that challenge convention, and stroll along the lively Vitosha Boulevard, where urban energy thrives. Delve into the modern art scene at the Red House Centre for Culture and Debate, a space that fosters creative dialogue. Amidst Sofia's architectural wonders, its modern vibrancy adds an extra layer of intrigue to your exploration.",
        "Embracing Sofia's Flavors and Traditions",
        "To fully embrace Sofia's essence, indulge in its culinary delights and cherished customs. Savor traditional Bulgarian dishes like «banitsa», a savory pastry filled with cheese and herbs, or «kavarma», a rich and hearty stew. Engage with the locals at bustling markets like Zhenski Pazar, where colorful produce, spices, and artisanal goods create a lively sensory experience. Immerse yourself in the festive atmosphere of Sofia's International Music Festival, a celebration of artistic diversity and harmony. As the sun sets over Vitosha Mountain, take a leisurely walk along the Lovers' Bridge, where the city lights reflect on the waters of the Perlovska River, embodying the harmonious blend of Sofia's historical legacy and its modern vibrancy. Sofia's allure lies in its ability to be a captivating fusion of tradition and innovation, inviting you to uncover its layers and create cherished memories in the heart of Bulgaria."
    ),
    (
        "Stockholm",
        "Sweden",
        789024,
        "Swedish",
        "https://cdn.pixabay.com/photo/2019/02/25/06/51/stockholm-4018946_1280.jpg",
        "krona (SEK)",
        "Stockholm Explored: Embracing Sweden's Cultural Jewel",
        "Navigating Stockholm's Historical and Artistic Marvels",
        "Stockholm, the cultural jewel of Sweden, invites you on a journey of discovery through its rich history and artistic legacy. This guide leads you through the regal beauty of the Royal Palace, a grand residence that echoes with centuries of royalty, and into the heart of Gamla Stan, where medieval lanes and charming squares create a captivating atmosphere. Wander through the vibrant streets of Södermalm, a trendy district where creativity thrives, and immerse yourself in the artistic treasures of the Moderna Museet. Discover the tranquility of Djurgården, a lush island retreat offering natural serenity, and as you explore Stockholm's neighborhoods, you'll uncover the essence of a city that honors its heritage while embracing contemporary sophistication.",
        "Beyond the Facades: Embracing Modern Elegance",
        "While Stockholm's historical allure is captivating, the city's modern elegance offers a captivating contrast. Immerse yourself in the contemporary atmosphere of Fotografiska, a premier photography museum that showcases cutting-edge works, and stroll along the bustling Götgatan, lined with boutiques, cafes, and cultural spaces. Delve into the modern art scene at Magasin III Museum & Foundation for Contemporary Art, a platform for thought-provoking exhibitions. Amidst Stockholm's architectural wonders, its modern vibrancy adds an extra layer of intrigue to your exploration.",
        "Embracing Stockholm's Flavors and Traditions",
        "To fully embrace Stockholm's essence, indulge in its culinary delights and cherished customs. Savor traditional Swedish dishes like «gravlax», tender cured salmon, or «kanelbullar», aromatic cinnamon buns. Engage with the locals at bustling markets like Östermalms Saluhall, where fresh produce, seafood, and artisanal treats tantalize the senses. Immerse yourself in the festive atmosphere of Stockholm's Midsummer celebrations, a joyful ode to nature and community. As the sun sets over Lake Mälaren, take a leisurely stroll along the Norr Mälarstrand, where the city lights twinkle on the water's surface, embodying the harmonious blend of Stockholm's historical legacy and its modern elegance. Stockholm's allure lies in its ability to be a captivating fusion of tradition and innovation, inviting you to uncover its layers and create cherished memories in the heart of Sweden."
    ),
    (
        "Tallinn",
        "Estonia",
        437980,
        "Estonian",
        "https://cdn.pixabay.com/photo/2018/10/10/21/04/estonia-3738328_1280.jpg",
        "euro (EUR)",
        "Tallinn Explored: Embracing Estonia's Enchanting Capital",
        "Navigating Tallinn's Historical and Cultural Charms",
        "Tallinn, the enchanting capital of Estonia, invites you on a journey of discovery through its rich history and cultural allure. This guide leads you through the medieval charm of Tallinn Old Town, a UNESCO World Heritage site where cobbled streets and medieval architecture transport you back in time, and into the heart of Alexander Nevsky Cathedral, an exquisite example of Russian Orthodox grandeur. Wander through the lively lanes of Kalamaja, a bohemian district where creativity flourishes, and immerse yourself in the artistic treasures of the KUMU Art Museum. Discover the tranquility of Kadriorg Park, an elegant oasis boasting Baroque beauty, and as you explore Tallinn's neighborhoods, you'll uncover the essence of a city that reveres its past while embracing modern vitality.",
        "Beyond the Facades: Embracing Artistic Inspiration",
        "While Tallinn's historical allure is captivating, the city's artistic inspiration offers a captivating contrast. Immerse yourself in the contemporary atmosphere of the Telliskivi Creative City, a vibrant hub of art, design, and innovation, and stroll along the picturesque Rotermann Quarter, where old industrial buildings house modern galleries and boutiques. Delve into the modern art scene at the EKKM Contemporary Art Museum, a platform for thought-provoking exhibitions. Amidst Tallinn's architectural wonders, its artistic energy adds an extra layer of intrigue to your exploration.",
        "Embracing Tallinn's Flavors and Traditions",
        "To fully embrace Tallinn's essence, indulge in its culinary treasures and cherished customs. Savor traditional Estonian dishes like «kama», a nutritious porridge mix, or «hapukapsas», tangy sauerkraut. Engage with the locals at bustling markets like Balti Jaama Turg, where local produce, handicrafts, and authentic flavors come to life. Immerse yourself in the festive atmosphere of Tallinn's Christmas Market, a heartwarming celebration of holiday traditions. As the sun sets over the Gulf of Finland, take a leisurely stroll along the seafront promenade, where the city lights shimmer on the water's surface, reflecting the harmonious blend of Tallinn's historical legacy and its artistic inspiration. Tallinn's allure lies in its ability to be a captivating fusion of tradition and creativity, inviting you to uncover its layers and create cherished memories in the heart of Estonia."
    ),
    (
        "Tirana",
        "Albania",
        883996,
        "Albanian",
        "https://images.pexels.com/photos/11126448/pexels-photo-11126448.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "lek (ALL)",
        "Tirana Explored: Embracing Albania's Vibrant Capital",
        "Navigating Tirana's Historical and Cultural Marvels",
        "Tirana, the vibrant capital of Albania, invites you on a journey of discovery through its rich history and cultural splendor. This guide leads you through the monumental Skanderbeg Square, a hub of national pride and historical significance, and into the heart of Et'hem Bey Mosque, an architectural gem that reflects the city's diverse heritage. Wander through the colorful streets of Blloku, a lively district where tradition meets modernity, and immerse yourself in the artistic treasures of the National Gallery of Arts. Discover the tranquility of Grand Park, a lush oasis nestled within the urban bustle, and as you explore Tirana's neighborhoods, you'll uncover the essence of a city that honors its past while embracing contemporary dynamism.",
        "Beyond the Facades: Embracing Creative Energy",
        "While Tirana's historical allure is captivating, the city's creative energy offers a captivating contrast. Immerse yourself in the contemporary atmosphere of the Pyramid of Tirana, a unique landmark that has evolved into a canvas for street art and cultural expression, and stroll along the bustling Blloku streets, lined with cafes, boutiques, and galleries. Delve into the modern art scene at the National Experimental Theatre, a platform for cutting-edge performances and creativity. Amidst Tirana's architectural mix, its creative vitality adds an extra layer of intrigue to your exploration.",
        "Embracing Tirana's Flavors and Traditions",
        "To fully embrace Tirana's essence, indulge in its culinary delights and cherished customs. Savor traditional Albanian dishes like «byrek», a savory pastry filled with cheese and spinach, or «tavë kosi», a comforting baked dish made with yogurt and lamb. Engage with the locals at bustling markets like Pazari i Ri, where fresh produce, spices, and local crafts create an authentic experience. Immerse yourself in the festive atmosphere of Tirana International Film Festival, a celebration of cinematic art and cultural exchange. As the sun sets over Dajti Mountain, take a leisurely stroll along the Lana River, where the city lights cast a warm glow on the water's surface, embodying the harmonious blend of Tirana's historical heritage and its contemporary creativity. Tirana's allure lies in its ability to be a captivating fusion of tradition and innovation, inviting you to uncover its layers and create cherished memories in the heart of Albania."
    ),
    (
        "Vaduz",
        "Liechtenstein",
        5774,
        "German",
        "https://images.pexels.com/photos/13895514/pexels-photo-13895514.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "franc (CHF)",
        "Vaduz Explored: Embracing Liechtenstein's Enchanting Capital",
        "Navigating Vaduz's Historical and Cultural Treasures",
        "Vaduz, the enchanting capital of Liechtenstein, invites you on a journey of discovery through its rich history and cultural allure. This guide leads you through the regal charm of Vaduz Castle, a picturesque hilltop residence that embodies the principality's identity, and into the heart of Kunstmuseum Liechtenstein, where artistic treasures from across the world converge. Wander through the charming streets of Städtle, a historic quarter where quaint buildings and modern galleries coexist harmoniously, and immerse yourself in the contemplative ambiance of the Red House. Discover the serenity of Rheinpark, a riverside haven offering respite amidst urbanity, and as you explore Vaduz's corners, you'll uncover the essence of a city that respects its heritage while embracing modern sophistication.",
        "Beyond the Facades: Embracing Artistic Expression",
        "While Vaduz's historical allure is captivating, the city's artistic expression offers a captivating contrast. Immerse yourself in the contemporary atmosphere of Kunstraum Engländerbau, a space dedicated to innovative visual arts and cultural exchange, and stroll along the charming streets of Städtle, where boutiques and local crafts flourish. Delve into the modern art scene at the Liechtenstein Center for the Arts, a platform for fostering creativity and collaboration. Amidst Vaduz's architectural elegance, its artistic energy adds an extra layer of intrigue to your exploration.",
        "Embracing Vaduz's Flavors and Traditions",
        "To fully embrace Vaduz's essence, indulge in its culinary delights and cherished customs. Savor traditional Liechtensteiner dishes like «käsknöpfle», delectable cheese dumplings, or «rieslingsuppe», a comforting white wine soup. Engage with the locals at bustling markets like Markt am Hof, where fresh produce, local cheeses, and artisanal creations bring the city's heart to life. Immerse yourself in the festive atmosphere of Vaduz Castle's National Day celebrations, a lively showcase of national pride and unity. As the sun sets behind the Alps, take a leisurely stroll along the Rheinpromenade, where the city lights dance on the tranquil waters of the Rhine River, embodying the harmonious blend of Vaduz's historical legacy and its artistic essence. Vaduz's allure lies in its ability to be a captivating fusion of tradition and creativity, inviting you to uncover its layers and create cherished memories in the heart of Liechtenstein."
    ),
    (
        "Valletta",
        "Malta",
        5876,
        "Maltese, English",
        "https://images.pexels.com/photos/17811033/pexels-photo-17811033/free-photo-of-mar-ciutat-vacances-aigua.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "euro (EUR)",
        "Valletta Explored: Embracing Malta's Majestic Capital",
        "Navigating Valletta's Historical and Cultural Marvels",
        "Valletta, the majestic capital of Malta, invites you on a journey of discovery through its rich history and cultural splendor. This guide leads you through the grandeur of St. John's Co-Cathedral, a Baroque masterpiece adorned with intricate artistry, and into the heart of Upper Barrakka Gardens, where panoramic views of the Grand Harbour unfold. Wander through the narrow streets of Strait Street, a historic lane pulsating with contemporary life, and immerse yourself in the artistic treasures of the National Museum of Archaeology. Discover the tranquility of Hastings Gardens, a serene haven offering a moment of respite, and as you explore Valletta's corners, you'll uncover the essence of a city that treasures its past while embracing modern vitality.",
        "Beyond the Facades: Embracing Cultural Fusion",
        "While Valletta's historical allure is captivating, the city's cultural fusion offers a captivating contrast. Immerse yourself in the contemporary atmosphere of Spazju Kreattiv, a dynamic space for cultural expression and artistic innovation, and stroll along the lively Republic Street, where local markets, cafes, and boutiques create a vibrant ambiance. Delve into the modern art scene at MUŻA, the Malta National Community Art Museum, a testament to the city's dedication to artistic diversity. Amidst Valletta's architectural grandeur, its cultural tapestry adds an extra layer of intrigue to your exploration.",
        "Embracing Valletta's Flavors and Traditions",
        "To fully embrace Valletta's essence, indulge in its culinary treasures and cherished customs. Savor traditional Maltese dishes like «pastizzi», flaky pastries filled with ricotta or peas, or «fenkata», a hearty rabbit stew. Engage with the locals at bustling markets like Is-Suq Tal-Belt, where fresh produce, local delicacies, and artisanal crafts create a lively atmosphere. Immerse yourself in the festive atmosphere of Valletta's Carnival, a spirited celebration of tradition and revelry. As the sun sets over the bastion walls, take a leisurely stroll along the waterfront promenade, where the city lights shimmer on the waters of the Mediterranean Sea, reflecting the harmonious blend of Valletta's historical legacy and its cultural fusion. Valletta's allure lies in its ability to be a captivating fusion of history and modernity, inviting you to uncover its layers and create cherished memories in the heart of Malta."
    ),
    (
        "Vatican City",
        "Vatican City",
        451,
        "Italian, Latin",
        "https://images.pexels.com/photos/13644170/pexels-photo-13644170.jpeg",
        "euro (EUR)",
        "Vatican City Explored: Embracing the Spiritual Heart of the Holy See",
        "Navigating Vatican City's Historical and Spiritual Treasures",
        "Vatican City, the spiritual heart of the Holy See, invites you on a journey of profound discovery through its rich history and sacred allure. This guide leads you through the awe-inspiring beauty of St. Peter's Basilica, a masterpiece of Renaissance architecture that stands as a testament to faith, and into the heart of the Vatican Museums, where artistic marvels from across the centuries are preserved. Wander through the serene courtyards of the Apostolic Palace, where the whispers of centuries past linger, and immerse yourself in the spiritual embrace of the Sistine Chapel. Discover the tranquility of the Vatican Gardens, a verdant sanctuary imbued with religious significance, and as you explore Vatican City's sanctified grounds, you'll uncover the essence of a place that holds a sacred space in the hearts of millions.",
        "Beyond the Facades: Embracing Spiritual Contemplation",
        "While Vatican City's spiritual allure is captivating, the city's contemplative sanctity offers a captivating contrast. Immerse yourself in the atmosphere of St. Peter's Square, a place of gathering, reflection, and unity, and stroll along the colonnades designed by Gian Lorenzo Bernini. Delve into the quietude of the Vatican Library, a repository of knowledge and history that speaks of devotion and scholarly pursuit. Amidst Vatican City's sacred architecture, its spiritual resonance adds an extra layer of reverence to your exploration.",
        "Embracing Vatican City's Spiritual Essence",
        "To fully embrace Vatican City's essence, immerse yourself in its sacred rituals and cherished traditions. Witness the Papal Audience, where the Pontiff imparts blessings and teachings to the faithful, or attend a mass at St. Peter's Basilica, an experience of profound spirituality. Engage with the faithful and pilgrims who come from around the world to connect with their faith and heritage. As the sun sets over St. Peter's Square, take a reflective walk around the Vatican Walls, where the city lights cast a serene glow on the sacred grounds, embodying the harmonious blend of Vatican City's historical legacy and its enduring spiritual essence. Vatican City's allure lies in its ability to be a sacred haven of faith and devotion, inviting you to uncover its layers and create moments of profound connection in the heart of the Holy See."
    ),
    (
        "Vienna",
        "Austria",
        1897491,
        "German",
        "https://images.pexels.com/photos/16632378/pexels-photo-16632378/free-photo-of-garden-near-osterreichische-galerie-belveder-in-vienna.jpeg",
        "euro (EUR)",
        "Vienna Explored: Embracing Austria's Enchanting Capital",
        "Navigating Vienna's Historical and Artistic Marvels",
        "Vienna, the enchanting capital of Austria, invites you on a journey of discovery through its rich history and artistic legacy. This guide leads you through the opulent beauty of Schönbrunn Palace, a testament to imperial grandeur and architectural finesse, and into the heart of Belvedere Palace, where masterpieces by Gustav Klimt and other luminaries adorn the walls. Wander through the charming streets of Innere Stadt, the historic center where centuries of stories come alive, and immerse yourself in the artistic treasures of the Albertina Museum. Discover the tranquility of Stadtpark, an urban oasis where serene landscapes and artistic tributes coexist harmoniously, and as you explore Vienna's neighborhoods, you'll uncover the essence of a city that pays homage to its past while embracing modern sophistication.",
        "Beyond the Facades: Embracing Cultural Harmony",
        "While Vienna's historical allure is captivating, the city's cultural harmony offers a captivating contrast. Immerse yourself in the contemporary atmosphere of MuseumsQuartier, a dynamic cultural complex that celebrates innovation and creativity, and stroll along the vibrant Mariahilfer Straße, where fashion, boutiques, and cafes create an enticing blend. Delve into the modern art scene at the Leopold Museum, a repository of Austrian artistry from the 19th and 20th centuries. Amidst Vienna's architectural splendor, its cultural tapestry adds an extra layer of intrigue to your exploration.",
        "Embracing Vienna's Flavors and Traditions",
        "To fully embrace Vienna's essence, indulge in its culinary delights and cherished customs. Savor traditional Austrian dishes like «Wiener Schnitzel», a crispy breaded veal or pork cutlet, or «Sachertorte», a decadent chocolate cake. Engage with the locals at bustling markets like Naschmarkt, where an array of fresh produce, international foods, and artisanal goods await. Immerse yourself in the festive atmosphere of Vienna's Ball Season, a grand tradition that combines elegance and revelry. As the sun sets over the Danube River, take a leisurely stroll along the Ringstrasse, where the city lights reflect on the water's surface, embodying the harmonious blend of Vienna's historical legacy and its cultural harmony. Vienna's allure lies in its ability to be a captivating fusion of tradition and creativity, inviting you to uncover its layers and create cherished memories in the heart of Austria."
    ),
    (
        "Vilnius",
        "Lithuania",
        546155,
        "Lithuanian",
        "https://cdn.pixabay.com/photo/2020/04/20/15/48/castle-5068706_1280.jpg",
        "euro (EUR)",
        "Vilnius Explored: Embracing Lithuania's Cultural Gem",
        "Navigating Vilnius's Historical and Artistic Marvels",
        "Vilnius, the cultural gem of Lithuania, invites you on a journey of discovery through its rich history and artistic legacy. This guide leads you through the enchanting beauty of Vilnius Cathedral, a symbol of national identity and spiritual significance, and into the heart of Užupis, a bohemian district that pulsates with creative energy and free-spirited expression. Wander through the labyrinthine streets of Old Town, a UNESCO World Heritage site where centuries of architecture and stories intertwine, and immerse yourself in the artistic treasures of the MO Museum. Discover the tranquility of Vingis Park, a sprawling green oasis that invites leisure and reflection, and as you explore Vilnius's neighborhoods, you'll uncover the essence of a city that honors its past while embracing modern vitality.",
        "Beyond the Facades: Embracing Creative Freedom",
        "While Vilnius's historical allure is captivating, the city's creative freedom offers a captivating contrast. Immerse yourself in the contemporary atmosphere of Loftas, a multifunctional creative space that hosts concerts, exhibitions, and cultural events, and stroll along the vibrant Gediminas Avenue, where modern architecture and shops stand in harmonious contrast with historical surroundings. Delve into the modern art scene at the National Gallery of Art, a hub for exploring Lithuanian and international contemporary art. Amidst Vilnius's architectural tapestry, its artistic innovation adds an extra layer of intrigue to your exploration.",
        "Embracing Vilnius's Flavors and Traditions",
        "To fully embrace Vilnius's essence, indulge in its culinary treasures and cherished customs. Savor traditional Lithuanian dishes like «cepelinai», hearty potato dumplings, or «kugelis», a delectable potato casserole. Engage with the locals at bustling markets like Hales Turgus, where fresh produce, smoked meats, and artisanal cheeses create a lively sensory experience. Immerse yourself in the festive atmosphere of Vilnius Jazz Festival, a celebration of musical diversity and creative expression. As the sun sets over the Neris River, take a leisurely walk along the Bernardinai Gardens, where the city lights cast a warm glow on the historical buildings, embodying the harmonious blend of Vilnius's historical legacy and its creative freedom. Vilnius's allure lies in its ability to be a captivating fusion of tradition and artistic exploration, inviting you to uncover its layers and create cherished memories in the heart of Lithuania."
    ),
    (
        "Warsaw",
        "Poland",
        1792692,
        "Polish",
        "https://images.pexels.com/photos/8259139/pexels-photo-8259139.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "zloty (PLN)",
        "Warsaw Explored: Embracing Poland's Historic Capital",
        "Navigating Warsaw's Historical and Cultural Marvels",
        "Warsaw, the historic capital of Poland, invites you on a journey of discovery through its rich history and cultural legacy. This guide leads you through the resplendent beauty of the Royal Castle, a symbol of resilience and rebirth after the ravages of war, and into the heart of Lazienki Park, a verdant oasis where palatial elegance mingles with natural splendor. Wander through the bustling streets of Nowy Świat, a lively avenue where past and present intersect, and immerse yourself in the artistic treasures of the Warsaw National Museum. Discover the tranquility of the Vistula River promenade, a serene escape in the heart of the city, and as you explore Warsaw's neighborhoods, you'll uncover the essence of a city that honors its past while embracing modern vitality.",
        "Beyond the Facades: Embracing Cultural Diversity",
        "While Warsaw's historical allure is captivating, the city's cultural diversity offers a captivating contrast. Immerse yourself in the contemporary atmosphere of the Praga District, a thriving hub of artistic expression and urban renewal, and stroll along the vibrant Nowy Świat Street, where cafes, boutiques, and art galleries create a captivating blend. Delve into the modern art scene at the Museum of Modern Art, a testament to Poland's creative evolution. Amidst Warsaw's architectural tapestry, its cultural vibrancy adds an extra layer of intrigue to your exploration.",
        "Embracing Warsaw's Flavors and Traditions",
        "To fully embrace Warsaw's essence, indulge in its culinary treasures and cherished customs. Savor traditional Polish dishes like «pierogi», delicious dumplings filled with various ingredients, or «bigos», a hearty sauerkraut and meat stew. Engage with the locals at bustling markets like Hala Koszyki, where gourmet foods, artisanal goods, and international flavors converge. Immerse yourself in the festive atmosphere of the Warsaw International Film Festival, a celebration of cinematic artistry and cultural exchange. As the sun sets over the Old Town, take a leisurely stroll along the Vistula River boulevards, where the city lights twinkle on the water's surface, embodying the harmonious blend of Warsaw's historical legacy and its cultural diversity. Warsaw's allure lies in its ability to be a captivating fusion of tradition and modernity, inviting you to uncover its layers and create cherished memories in the heart of Poland."
    ),
    (
        "Zagreb",
        "Croatia",
        825088,
        "Croatian",
        "https://images.pexels.com/photos/14133523/pexels-photo-14133523.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "euro (EUR)",
        "Zagreb Explored: Embracing Croatia's Captivating Capital",
        "Navigating Zagreb's Historical and Cultural Treasures",
        "Zagreb, the captivating capital of Croatia, invites you on a journey of discovery through its rich history and cultural allure. This guide leads you through the enchanting beauty of St. Mark's Church, an architectural gem adorned with a vibrant rooftop and historic coat of arms, and into the heart of Ban Jelačić Square, a bustling hub of activity and central meeting point. Wander through the charming streets of the Upper Town, where cobblestone lanes and medieval architecture tell tales of centuries past, and immerse yourself in the artistic treasures of the Museum of Broken Relationships. Discover the tranquility of Maksimir Park, an expansive green sanctuary that invites leisure and reflection, and as you explore Zagreb's districts, you'll uncover the essence of a city that embraces its heritage while fostering modern creativity.",
        "Beyond the Facades: Embracing Artistic Expression",
        "While Zagreb's historical allure is captivating, the city's artistic expression offers a captivating contrast. Immerse yourself in the contemporary atmosphere of Škuc Gallery, a dynamic space for contemporary art exhibitions and cultural events, and stroll along the lively Tkalčićeva Street, where cafes, galleries, and boutiques create an inviting ambiance. Delve into the modern art scene at the Museum of Contemporary Art, a hub for exploring both Croatian and international artistic innovation. Amidst Zagreb's architectural beauty, its artistic pulse adds an extra layer of intrigue to your exploration.",
        "Embracing Zagreb's Flavors and Traditions",
        "To fully embrace Zagreb's essence, indulge in its culinary delights and cherished customs. Savor traditional Croatian dishes like «štrukli», delicate dough filled with cheese or other ingredients, or «pasticada», a slow-cooked beef stew served with gnocchi. Engage with the locals at bustling markets like Dolac Market, where fresh produce, regional delicacies, and local crafts create a lively atmosphere. Immerse yourself in the festive atmosphere of the International Animation Film Festival, a celebration of creative storytelling and animation artistry. As the sun sets over Medvednica Mountain, take a leisurely stroll along the Sava River, where the city lights reflect on the water's surface, embodying the harmonious blend of Zagreb's historical legacy and its artistic expression. Zagreb's allure lies in its ability to be a captivating fusion of tradition and creativity, inviting you to uncover its layers and create cherished memories in the heart of Croatia."
    );


INSERT INTO user (first_name, last_name, username, password)
VALUES
    ("Maria", "Müller", "maria_mueller", "MariaMueller"),
    ("José", "Ortiz", "jose_ortiz", "JoseOrtiz"),
    ("Alexandra", "Green", "alexandra_green", "AlexandraGreen");



INSERT INTO activity
    (capital_id,
    city,
    title,
    url1,
    url2,
    url3,
    url4,
    url5,
    url6,
    url7,
    url8,
    introduction,
    price,
    description1,
    description2,
    description3,
    description4,
    description5,
    what_to_expect,
    transportation,
    additional_Information,
    cancellation)

VALUES
    (
        1,

        "Amsterdam",

        "Amsterdam Classic Boat Cruise",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/3a/8a/80.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/3a/8a/b4.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/e6/b0/67.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/44/4e/08.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/80/26/9f.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/3a/8a/b1.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/5b/8d/58.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/e6/b9/d4.jpg",

        "Cruise down the famous canals of Amsterdam during this 60-minute boat tour, which includes a cheese platter and unlimited beer, wine and soft drink. Hop aboard the classic wooden saloon boat and sit back and enjoy the beautiful city pass you by. See landmarks while nibbling on Dutch cheese and having a drink.",

        32.50,

        "Ages 3-99, max of 35 per group",

        "Duration: 1h",
        
        "Start time: Check availability",

        "Mobile ticket",

        "English",

        "Pass By: Homomonument, Westermarkt, Amsterdam The Netherlands
         In about one hour, we cruise through the unique Unesco Heritage listed Golden Age canals of Amsterdam. We cruise into the Jordaan, a neighbourhood known for its famous Prinsengracht towards the most romantic Magere Brug (English: Skinny Bridge, we will work on your Dutch pronunciation later), the Amstel river, the 7 bridges, the impressive Golden Bend, and then past the nine streets back to the Anne Frank House.
         Pass By: Anne Frank House, Prinsengracht 263 - 267 museum entrance Westermarkt 20, 1016 DK Amsterdam The Netherlands
         Annelies Marie Frank was a Jewish girl from Germany who became known for the diary she wrote during the Second World War when she was in hiding in Amsterdam. She died of exhaustion and / or typhus fever in the Bergen-Belsen concentration camp",

        "Departure details
          Prinsengracht 263, 1016 GV Amsterdam, Netherlands
          Location: Anne Frank House. Our boats are located in front of the Anne Frank house at Prinsengracht 263. You will recognize our Flagship crew by the orange clothing. 
          Prins Hendrikkade 33A, 1012 TM Amsterdam, Netherlands
          Location: Central Station. Our boats are located right across from Central Station (On the city centre side), at Prins Hendrikkade 33A (next to the entrance of the Victoria Hotel).You will recognize our Flagship crew by the orange clothing. 
          Return details
          Returns to original departure point",

        "Confirmation will be received at time of booking
          Minimum drinking age is 18 years
          It is colder on the water, please bring warm clothing and don't get surprised by the chilly Dutch weather
          A fairly big step has to be made into the boat. Our stewards will assist you with this
          You are always welcome to cancel your ticket if it rains and you'd rather stay inside :)
          No boats at the dock? Please call us or visit our office at Leliegracht 50D (Just around the corner from the Anne Frank House)
          No bachelor / birthday party groups allowed, please call us for a private boat option
          Tour available for free for infants (0-3 years old) 
          No toilets on board 
          Please be aware that the points of interest on the route may slightly vary depending on the departure point chosen
          Most travellers can participate
          This experience requires good weather. If it's cancelled due to poor weather, you'll be offered a different date or a full refund
          This tour/activity will have a maximum of 35 travellers",

        "For a full refund, cancel at least 24 hours in advance of the start date of the experience."
    ),

    (
        1,

        "Amsterdam",

        "Treasures of Amsterdam: Coffeeshops & Red Light District Private Tour",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/6f/d8/93.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/a3/99/dc.jpg",

        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/1b/86/f8/20190903-182211-largejpg.jpg?w=1100&h=-1&s=1",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/6f/d8/94.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/a3/9b/5f.jpg",

        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/1b/86/f9/20190903-182744-largejpg.jpg?w=1100&h=-1&s=1",

        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/1b/86/f7/20190903-175455-largejpg.jpg?w=1100&h=-1&s=1",

        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/1b/86/f1/20190903-171127-largejpg.jpg?w=1100&h=-1&s=1",

        "Discover the stories and secrets of Amsterdam's most notorious neighborhood on a private tour of the Red Light District. Break away from the curious tourist throngs as a savvy local guide ushers you through hedonistic alleyways and past bars and cafes. Learn the history behind the city's famously permissive culture and explore hidden spots beyond the glowing red lights and windows.",

        76.00,

        "Ages 14-99",

        "Duration: 2h 30m",

        "Start time: Check availability",

        "Mobile ticket",

        "English, Dutch",
        
        "Amsterdam's Red Light District lures countless curious tourists to its hedonistic clustering of bars, cafes and scintillating red windows. For locals, it's part of the everyday fabric of the city. Discover the real culture behind this internationally famous destination — apart from the giggles and gawking — on this private 2-hour tour. 

         Meet your local guide in the Beursplein at the time of your choice, and set off on an insightful walking tour, beginning with the famous Warmoesstraat. See some of the unusual offerings that line one of the city's oldest streets, including cannabis 'coffee shops,' fetish boutiques and gay bars. Learn the origins of the Netherlands' famously liberal social attitudes, and hear how the legal sex industry is perceived by locals. 

         Along the way, stroll past the iconic red lights and adult attractions such as the Casa Rosso. Aside from the more mature displays, see other curiosities including a local brewery, Chinatown, the city's narrowest street and the weigh building of Nieumarkt. Feel free to ask all the questions you like to satisfy your curiosity, and come away with a uniquely Dutch perspective on red-light lifestyles.

         Please be advised: Although there is no minimum age, due to the mature content, this tour may not be suitable for children.",

         "Departure details
          Gravenstraat 13, 1012 NL Amsterdam, Netherlands
          Cafe De Drie Graefjes American Bakery, behind the New church / Nieuwe Kerk
          Return details
          Returns to original departure point",

        "Confirmation will be received at time of booking
         Travellers should have a moderate physical fitness level
         This is a private tour/activity. Only your group will participate",

        "For a full refund, cancel at least 24 hours in advance of the start date of the experience."
    ),
    (
        2,

        "Andorra la Vella",

        "The Original Three Countries in One Day: France, Andorra, Spain from Barcelona",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/13/ee/ba.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/14/0c/f7.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/13/e7/63.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/13/ee/ba.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/14/03/2e.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/13/eb/97.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/36/00/0f.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/13/ee/ba.jpg",

        "Visit Andorra, France, and Spain in a single day on a tour from Barcelona that takes in historic architecture, gorgeous mountain landscapes, and three distinctive cultures. If your time is limited, choosing a guided tour ensures you see more than you would on your own, from breakfast in Spain to lunch in a traditional French restaurant (own expense), with a series of fascinating sightseeing stops throughout the day.",

        139.00,

        "Ages 0-99, max of 20 per group",

        "Duration: 12h 30m",

        "Start time: Check availability",

        "Mobile ticket",

        "English",

        "Meet a guide in central Barcelona, then travel to the Spanish village of Baga, where you have views of the rocky peaks in Cadi-Moixero National Park. Tour the village's square and medieval church. Then, head deeper into the countryside toward the French border. 
         Next, stop at the ancient spa town of Ax-Les-Thermes. Discover some natural fountains, soak your feet in the healing waters, and enjoy the free time to browse local artisan shops and explore this traditional French village. 
         Meet your guide back at the bus, climb aboard, and travel to Andorra. Travel through the scenic Pyrenees Alps on route to Andorra la Vella. Along the route, cross the Pas de la Casa, a high mountain pass with some ample photo opportunities.
         Descend into Andorra, stopping off at a mountain valley to explore tiny stone huts that dot the mountainside and an ancient Roman church stands. 
         From here you head down the valleys into Andorra de la Vella. This will be your last stop of the day, but you have enough time to do a little bit of duty-free shopping and grab a quick bargain. 
         Begin the return to Barcelona in the late afternoon, pausing for a drink in Coll de Nargo along the way and finishing the day at a central location in Barcelona.",

         "Departure details
          C/ Palau de la Música, 1, 08003 Barcelona, Spain
          Explore Catalunya Office. We are located in a little alley between the Palau de la Música building and Via Laietana, opposite the Palau de la Música's cafeteria.
          Return details
          Arco de Triunfo de Barcelona, Passeig de Lluís Companys, 08003 Barcelona, Spain
          Depending on the size of your group, and the traffic conditions on the day of the tour, you will return either to the main office or to Place Catalunya, which is just an easy 3-5 minute walk away.",

          "Confirmation will be received at time of booking
          A current valid passport is required on the day of travel. You MUST confirm and obtain any visa requirements prior to border crossing. All visa requirements are the sole responsibility of the traveler.
          Please bring a towel if you plan to use the spa water in Ax Les Thermes
          This tour operates in English only
          Most travellers can participate
          This experience requires good weather. If it's cancelled due to poor weather, you'll be offered a different date or a full refund
          This tour/activity will have a maximum of 20 travellers",

          "For a full refund, cancel at least 24 hours in advance of the start date of the experience."

    ),
    (
        2,

        "Andorra la Vella",

        "Andorra la Vella Instagram Photoshoot By Local Professionals",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/3a/f0/95.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/3a/f0/8f.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/3a/f0/8f.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/3a/f0/8f.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/3a/f0/a7.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/3a/f0/8f.jpg",

        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/23/5f/32/caption.jpg?w=1400&h=-1&s=1",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/3a/f0/8f.jpg",

        "Excited about the upcoming trip? Feel the happiness even after it's over - via VsnapU. Preserve the moments by adding a Photoshoot activity to your vacation.
         Imagine a professional photographer coming to the most exotic location of your itinerary. Be involved in this fun activity of posing and doing crazy things while he captures your expressions with your loved ones.
         See that smile even after months - adore the pictures and share it with the world. What better than having digital copies which you can float on Facebook, Insta, Whatsapp?
         Simply book a photoshoot online and find the photographer smiling on your desired date and time. We make sure that the exotic landscape of the destination is captures along with you to give the grand feeling.
         Book us for Honeymoon Trips/ Birthdays/ Anniversaries/ or any other commercial events. Make it a memory for a lifetime.",

        326.47,

        "Ages 0-120",

        "Duration: 1h 30m",

        "Start time: Check availability",

        "Mobile ticket",

        "English",

        "Book the shoot online on desired Date and Time.
        Assigned photographer calls you a day prior to shoot, confirming the place or any changes in travel.
        Photographer reaches the location for a 1 hour shoot.
        50-80 Images are Clicked.
        Top 35 pictures are edited by professionals.
        Get the drive link / cloud link to your digital copies via mail / Whatsapp / Text Message
        Link is valid for 365 days.
        Get a chance to be featured on our social media pages.",

        "Departure details
        AD500 Andorra la Vella, Andorra
        Return details
        Returns to original departure point",

        "Confirmation will be received at time of booking
        No heart problems or other serious medical conditions
        Most travellers can participate
        This experience requires good weather. If it's cancelled due to poor weather, you'll be offered a different date or a full refund
        This is a private tour/activity. Only your group will participate",

        "For a full refund, cancel at least 24 hours in advance of the start date of the experience."

    ),
    (
        5,

        "Berlin",

        "Street Art Tour - Off The Grid",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/3e/e5/6c.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/71/e2/18.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/3e/e5/6e.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/3e/e5/6c.jpg",

        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/a9/0e/bd/street-art-tour-off-the.jpg?w=1100&h=-1&s=1",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/3e/e5/6f.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/3e/e5/6c.jpg",

        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/3e/e5/6d.jpg",

        "Finding the best street murals can be tough in a new city; however, by taking this walking street art tour, you can discover the best of the city's photo-friendly street art with ease. Benefit from your local artist-guide's insight into the history, techniques, and street art secrets as you admire a mix of well-known and underrated pieces you might not otherwise find.",

        20.00,

        "Ages 0-99, max of 20 per group",

        "Duration: 3h",

        "Start time: Check availability",

        "Mobile ticket",

        "German, English",

         "Itinerary
          This is a typical itinerary for this product
          Pass By: Berlin, Berlin
          Enjoy a great inspirational Street Art Tour through the districts of Friedrichshain and Kreuzberg ",

        "Departure details
         Revaler Str. 2, 10243 Berlin, Germany
         Find your guide in front of the REWE supermarket at 2PM.
         Return details
         Wrangelkiez, 10997 Berlin, Germany
         we will finish in Kreuzberg close to the U1 line",

        "Confirmation will be received at time of booking
         Good walking shoes.
         An umbrella if raining.
         Guests should have a metro ticket as public transport is used through out the tour.
         Most travellers can participate
         This experience requires a minimum number of travellers. If it's cancelled because the minimum isn't met, you'll be offered a different date/experience or a full refund
         This tour/activity will have a maximum of 20 travellers",

         "For a full refund, cancel at least 24 hours in advance of the start date of the experience."
    )



