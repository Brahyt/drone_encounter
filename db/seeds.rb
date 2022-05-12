heros = ['Adam Warlock', 'Ant-Man', 'Black Panther', 'Black Widow', 'Captain America', 'Captian Marvel', 'Doctor Strange', 'Drax', 'Gamora', 'Ghost-Spider', 'Groot', 'Hawkeye', 'Hulk', 'Iron Man', 'Ms Marvel', 'Nebula', 'Quicksilver', 'Rocket', 'Scarlet Witch', 'She-Hulk', 'Spectrum', 'Spider-Man (Miles Morales)', 'Spider-Man (Peter Parker)', 'Spider-Woman', 'Star-Lord', 'Thor', 'Valkyrie', 'Venom', 'Vision', 'War Machine', 'Wasp']

Hero.delete_all

heros.each do |hero|
  Hero.create(name: hero)
end


aspects = %w[Aggression Justice Leadership Protection]

Aspect.delete_all

aspects.each do |aspect|
  Aspect.create(name: aspect)
end
