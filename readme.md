# NVDA Add-on: ProtonVPN Accessibility

Cet add-on NVDA améliore l'accessibilité de l'application ProtonVPN pour Windows en corrigeant les noms des boutons et contrôles vocalisés.

## Objectif

Quand vous naviguez dans ProtonVPN avec TAB/MAJ+TAB/flèches, NVDA annonce désormais des noms compréhensibles (ex: "Connecter", "Déconnecter", "Sélectionner un emplacement") au lieu de noms techniques ou vides.

## Installation

### Méthode 1 : Via SCons (recommandée)

```bash
# Installer SCons si nécessaire
pip install scons

# Construire le package
scons

# Le fichier .nvda-addon sera généré
```

Puis dans NVDA :
1. NVDA → Outils → Gérer les modules complémentaires → Installer...
2. Sélectionner le fichier `protonVPNAccessibility-0.1.0.nvda-addon`
3. Redémarrer NVDA

### Méthode 2 : ZIP simple (alternative)

Si SCons n'est pas disponible :

1. Créer un fichier ZIP contenant le dossier `addon/` à la racine
2. Renommer le fichier en `.nvda-addon`
3. Installer via NVDA → Outils → Gérer les modules complémentaires

Ou utiliser le script PowerShell fourni :
```powershell
.\build_simple.ps1
```

### Méthode 3 : Test via Scratchpad (développement)

1. Ouvrir NVDA → Préférences → Paramètres → Avancé
2. Cocher "Activer le chargement de code personnalisé depuis le répertoire Developer Scratchpad"
3. Copier `addon/appModules/protonvpn.py` vers `%APPDATA%\nvda\scratchpad\appModules\`
4. Redémarrer NVDA

## Utilisation

Une fois installé, l'add-on s'active automatiquement quand ProtonVPN est lancé.

**Note** : Le fichier `protonvpn.py` cible le processus `ProtonVPN.exe`. Si le nom de l'exécutable est différent, renommez le fichier en conséquence.

### Raccourcis clavier (dans ProtonVPN uniquement)

| Raccourci | Action |
|-----------|--------|
| `NVDA+Shift+S` | Annonce l'état de connexion VPN |
| `NVDA+Shift+D` | Debug : annonce les propriétés de l'élément focalisé |
| `NVDA+Shift+C` | Navigation vers le bouton principal |

### Mode Debug

Le mode debug est activé par défaut. Pour vérifier les propriétés des éléments :

1. Focalisez un élément dans ProtonVPN
2. Appuyez sur `NVDA+Shift+D`
3. Les propriétés (Name, Role, AutomationId, etc.) seront annoncées

Pour désactiver le mode debug, modifiez `DEBUG_MODE = False` dans `protonvpn.py`.

## Limitations

- L'add-on utilise des règles de détection génériques basées sur les AutomationId
- Certains éléments peuvent nécessiter une personnalisation après inspection de l'UI réelle
- Version testée avec NVDA 2023.1 à 2025.1

## Structure du projet

```
add-on_expressVpn/
├── buildVars.py                              # Configuration SCons
├── sconstruct                                # Script de build SCons
├── manifest.ini.tpl                          # Template manifest
├── manifest-translated.ini.tpl
├── build_simple.ps1                          # Build alternatif PowerShell
├── readme.md                                 # Ce fichier
├── .gitignore
├── protonVPNAccessibility-0.1.0.nvda-addon   # Package généré
│
└── addon/
    ├── manifest.ini                          # Généré automatiquement
    ├── appModules/
    │   └── protonvpn.py                      # Module principal
    └── doc/
        └── en/
```

## Auteur

Mama Sene

## Licence

GPL v2
