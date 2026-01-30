// cv-data.example.typ — Exemplo com dados fictícios
// Copie este arquivo para cv-data.typ e edite com seus dados

#let cv = (
  name: "Jane Doe",

  title: (
    en: "Full-Stack Developer | Cloud & DevOps Enthusiast",
    pt: "Desenvolvedora Full-Stack | Entusiasta de Cloud & DevOps",
  ),

  contact: (
    phone: "+55 (11) 99999-9999",
    email: "jane.doe@email.com",
    github: "https://github.com/janedoe",
    linkedin: "https://www.linkedin.com/in/janedoe/",
  ),

  summary: (
    en: "Full-Stack Developer with 3+ years of experience building modern web applications. Passionate about clean code, automated testing, and cloud-native architectures. Experienced in React, Node.js, and AWS services.",
    pt: "Desenvolvedora Full-Stack com mais de 3 anos de experiência construindo aplicações web modernas. Apaixonada por código limpo, testes automatizados e arquiteturas cloud-native. Experiente em React, Node.js e serviços AWS.",
  ),

  experience: (
    (
      company: "TechCorp Solutions",
      role: (en: "Full-Stack Developer", pt: "Desenvolvedora Full-Stack"),
      period: (en: "Jan 2023 – Present", pt: "Jan 2023 – Atualmente"),
      highlights: (
        (
          label: (en: "Feature Development", pt: "Desenvolvimento de Features"),
          desc: (
            en: "Led the development of a customer portal serving 50k+ users, improving user engagement by 40%.",
            pt: "Liderou o desenvolvimento de um portal de clientes atendendo 50k+ usuários, melhorando o engajamento em 40%.",
          ),
        ),
        (
          label: (en: "Performance", pt: "Performance"),
          desc: (
            en: "Optimized API response times by 60% through caching strategies and database query optimization.",
            pt: "Otimizou tempos de resposta da API em 60% através de estratégias de cache e otimização de queries.",
          ),
        ),
        (
          label: (en: "CI/CD", pt: "CI/CD"),
          desc: (
            en: "Implemented automated deployment pipelines reducing release time from days to hours.",
            pt: "Implementou pipelines de deploy automatizados reduzindo o tempo de release de dias para horas.",
          ),
        ),
      ),
    ),
    (
      company: "StartupXYZ",
      role: (en: "Junior Developer", pt: "Desenvolvedora Júnior"),
      period: (en: "Jun 2021 – Dec 2022", pt: "Jun 2021 – Dez 2022"),
      highlights: (
        (
          desc: (
            en: "Developed RESTful APIs using Node.js and Express for mobile applications.",
            pt: "Desenvolveu APIs RESTful usando Node.js e Express para aplicações mobile.",
          ),
        ),
        (
          desc: (
            en: "Built responsive front-end interfaces with React and TypeScript.",
            pt: "Construiu interfaces front-end responsivas com React e TypeScript.",
          ),
        ),
        (
          desc: (
            en: "Collaborated in agile teams using Scrum methodology.",
            pt: "Colaborou em times ágeis usando metodologia Scrum.",
          ),
        ),
      ),
    ),
  ),

  projects: (
    (
      title: (
        en: "E-commerce Platform Modernization",
        pt: "Modernização de Plataforma E-commerce",
      ),
      problem: (
        en: "Legacy monolithic system with poor scalability and slow deployment cycles.",
        pt: "Sistema monolítico legado com baixa escalabilidade e ciclos de deploy lentos.",
      ),
      solution: (
        en: "Migrated to microservices architecture with Docker and Kubernetes orchestration.",
        pt: "Migrou para arquitetura de microsserviços com orquestração Docker e Kubernetes.",
      ),
      value: (
        en: "Achieved 99.9% uptime and reduced infrastructure costs by 30%.",
        pt: "Alcançou 99.9% de uptime e reduziu custos de infraestrutura em 30%.",
      ),
    ),
  ),

  skills: (
    (
      category: (en: "Languages", pt: "Linguagens"),
      items: "TypeScript, JavaScript, Python, SQL",
    ),
    (
      category: (en: "Frontend", pt: "Frontend"),
      items: "React, Next.js, Tailwind CSS, HTML/CSS",
    ),
    (
      category: (en: "Backend", pt: "Backend"),
      items: "Node.js, Express, NestJS, GraphQL",
    ),
    (
      category: (en: "Databases", pt: "Bancos de Dados"),
      items: "PostgreSQL, MongoDB, Redis",
    ),
    (
      category: (en: "Cloud & DevOps", pt: "Cloud & DevOps"),
      items: "AWS, Docker, Kubernetes, GitHub Actions",
    ),
  ),

  education: (
    degree: (
      en: "Bachelor's Degree in Computer Science",
      pt: "Bacharelado em Ciência da Computação",
    ),
    institution: "Universidade Federal de São Paulo",
    period: (en: "Jan 2017 – Dec 2020", pt: "Jan 2017 – Dez 2020"),
  ),

  languages: (
    (
      name: (en: "Portuguese", pt: "Português"),
      level: (en: "Native", pt: "Nativo"),
    ),
    (
      name: (en: "English", pt: "Inglês"),
      level: (en: "Advanced (C1)", pt: "Avançado (C1)"),
    ),
    (
      name: (en: "Spanish", pt: "Espanhol"),
      level: (en: "Basic", pt: "Básico"),
    ),
  ),
)

// Labels de seção
#let labels = (
  summary: (en: "Professional Summary", pt: "Resumo Profissional"),
  experience: (en: "Professional Experience", pt: "Experiência Profissional"),
  projects: (en: "Key Projects", pt: "Projetos de Destaque"),
  skills: (en: "Technical Skills", pt: "Habilidades Técnicas"),
  education: (en: "Education", pt: "Educação"),
  languages: (en: "Languages", pt: "Idiomas"),
  problem: (en: "Challenge", pt: "Desafio"),
  solution: (en: "Solution", pt: "Solução"),
  value: (en: "Impact", pt: "Impacto"),
)
