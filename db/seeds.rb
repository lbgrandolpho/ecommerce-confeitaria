Flavor.destroy_all

flavors = [
  { name: "Chocolate", description: "Sabor clássico e irresistível.", price_per_kg: 49.90 },
  { name: "Baunilha", description: "Suave e delicado, perfeito para qualquer ocasião.", price_per_kg: 45.00 },
  { name: "Morango", description: "Fresco e frutado, feito com morangos selecionados.", price_per_kg: 52.50 },
  { name: "Limão Siciliano", description: "Refrescante e cítrico, com um toque de acidez.", price_per_kg: 47.75 },
  { name: "Coco", description: "Sabor tropical, cremoso e delicioso.", price_per_kg: 50.00 },
  { name: "Doce de Leite", description: "Uma explosão de doçura e cremosidade.", price_per_kg: 55.90 }
]

Flavor.create!(flavors)

puts "Seed de sabores criada com sucesso! Foram adicionados #{Flavor.count} sabores."
