## Curriculum Vitae

Typst resume based on [basic-resume](https://typst.app/universe/package/basic-resume). Italian and English sources live in this folder.

### Prerequisites

Install the [Typst CLI](https://github.com/typst/typst) (e.g. `winget install Typst.Typst`).

### Compile

From the repository root:

```bash
typst compile cv/cv-it.typ Andrea_Riosa_CV_IT.pdf
typst compile cv/cv-en.typ Andrea_Riosa_CV_EN.pdf
```

Place the generated PDFs next to the built site (`dist/`) so the portfolio download links resolve:

- `Andrea_Riosa_CV_IT.pdf`
- `Andrea_Riosa_CV_EN.pdf`
