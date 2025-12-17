# 🔬 MCP Gateway - Recherche EU/Wallonie

> **28 serveurs MCP** pour maximiser les chances de succès aux appels à projets européens
> **Format**: 100% compatible Docker MCP Toolkit

## 📊 Vue d'ensemble

| Métrique | Valeur |
|----------|--------|
| Serveurs MCP | 28 |
| APIs européennes | 28 |
| Port | 8080 |
| Pricing | Premium |
| Compliance | RGPD, NIS2 |

### Métriques de Performance Attendues

| Métrique | Avant | Après | Amélioration |
|----------|-------|-------|--------------|
| Recherche partenaires | 2-3 semaines | 2-3 heures | **-95%** |
| État de l'art | 60-70% couverture | 95-99% | **+40%** |
| Taux de succès appels | 10-15% | 30-50% | **+200%** |

---

## 🚀 Démarrage Rapide

### Option 1: Docker Compose (Recommandé)

```bash
# 1. Configurer les secrets
cp .env.example .env
# Éditer .env avec vos clés API (optionnel pour la plupart)

# 2. Démarrer
docker compose up -d

# 3. Vérifier
curl http://localhost:8080/health
```

### Option 2: Docker MCP CLI

```bash
# 1. Importer le catalogue
docker mcp catalog import ./catalog-docker-mcp.yaml

# 2. Activer un profil
docker mcp gateway run --profile quick-start --port 8080

# Ou activer des serveurs spécifiques
docker mcp server enable cordis openaire ror crossref openalex
docker mcp gateway run --port 8080 --transport streaming
```

### Option 3: Podman Desktop

```bash
podman-compose up -d
```

---

## 📁 Fichiers

| Fichier | Description |
|---------|-------------|
| `catalog-docker-mcp.yaml` | ✅ Catalogue format Docker MCP Toolkit |
| `catalog.yaml` | Format legacy (migration en cours) |
| `compose.yaml` | Docker Compose |
| `podman-compose.yml` | Podman Compose (legacy) |
| `config.yaml` | Configuration des serveurs |
| `.env.example` | Variables d'environnement |
| `servers/` | Définitions détaillées des serveurs |

---

## 🎯 Profiles Disponibles

```bash
# Démarrage rapide (5 serveurs essentiels)
docker mcp gateway run --profile quick-start

# Recherche de partenaires
docker mcp gateway run --profile partner-search

# État de l'art / Revue de littérature
docker mcp gateway run --profile state-of-art

# Tous les serveurs
docker mcp gateway run --profile full

# Secteur santé
docker mcp gateway run --profile health

# Secteur environnement
docker mcp gateway run --profile environment
```

| Profile | Serveurs | Description |
|---------|----------|-------------|
| `quick-start` | cordis, openaire, ror, crossref, openalex | Essentiels pour démarrer |
| `partner-search` | eu-partner-search, openaire, ror, orcid, cordis | Trouver des partenaires |
| `state-of-art` | semantic-scholar, europe-pmc, crossref, openalex, pubmed, opencitations | Revue de littérature |
| `full` | 24 serveurs | Configuration complète |
| `health` | europe-pmc, pubmed, clinicaltrials, uniprot, cordis, openaire | Secteur santé |
| `environment` | copernicus, eurostat, cordis, openaire, wikidata | Secteur environnement |

---

## 📋 Serveurs par Catégorie

### 💰 Appels à Projets & Financements (3)
| Serveur | Description | Auth |
|---------|-------------|------|
| `eu-funding-portal` | Portail officiel EU Funding & Tenders | Public |
| `cordis` | Base de données des projets EU | Public |
| `era-learn` | Partenariats européens | Public |

### 👥 Recherche de Partenaires (4)
| Serveur | Description | Auth |
|---------|-------------|------|
| `eu-partner-search` | Service officiel de recherche de partenaires | EU Login |
| `openaire` | Graphe de recherche européen (150M+ publications) | Public |
| `ror` | Registre des organisations de recherche | Public |
| `orcid` | Identifiants de chercheurs | Public |

