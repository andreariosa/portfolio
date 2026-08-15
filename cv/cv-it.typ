#import "@preview/basic-resume:0.2.9": *
#import "common.typ": *

#show: resume.with(
  author: name,
  location: location-it,
  email: email,
  github: github,
  phone: phone,
  personal-site: personal-site,
  accent-color: accent-color,
  font: resume-font,
  paper: resume-paper,
  author-position: left,
  personal-info-position: left,
)

#align(left)[*Esperienza & Innovazione* • *Organizzazione & Passione* • *Autonomia & Teamwork*]

== Esperienze Professionali

#work(
  title: "Senior Software Engineer | Technical Lead (Individual Contributor)",
  location: "Globale",
  company: link("https://www.microtec.com")[MiCROTEC S.p.A.],
  dates: dates-helper(start-date: "Set 2017", end-date: "Attuale"),
)
- _[Placeholder — descrizione da completare]_

#work(
  title: "Full Stack Web Developer",
  location: "Venezia, Italia",
  company: link("https://www.scquadro.it")[SCQUADRO Web Agency],
  dates: dates-helper(start-date: "Mar 2015", end-date: "Apr 2017"),
)
- Ha utilizzato tecnologie diverse in base al progetto, definendo le scelte architetturali
- Ha stimato i tempi di sviluppo e partecipato alla fase di progettazione con i clienti

#work(
  title: "Tecnico IT | Stage scolastico (160 ore)",
  location: "Venezia, Italia",
  company: link("https://www.veneziasistemi.it")[Venezia Sistemi S.r.l.],
  dates: dates-helper(start-date: "Giu 2012", end-date: "Lug 2012"),
)
- Supporto all'amministrazione di rete in un laboratorio IT operativo
- Diagnostica hardware e supporto IT affiancando tecnici senior

== Formazione ed Istruzione

#edu(
  institution: "Università Ca' Foscari Venezia",
  location: "Venezia, Italia",
  dates: "",
  degree: "Laurea in Informatica",
)
- Tesi: "Progettazione e Sviluppo Front-End per un sistema di Eco-Feedback applicato ad un Campus Universitario Scientifico", realizzata in collaborazione con Siemens
- Ha progettato e pubblicato l'app Android "EcoUnive" su Google Play; citata da Ca' Foscari News e presentata durante il corso di Human-Computer Interaction
- Menzionato nel paper "From Building Control to Eco-Feedback: Opportunities and Challenges" del Prof. Fabio Pittarello (Tolosa, Francia)
- Secondo classificato al concorso Ca' Foscari Sostenibile

#edu(
  institution: "ITIS Primo Levi",
  location: "Venezia, Italia",
  dates: "",
  degree: "Diploma di Perito Capotecnico, Specializzazione Informatica (ABACUS)",
)

=== Certificati e corsi

- *Corsi:* Qt Academy by Qt Group (2024)
- *Certificato:* Next.js & React by Academind (26/07/2022)
- *Certificato:* Angular & Node.js — The MEAN solution stack by Academind (18/05/2020)
- *Certificato:* B2 inglese (28/04/2015)
- *Certificato:* B1 inglese (09/12/2013)
- *Certificato:* ECDL — European Computer Driving Licence (22/05/2013)
- *Certificato:* CISCO — CCNA Exploration: Network Fundamentals (09/06/2012)

== Lingue

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  [*Italiano* (Madrelingua) ■■■■■],
  [*Veneto* (Madrelingua) ■■■■■],
  [*Inglese* (Livello B2) ■■■■□],
)

== Competenze Tecniche

- *Industria:* Windows, WinAPI, *C*, *C++*, Proprietary Frameworks, CMake, Conan, SQL, RDBMS, Advanced Debugging, Testing, Optimization, Automation
- *Web:* Linux Server, HTML, CSS, Sass, JavaScript, TypeScript, NoSQL, Cloud Platforms, Bootstrap, Tailwind CSS, Node.js, Express.js, Next.js
- *Strumenti:* Microsoft Visual Studio, Visual Studio Code, Git, SVN, Docker, Azure DevOps, GitHub, Jira, Trello, Microsoft 365, Google Workspace

== Progetti di Rilievo

#project(
  name: "TasteTweak",
  url: "tastetweak.com",
  dates: "",
)
- Un ecosistema digitale B2B composto da due prodotti (un'applicazione web con IA generativa ed un'app per iOS ed Android) pensati per semplificare e gestire in modo completo le attività ristorative

#project(
  name: "BoostNatura",
  url: "boostnatura.com",
  dates: "",
)
- Un plugin multipiattaforma destinato agli e-commerce che trasforma ogni acquisto effettuato presso un qualsiasi store online in un impatto significativo contro il cambiamento climatico

== Attività Extracurriculari

#extracurriculars(
  activity: "Open Source e Formazione Autonoma",
  dates: "",
)
- Interessi personali in Cybersecurity, Data Scraping e Finanza Personale approfonditi con studio autonomo, progetti open source dedicati e partecipazione ad hackathon

#extracurriculars(
  activity: "Organizzazione di Eventi Esports",
  dates: "",
)
- Ha organizzato e gestito personalmente, negli anni, eventi legati all'esports come LAN party e piattaforme online per tornei, con sponsor e rilevanza a livello nazionale
