# CV Typst — Template Bilíngue

Template de CV profissional em [Typst](https://typst.app/) com suporte a múltiplos idiomas (PT/EN) a partir de uma única fonte de dados.

## Estrutura do Projeto

```
├── cv.typ          # Template principal (layout e estilos)
├── cv-data.typ     # Dados do CV (edite apenas este arquivo)
├── build.sh        # Script para gerar ambos os PDFs
└── README.md       # Este arquivo
```

## Uso

### Compilação individual

```bash
# Inglês
typst compile cv.typ --input lang=en cv-en.pdf

# Português
typst compile cv.typ --input lang=pt cv-pt.pdf
```

### Build completo

```bash
./build.sh
```

Gera ambos os PDFs em `./output/`.

## Como editar o conteúdo

Edite **apenas** o arquivo `cv-data.typ`. A estrutura suporta:

### Texto bilíngue

```typst
title: (
  en: "Backend Engineer",
  pt: "Engenheiro Backend",
),
```

### Texto único (mesmo em ambos idiomas)

```typst
phone: "+55 (17) 99708-8617",
```

### Seções disponíveis

| Seção        | Descrição                           |
| ------------ | ----------------------------------- |
| `name`       | Nome completo                       |
| `title`      | Título profissional                 |
| `contact`    | Phone, email, GitHub, LinkedIn      |
| `summary`    | Resumo profissional                 |
| `skills`     | Habilidades técnicas por categoria  |
| `projects`   | Projetos com Problem/Solution/Value |
| `experience` | Experiências com highlights         |
| `education`  | Formação acadêmica                  |
| `languages`  | Idiomas falados                     |

## Design System

### Hierarquia tipográfica

| Elemento       | Tamanho | Peso       | Cor       |
| -------------- | ------- | ---------- | --------- |
| Nome (h1)      | 26pt    | 800        | `#111827` |
| Seções (h2)    | 14pt    | 700        | `#111827` |
| Job title (h3) | 13pt    | 600        | `#111827` |
| Body           | 11pt    | 400        | `#1f2937` |
| Datas          | 10pt    | 400 italic | `#374151` |
| Contatos       | 10pt    | 400        | `#374151` |

### Cores

```typst
title-color  = #111827  // Títulos (quase preto)
text         = #1f2937  // Texto principal (cinza escuro)
muted-color  = #374151  // Secundário (cinza médio)
border-color = #e5e7eb  // Linhas divisórias
link-color   = #2563eb  // Links (azul)
```

### Espaçamentos

| Elemento              | Valor                             |
| --------------------- | --------------------------------- |
| Margens da página     | 12mm (topo/base), 15mm (laterais) |
| Entre seções          | 18pt + linha + 14pt               |
| Antes de job-title    | 12pt                              |
| Line-height (leading) | 1em                               |

### Fontes

Fallback stack: `Inter` → `Segoe UI` → `Liberation Sans`

## Customização

### Alterar cores

Edite as variáveis no início de `cv.typ`:

```typst
#let title-color = rgb("#111827")
#let muted-color = rgb("#374151")
#let border-color = rgb("#e5e7eb")
#let link-color = rgb("#2563eb")
```

### Alterar ordem das seções

Reordene os blocos na seção `// ============ DOCUMENTO ============` em `cv.typ`.

Ordem atual:

1. Summary
2. Experience
3. Projects
4. Skills
5. Education
6. Languages

### Adicionar nova seção

1. Adicione os dados em `cv-data.typ`
2. Adicione o label em `labels`
3. Use `#section(t(labels.nova_secao))` em `cv.typ`

## Requisitos

- [Typst](https://typst.app/) instalado
- Fonte Inter (opcional, usa fallback se não disponível)

## Licença

Uso pessoal.
