# NVDA Add-on: ProtonVPN Accessibility

Cet add-on NVDA améliore l'accessibilité de l'application ProtonVPN pour Windows.

## Version 0.9.0

### Fonctionnalités

- **Labellisation intelligente** des boutons et contrôles ProtonVPN
- **Extraction dynamique** des valeurs (IP, Pays, Fournisseur, Trafic)
- **Raccourcis clavier** pour les actions VPN courantes
- Compatible avec NVDA 2023.1 à 2025.x

## Installation

### Méthode rapide (PowerShell)

```powershell
.\build_simple.ps1
```

Puis dans NVDA :
1. NVDA → Outils → Gérer les modules complémentaires → Installer...
2. Sélectionner le fichier `protonVPNAccessibility-0.9.0.nvda-addon`
3. Redémarrer NVDA

## Raccourcis clavier (dans ProtonVPN)

| Raccourci | Action |
|-----------|--------|
| `Ctrl+Shift+D` | Connecter / Déconnecter le VPN |
| `Ctrl+Shift+K` | Activer / Désactiver le Kill Switch |
| `Ctrl+Shift+C` | Ouvrir le sélecteur de pays |
| `Ctrl+Shift+T` | Annoncer les informations de trafic |

## Annonces NVDA améliorées

| Élément | Annonce |
|---------|---------|
| IP locale | "Votre adresse IP : X.X.X.X" |
| Pays | "Pays : France" |
| Fournisseur | "Fournisseur : Lumen" |
| IP VPN (connecté) | "Adresse IP du VPN : X.X.X.X" |
| Trafic total | "Trafic total : 12 Mo" |
| Trafic actuel | "Trafic actuel : 416 o/s, 0 o/s" |

## Structure du projet

```
addon/
├── appModules/
│   ├── protonvpnservice.py  # Module principal
│   └── protonvpn.py         # Redirect
└── globalPlugins/
    └── protonvpn_bridge.py  # Mapping executables
```

## Auteur

Mama Sene

## Licence

GPL v2

