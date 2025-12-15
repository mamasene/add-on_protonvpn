# -*- coding: utf-8 -*-
"""
Configuration de build pour l'add-on NVDA ExpressVPN Accessibility.
Ce fichier est utilisé par SCons pour générer le package .nvda-addon.
"""

# Informations de l'add-on
addon_info = {
    "addon_name": "protonVPNAccessibility",
    "addon_summary": "Amélioration de l'accessibilité de ProtonVPN",
    "addon_description": """Cet add-on NVDA corrige les noms des boutons et éléments d'interface dans l'application ProtonVPN, afin que NVDA annonce des libellés clairs lors de la navigation au clavier.

Fonctionnalités principales :
- Correction des noms de boutons (Connecter, Déconnecter, Sélectionner un emplacement)
- Mode debug pour identifier les contrôles
- Scripts internes pour des raccourcis rapides dans ProtonVPN""",
    "addon_version": "0.1.0",
    "addon_changelog": """Version 0.1.0 :
- Version initiale
- Correction des noms des boutons principaux
- Mode debug intégré
- Scripts NVDA internes (NVDA+Shift+S, NVDA+Shift+D, NVDA+Shift+C)""",
    "addon_author": "Mama Sene <contact@example.com>",
    "addon_url": "",
    "addon_sourceURL": "",
    "addon_docFileName": "readme.html",
    "addon_minimumNVDAVersion": "2023.1.0",
    "addon_lastTestedNVDAVersion": "2025.1.0",
    "addon_updateChannel": None,
    "addon_license": "GPL v2",
    "addon_licenseURL": "https://www.gnu.org/licenses/gpl-2.0.html",
}

# Fichiers source Python à inclure
pythonSources = [
    "addon/appModules/*.py",
]

# Fichiers à traduire
i18nSources = pythonSources + ["buildVars.py"]

# Fichiers à exclure du package
excludedFiles = [
    "*.pyc",
    "__pycache__",
    "*.pyo",
]

# Langue de base (pour la documentation)
baseLanguage = "en"

# Extensions markdown pour la documentation
markdownExtensions = []

# Tables braille personnalisées (vide pour cet add-on)
brailleTables = {}

# Dictionnaires de symboles (vide pour cet add-on)
symbolDictionaries = {}
