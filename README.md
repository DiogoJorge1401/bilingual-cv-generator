# CV Typst — Template Bilíngue

Template de CV profissional em [Typst](https://typst.app/) com suporte a múltiplos idiomas (PT/EN) a partir de uma única fonte de dados.

## Estrutura do Projeto

```
├── cv.typ                      # Template principal (layout e estilos)
├── build-cv.sh                 # Script para gerar PDFs
├── cv-data.example.typ         # Exemplo de arquivo de dados
├── README.md
└── cvs/
    └── vaga-01-nodejs-golang/  # Pasta por vaga/versão
        ├── cv-data-vaga01.typ  # Dados do CV
        ├── vaga.md             # Descrição da vaga
        ├── cv-data-vaga01-en.pdf  # Gerado
        └── cv-data-vaga01-pt.pdf  # Gerado
```

## Uso

### Criar novo CV para uma vaga

1. Crie uma pasta em `cvs/`:
   ```bash
   mkdir -p cvs/nome-da-vaga
   ```

2. Copie o exemplo de dados:
   ```bash
   cp cv-data.example.typ cvs/nome-da-vaga/cv-data.typ
   ```

3. Edite o arquivo de dados com suas informações

4. Compile:
   ```bash
   ./build-cv.sh cvs/nome-da-vaga/cv-data.typ all
   ```

### Compilação

```bash
# Gera apenas português
./build-cv.sh cvs/vaga-01/cv-data.typ pt

# Gera apenas inglês
./build-cv.sh cvs/vaga-01/cv-data.typ en

# Gera ambos (pt e en)
./build-cv.sh cvs/vaga-01/cv-data.typ all
```

Os PDFs são gerados na **mesma pasta** do arquivo de dados.

## Como editar o conteúdo

Edite **apenas** o arquivo `cv-data.typ` da vaga. A estrutura suporta:

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

### Controle de quebra de página

O template usa `block(breakable: false)` para evitar que títulos fiquem separados do conteúdo em quebras de página:

- **Experiências**: Título + período + primeiro highlight ficam juntos
- **Projetos**: Título + lista completa ficam juntos

## ATS-Friendly

O template foi otimizado para compatibilidade com sistemas ATS (Applicant Tracking Systems):

- Estrutura linear sem colunas múltiplas
- Nomes de seção padrão (Experience, Skills, Education)
- Texto corrido, sem tabelas complexas
- Sem gráficos ou elementos visuais que confundem parsers
- PDF com texto selecionável/copiável

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

1. Adicione os dados no seu `cv-data.typ`
2. Adicione o label em `labels`
3. Use `#section(t(labels.nova_secao))` em `cv.typ`

## Requisitos

- [Typst](https://typst.app/) instalado
- Fonte Inter (opcional, usa fallback se não disponível)

## Licença

Uso pessoal.
