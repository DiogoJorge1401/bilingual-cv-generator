// cv.typ — Template principal
// Uso: typst compile cv.typ --input lang=en cv-en.pdf
//      typst compile cv.typ --input lang=pt cv-pt.pdf

#import "cv-data.typ": cv, labels

// Idioma via CLI (default: en)
#let lang = sys.inputs.at("lang", default: "en")

// Helper: pega valor do idioma ou retorna string direta
#let t(value) = {
  if type(value) == dictionary {
    value.at(lang, default: value.at("en", default: ""))
  } else {
    value
  }
}

// ============ CONFIGURACAO DE PAGINA ============
#set page(
  paper: "a4",
  margin: (top: 12mm, bottom: 12mm, left: 15mm, right: 15mm),
)

#set text(
  font: ("Inter", "Segoe UI", "Liberation Sans"),
  size: 11pt,
  fill: rgb("#1f2937"), // --text (mais escuro)
)

#set par(
  leading: 1em, // line-height mais espaçoso
  justify: false,
)

// Estilo de links (azul + underline dotted)
#let link-color = rgb("#2563eb")  // azul
#show link: it => {
  text(fill: link-color)[#underline(stroke: (dash: "dotted", paint: link-color), it)]
}

// ============ ESTILOS ============
#let title-color = rgb("#111827")  // --title
#let muted-color = rgb("#374151")  // --muted (mais escuro)
#let border-color = rgb("#e5e7eb") // --border

// Header (nome)
#let header(name, subtitle) = {
  text(26pt, weight: 800, fill: title-color, tracking: -0.02em)[#upper(name)]
  v(8pt)
  text(12pt, weight: 600, fill: title-color)[#subtitle]
}

// Contato
#let contact-line(phone, email, github, linkedin) = {
  set text(10pt, fill: muted-color)
  v(6pt)
  [Phone: #phone #h(0.5em) • #h(0.5em) Email: #link("mailto:" + email)[#email]]
  linebreak()
  [GitHub: #link(github) #h(0.5em) • #h(0.5em) LinkedIn: #link(linkedin)]
}

// Secao (h2) - linha fica antes do título (após conteúdo anterior)
#let section(title, first: false) = {
  v(18pt)
  if not first {
    line(length: 100%, stroke: 1pt + border-color)
    v(14pt)
  }
  text(14pt, weight: 700, fill: title-color)[#title]
  v(4pt)
}

// Experiencia (mantém título + período + primeiro highlight juntos)
#let experience(exp, first: false) = {
  if not first { v(14pt) }

  // Primeiro highlight (se existir)
  let first-highlight = if exp.highlights.len() > 0 {
    let item = exp.highlights.at(0)
    if "label" in item {
      [*#t(item.label):* #t(item.desc)]
    } else {
      t(item.desc)
    }
  }

  // Bloco não quebrável: título + período + primeiro highlight
  block(breakable: false)[
    #text(13pt, weight: 600, fill: title-color)[#t(exp.company) | #t(exp.role)]
    #v(4pt)
    #text(10pt, weight: 400, style: "italic", fill: muted-color)[#t(exp.period)]
    #v(4pt)
    #if first-highlight != none { list(first-highlight) }
  ]

  // Restante dos highlights (podem quebrar)
  for item in exp.highlights.slice(1) {
    let content = if "label" in item {
      [*#t(item.label):* #t(item.desc)]
    } else {
      t(item.desc)
    }
    list(content)
  }
}

// Projeto (breakable: false mantém título + corpo juntos)
#let project(p, first: false) = {
  if not first { v(14pt) }
  block(breakable: false)[
    #text(13pt, weight: 600, fill: title-color)[#t(p.title)]
    #v(4pt)
    #list(
      [*#t(labels.problem):* #t(p.problem)],
      [*#t(labels.solution):* #t(p.solution)],
      [*#t(labels.value):* #t(p.value)],
    )
  ]
}

// Skills
#let skill-line(category, items) = {
  [*#t(category):* #t(items)]
  linebreak()
}

// ============ DOCUMENTO ============

#header(cv.name, t(cv.title))
#contact-line(cv.contact.phone, cv.contact.email, cv.contact.github, cv.contact.linkedin)

// RESUMO
#section(t(labels.summary))
#t(cv.summary)

// EXPERIENCIA
#section(t(labels.experience))
#for (i, exp) in cv.experience.enumerate() {
  experience(exp, first: i == 0)
}

// PROJETOS
#section(t(labels.projects))
#for (i, p) in cv.projects.enumerate() {
  project(p, first: i == 0)
}

// SKILLS
#section(t(labels.skills))
#v(4pt)
#for skill in cv.skills {
  skill-line(skill.category, skill.items)
}

// EDUCACAO
#section(t(labels.education))
#v(4pt)
#text(13pt, weight: 600, fill: title-color)[#t(cv.education.degree)] — #cv.education.institution
#linebreak()
#text(11pt, weight: 500, fill: muted-color)[#t(cv.education.period)]

// IDIOMAS
#section(t(labels.languages))
#v(4pt)
#for l in cv.languages {
  list([#t(l.name) — #t(l.level)])
}
