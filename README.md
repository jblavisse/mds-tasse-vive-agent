# La Tasse Vive · kit de départ pour l'agent IA

Tout ce qu'il faut pour faire tourner le café La Tasse Vive sur votre machine et construire son agent IA : la base Supabase (carte, réservations, comptes RLS du 30/10, réservations à venir), n8n et Mailpit, et le workflow LLM du 30/10.

## Ce qu'il vous faut

- **Docker Desktop**, lancé.
- **Node.js** (pour `npx supabase`).
- **Ollama**, puis les deux modèles du cours :

```bash
ollama pull qwen2.5:3b          # le LLM du 30/10 (trier un message)
ollama pull qwen3:4b-instruct   # le modèle de l'agent IA
```

## 1. Lancer n8n et Mailpit

```bash
docker compose up -d
```

- n8n : http://localhost:5678 (créez votre compte au premier lancement)
- Mailpit : http://localhost:8025

## 2. Lancer la base du café

```bash
npx supabase start
npx supabase db reset
```

`db reset` crée les tables `products` et `reservations`, la carte (12 produits), 15 réservations passées et 5 réservations à venir (Sophie Lambert et Mehdi Rahmani le samedi 21/11, Claire Dubois le 28/11…).

- Studio (pour voir les tables) : http://localhost:54323
- La clé dont n8n a besoin : `npx supabase status`, ligne **service_role key** (ou **Secret key**).

## 3. Les credentials dans n8n

| Credential | Réglage |
|---|---|
| **Ollama** | URL `http://host.docker.internal:11434` |
| **Supabase** (pour les outils de l'agent) | Header Auth : nom `apikey`, valeur = la clé service_role · URL des appels : `http://host.docker.internal:54321/rest/v1/…` |
| **SMTP** (Mailpit) | hôte `mailpit`, port `1025`, sans SSL, « Disable STARTTLS » coché |

Depuis n8n (dans Docker), votre Mac s'appelle `host.docker.internal`, jamais `localhost`.

## 4. Importer le workflow du 30/10

Dans n8n : **Create workflow → ⋯ → Import from file**, puis `workflows/01-trier-un-message-en-un-mot.json`.
Choisissez votre credential **Ollama** dans le nœud « Ollama Model », puis **Execute workflow** : le message est classé en `reservation`, `question` ou `autre`.

## 5. La consigne du jour : l'assistant de l'équipe

Camille veut que son équipe pose ses questions dans un chat. Un assistant répond en lisant la carte et les réservations. Il ne modifie jamais rien.

1. « Le cake citron est-il disponible, et à quel prix ? »
2. « Combien de personnes ont réservé le samedi 21 novembre ? »
3. « Claire Dubois a réservé le 28 novembre : combien coûterait un café crème pour chaque personne de sa table ? »
4. « Annule la réservation de Mehdi Rahmani. » Il doit refuser.

Indice : un agent IA, et un outil par table, qui ne fait que lire.

## Tout arrêter

```bash
docker compose down
npx supabase stop
```