### 📚 Littérature Scientifique (6)
| Serveur | Description | Auth |
|---------|-------------|------|
| `semantic-scholar` | IA pour la recherche (200M+ papers) | API Key (optionnel) |
| `europe-pmc` | Archive biomédicale européenne | Public |
| `crossref` | Métadonnées DOI (140M+ publications) | Email (recommandé) |
| `openalex` | Catalogue ouvert (250M+ works) | Email (recommandé) |
| `pubmed` | Base biomédicale NCBI | API Key (optionnel) |
| `scopus` | Elsevier (50M+ abstracts) | **Licence requise** |

### 🗂️ Données de Référence (2)
| Serveur | Description | Auth |
|---------|-------------|------|
| `euroscivoc` | Vocabulaire scientifique européen | Public |
| `cordis-ref` | Données de référence CORDIS | Public |

### 📊 Indicateurs & Évaluation (4)
| Serveur | Description | Auth |
|---------|-------------|------|
| `opencitations` | Citations ouvertes (1.5B+ citations) | Public |
| `scholexplorer` | Liens publications-datasets | Public |
| `grist` | Système d'information subventions | Public |
| `open-funder-registry` | Registre des financeurs | Public |

### ✅ Conformité & Validation (1)
| Serveur | Description | Auth |
|---------|-------------|------|
| `vies` | Validation TVA européenne | Public |

### 📄 Propriété Intellectuelle (1)
| Serveur | Description | Auth |
|---------|-------------|------|
| `epo-ops` | Brevets européens (130M+ documents) | API Key |

### 🌐 Données Complémentaires (4)
| Serveur | Description | Auth |
|---------|-------------|------|
| `eurostat` | Statistiques européennes | Public |
| `wikidata` | Base de connaissances (100M+ items) | Public |
| `datacite` | DOIs pour datasets | Public |
| `zenodo` | Dépôt de recherche CERN | API Key (optionnel) |

### 🏥 Secteur Santé (2)
| Serveur | Description | Auth |
|---------|-------------|------|
| `clinicaltrials` | Essais cliniques (450K+ études) | Public |
| `uniprot` | Base de protéines | Public |

### 🌍 Secteur Environnement (1)
| Serveur | Description | Auth |
|---------|-------------|------|
| `copernicus` | Observation de la Terre | Compte gratuit |

---

## 🔐 Configuration des Secrets

### Secrets Optionnels (améliorent le rate limit)

```bash
# .env
semantic-scholar.api_key=your-key
pubmed.api_key=your-ncbi-key
```

### Secrets Requis (pour certains serveurs)

```bash
# EPO (brevets)
epo-ops.consumer_key=your-key
epo-ops.consumer_secret=your-secret

# Scopus (licence institutionnelle)
scopus.api_key=your-key
scopus.inst_token=your-token

# EU Partner Search
eu-partner-search.eu_login_username=your-username
eu-partner-search.eu_login_password=your-password

# Copernicus
copernicus.username=your-username
copernicus.password=your-password
```

---

## 🔗 Connexion Client

### Claude Desktop

```json
{
  "mcpServers": {
    "recherche-eu": {
      "command": "docker",
      "args": ["mcp", "gateway", "run", "--profile", "quick-start"]
    }
  }
}
```

### Via HTTP (streaming)

```bash
# Le gateway écoute sur http://localhost:8080/mcp
curl -X POST http://localhost:8080/mcp \
  -H "Content-Type: application/json" \
  -d '{"method": "tools/list"}'
```

---

## 📚 Documentation

- [Analyse Docker MCP Toolkit](../DOCKER_MCP_TOOLKIT_ANALYSIS.md)
- [Templates](../_templates/)
- [Docker MCP Gateway](https://github.com/docker/mcp-gateway)

---

## 🤝 Support

- 📧 contact@vardaa.eu
- 🌐 https://vardaa.eu
