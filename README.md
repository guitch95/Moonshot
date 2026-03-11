# 🚀 Moonshot

Application iOS éducative sur le programme spatial Apollo, développée avec **SwiftUI**.

`Swift` `iOS` `SwiftUI` `JSON`

## 📱 Aperçu

<div align="center">
  <img src="./assets/demo.gif" width="300" alt="Moonshot Demo">
</div>

## ✨ Fonctionnalités

- 🌕 Catalogue complet des missions Apollo (Apollo 1 à Apollo 17)
- 👨‍🚀 Fiches détaillées de chaque astronaute
- 🧑‍🤝‍🧑 Équipage par mission avec rôles (Commander, Pilot…)
- 📅 Dates de lancement formatées
- 🎨 Thème sombre personnalisé
- 📐 Grille adaptative responsive (LazyVGrid)

## 🛠️ Technologies utilisées

| Technologie | Utilisation |
|---|---|
| Swift | Langage de programmation |
| SwiftUI | Framework UI déclaratif |
| JSON | Données embarquées (missions + astronautes) |
| Bundle | Chargement et décodage des fichiers locaux |

## 🏗️ Architecture

```
Moonshot/
├── Models/
│   ├── Astronaut.swift          # Struct Codable, Identifiable
│   ├── Mission.swift            # Struct avec CrewRole imbriqué, computed properties
│   └── CrewMember.swift         # Association rôle + astronaute
├── Views/
│   ├── ContentView.swift        # Grille des missions (LazyVGrid)
│   ├── MissionView.swift        # Détail mission + équipage
│   ├── AstronautView.swift      # Fiche astronaute
│   └── SquadView.swift          # ScrollView horizontale de l'équipage
├── Extensions/
│   ├── Bundle-Decodable.swift   # Décodeur JSON générique avec gestion d'erreurs
│   └── Color-Theme.swift        # Couleurs custom (darkBackground, lightBackground)
└── Data/
    ├── astronauts.json          # Données des astronautes
    └── missions.json            # Données des missions Apollo
```

### Flux de données

```
┌─────────────────────────────────────────────────────┐
│  JSON (astronauts.json + missions.json)             │
│  → Chargés depuis le Bundle via decode<T> générique │
└─────────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────────┐
│  ContentView                                        │
│  → Décode les deux fichiers JSON au lancement       │
│  → Affiche les missions en LazyVGrid adaptive       │
│  → NavigationLink vers MissionView                  │
└─────────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────────┐
│  MissionView                                        │
│  → Mappe crew JSON → [CrewMember] dans l'init       │
│  → Affiche détails mission + SquadView              │
└─────────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────────┐
│  AstronautView                                      │
│  → Fiche individuelle (photo, biographie)           │
└─────────────────────────────────────────────────────┘
```

## 📚 Concepts SwiftUI appliqués

| Concept | Utilisation |
|---|---|
| `Codable` + `Identifiable` | Modèles décodables depuis JSON |
| Generics (`decode<T>`) | Extension Bundle réutilisable pour tout type Codable |
| `NavigationStack` + `NavigationLink` | Navigation multi-niveaux (grille → mission → astronaute) |
| `LazyVGrid` + `GridItem(.adaptive)` | Grille responsive selon la taille d'écran |
| `ScrollView(.horizontal)` | Défilement horizontal pour l'équipage |
| `containerRelativeFrame` | Dimensionnement relatif des images |
| `DateFormatter` | Décodage de dates custom (`y-MM-dd`) |
| `ShapeStyle` extension | Thème de couleurs custom (`darkBackground`, `lightBackground`) |
| Struct imbriquée (`Mission.CrewRole`) | Organisation propre des types liés |

## 🚀 Installation

```bash
git clone https://github.com/guitch95/Moonshot.git
cd Moonshot
open Moonshot.xcodeproj
```

## 📈 Améliorations possibles

- [ ] Recherche par nom d'astronaute ou de mission
- [ ] Toggle grille / liste
- [ ] Favoris avec SwiftData
- [ ] Animations de transition entre vues

## 👤 Auteur

**Guillaume Richard**

## 📚 Ressources

- [100 Days of SwiftUI - Project 8](https://www.hackingwithswift.com/books/ios-swiftui/moonshot-introduction)
