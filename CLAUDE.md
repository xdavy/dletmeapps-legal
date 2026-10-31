# dletmeapps-legal

Pages légales publiques des apps iOS de la famille dletmeapps : une politique de confidentialité et une page de support par app, en anglais et en français, servies par GitHub Pages à `https://xdavy.github.io/dletmeapps-legal/`. Lecteurs : les utilisateurs des apps et la revue Apple.

Le niveau du projet (léger) et les décisions sont dans `DECISIONS.md`. Les règles communes à tous les projets sont dans `~/.claude/CLAUDE.md` ; ce fichier ne dit que ce qui est propre à celui-ci.

## Arborescence

- Site : la racine du dépôt, servie telle quelle par GitHub Pages. `index.html`, `style.css`, `.nojekyll`, puis un dossier par app en minuscules (`letmereminder/`, `letmenotes/`, `running7277/`) avec `privacy.html`, `privacy-fr.html`, `support.html`, `support-fr.html`.
- Scripts de vérification : `scripts/`.
- Documents (`DECISIONS.md`) : la racine, non versionnés.

## Langage et conventions

- HTML5 et CSS purs, sans générateur, sans framework, sans JavaScript.
- Texte en anglais dans `*.html`, en français dans `*-fr.html` ; un lien vers l'autre langue en tête de chaque page.
- Chaque page porte sa date de dernière mise à jour. Les noms d'apps sont les noms publics décidés dans `DECISIONS.md`.
- Chaque affirmation d'une politique de confidentialité s'appuie sur un fait lu dans le code de l'app, cité dans le compte rendu de l'étape.

## Commandes

- Vérifier : `sh scripts/check.sh` (pages bien formées via `xmllint --html`, liens internes).
- Voir en local : `python3 -m http.server 8000` à la racine, puis `http://localhost:8000/`.

## Sources de référence

- Apple : App Review Guidelines (règle 5.1.1) et l'aide App Store Connect (App Information, Platform version information).
- GitHub Docs : GitHub Pages.
- Le code des apps, sous `~/Documents/Projets/AppIOS/`, fait foi pour ce que chaque app fait des données.

## Sauvegarde

- git suffit, pas de zip ni de tar.

## Git

- Dépôt local créé le 30/10/2026 ; distant `github.com/xdavy/dletmeapps-legal`, **public** (GitHub Pages l'exige sur un compte Free), créé le 31/10/2026 avec accord explicite ; GitHub Pages sert la branche `main` à la racine, à `https://xdavy.github.io/dletmeapps-legal/` ; un tag `etape-<N>-validee` par étape validée ; commit à la livraison, tag et push à la validation ; rien n'est poussé sans accord.
- Adresse d'auteur des commits : `2988877+xdavy@users.noreply.github.com`, réglée en local dans ce dépôt (D-010 du 31/10/2026) ; jamais l'adresse personnelle.
- Tout fichier versionné est public : rien de personnel au-delà du nom et de l'adresse de support, pas de chemin `/Users/`.
- Non versionnés : `DECISIONS.md`, captures locales (bloc commun du `.gitignore`). Versionnés : le site, `scripts/`, `CLAUDE.md`, `README.md` s'il existe.

## Interdits propres au projet

- Ne jamais renommer ni déplacer une URL publiée : App Store Connect pointe dessus.
- Aucune donnée personnelle de tiers, aucun secret, dans aucun fichier du dépôt.
