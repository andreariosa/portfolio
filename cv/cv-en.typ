#import "@preview/basic-resume:0.2.9": *
#import "common.typ": *

#show: resume.with(
  author: name,
  location: location-en,
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

//Senior Software Engineer and Technical Lead with 10+ years of experience, combining technical expertise, innovation and strong organizational skills. Autonomous and passionate, with a collaborative approach to teamwork and cross-functional problem solving.
#align(left)[Senior Software Engineer and Technical Lead with 10+ years of experience developing software for industrial scanning and optimization systems, from design through field commissioning. Cross-departmental technical reference on complex projects, with a hands-on approach to problem-solving and to sharing technical knowledge across teams.]

== Work Experience

#work(
  title: "Senior Software Engineer | Technical Lead (Individual Contributor)",
  location: "Global",
  company: link("https://www.microtec.com")[MiCROTEC S.p.A.],
  dates: dates-helper(start-date: "Sep 2017", end-date: "Present"),
)
- Develop and maintain software solutions for industrial wood scanning and optimization systems, contributing across design, development, testing, commissioning and customer support
- Act as a technical reference for Project Management and cross-functional teams, gathering requirements, supervising technical design and supporting project planning and execution
- Define guidelines and reference documentation for departments involved in technical design, supporting process consistency and technical knowledge accessibility across the company
- Coordinate technical activities across Development, Customer Support, Pre-Sales and After-Sales, including complex commissioning activities, on-site interventions and technical training
- Contribute to product evolution through requirements analysis, technical documentation, new feature definition and validation

#work(
  title: "Full Stack Web Developer",
  location: "Venice, Italy",
  company: link("https://www.scquadro.it")[SCQUADRO Web Agency],
  dates: dates-helper(start-date: "Mar 2015", end-date: "Apr 2017"),
)
- Used a range of technologies depending on each project, driving architectural decisions
- Estimated development timelines and took part in the design phase with clients

#work(
  title: "IT Technician | School internship (160 hours)",
  location: "Venice, Italy",
  company: link("https://www.veneziasistemi.it")[Venezia Sistemi S.r.l.],
  dates: dates-helper(start-date: "Jun 2012", end-date: "Jul 2012"),
)
- Supported network administration in a live IT lab environment
- Hardware diagnostics and IT support alongside senior technicians

== Education

#edu(
  institution: "Ca' Foscari University of Venice",
  location: "Venice, Italy",
  dates: "",
  degree: "Bachelor's Degree in Computer Science",
)
- Thesis: "Front-End Design and Development for an Eco-Feedback System Applied to a Scientific University Campus", developed in collaboration with Siemens
- Designed and published the companion "EcoUnive" Android app on Google Play; covered by Ca' Foscari News and presented during the Human-Computer Interaction course
- Mentioned in the paper "From Building Control to Eco-Feedback: Opportunities and Challenges" by Prof. Fabio Pittarello (Toulouse, France)
- Runner-up, Ca' Foscari Sustainable Project competition

#edu(
  institution: "ITIS Primo Levi",
  location: "Venice, Italy",
  dates: "",
  degree: "Technical High School Diploma in Computer Science",
)

=== Certificates and courses

- *Courses:* Qt Academy by Qt Group (2024)
- *Certificate:* Next.js & React by Academind (26/07/2022)
- *Certificate:* Angular & Node.js — The MEAN solution stack by Academind (18/05/2020)
- *Certificate:* English B2 (28/04/2015)
- *Certificate:* English B1 (09/12/2013)
- *Certificate:* ECDL — European Computer Driving Licence (22/05/2013)
- *Certificate:* CISCO — CCNA Exploration: Network Fundamentals (09/06/2012)

== Languages

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  [*Italian* (Native) ■■■■■],
  [*Venetian* (Native) ■■■■■],
  [*English* (B2 Level) ■■■■□],
)

== Technical Skills

- *Industry:* Windows, WinAPI, *C*, *C++*, Proprietary Frameworks, CMake, Conan, SQL, RDBMS, Advanced Debugging, Testing, Optimization, Automation
- *Web:* Linux Server, HTML, CSS, Sass, JavaScript, TypeScript, NoSQL, Cloud Platforms, Bootstrap, Tailwind CSS, Node.js, Express.js, Next.js
- *Tools:* Microsoft Visual Studio, Visual Studio Code, Git, SVN, Docker, Azure DevOps, GitHub, Jira, Trello, Microsoft 365, Google Workspace

== Selected Projects

#project(
  name: "TasteTweak",
  url: "tastetweak.com",
  dates: "",
)
- A B2B digital ecosystem of two products (a generative-AI web application and an iOS/Android app) designed to simplify and fully manage restaurant operations

#project(
  name: "BoostNatura",
  url: "boostnatura.com",
  dates: "",
)
- A cross-platform e-commerce plugin that turns every purchase from any online store into a meaningful contribution against climate change

== Extracurricular Activities

#extracurriculars(
  activity: "Open Source and Self-Directed Learning",
  dates: "",
)
- Personal interests in Cybersecurity, Data Scraping and Personal Finance pursued through self-study, dedicated open-source projects and hackathon participation

#extracurriculars(
  activity: "Esports Event Organization",
  dates: "",
)
- Personally organized and managed esports-related events over the years, including LAN parties and online tournament platforms, with sponsors and national-level relevance
