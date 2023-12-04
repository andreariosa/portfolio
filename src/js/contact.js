const form = document.querySelector('form')

// Form components
const fName = document.getElementById('name')
const fEmail = document.getElementById('email')
const fMessage = document.getElementById('message')
const fSubmitSuccessMessage = document.getElementById('submitSuccessMessage')
const fSubmitErrorMessage = document.getElementById('submitErrorMessage')
const fSubmitButton = document.getElementById('submitButton')

// Errors
const eNameRequired = document.querySelector("[data-form-feedback='name:required']")
const eEmailRequired = document.querySelector("[data-form-feedback='email:required']")
const eEmailEmail = document.querySelector("[data-form-feedback='email:email']")
const eMessageRequired = document.querySelector("[data-form-feedback='message:required']")
const eActions = {show: 'show', reset: 'reset'}

onload = () => {
  resetFormSubmitComponents()
}

form.addEventListener('submit', (event) => {
  if (fName.validity.valid && fEmail.validity.valid && fMessage.validity.valid) {
    event.preventDefault()
    fSubmitButton.setAttribute('disabled', '')

    const data = {
      name: fName.textContent,
      email: fEmail.textContent,
      message: fMessage.textContent,
    }

    postData('././php/contact.php', data).then((response) => {
      if (response.ok) {
        fSubmitSuccessMessage.style.display = 'block'
        console.log(response.json())
      } else {
        fSubmitErrorMessage.style.display = 'block'
        throw new Error('Network response was not OK')
      }
    })
  }
})

form.addEventListener('input', () => {
  resetFormSubmitComponents()
  if (fName.validity.valid && fEmail.validity.valid && fMessage.validity.valid) {
    fSubmitButton.removeAttribute('disabled')
  }

  handleError(fName.id, !fName.validity.valid ? eActions.show : eActions.reset)
  handleError(fEmail.id, !fEmail.validity.valid ? eActions.show : eActions.reset)
  handleError(fMessage.id, !fMessage.validity.valid ? eActions.show : eActions.reset)
})

function resetFormSubmitComponents() {
    fSubmitSuccessMessage.style.display = 'none'
    fSubmitErrorMessage.style.display = 'none'
    fSubmitButton.setAttribute('disabled', '')
}

function handleError(id, action) {
  switch (id) {
    case fName.id:
      if (action === eActions.show) {
        eNameRequired.style.display = 'block'
      } else if (action === eActions.reset) {
        eNameRequired.style.display = 'none'
      }
      break
    case fEmail.id:
      if (action === eActions.show) {
        if (fEmail.validity.valueMissing) {
          eEmailRequired.style.display = 'block'
          eEmailEmail.style.display = 'none'
        }
        if (fEmail.validity.typeMismatch || fEmail.validity.tooShort) {
          eEmailEmail.style.display = 'block'
          eEmailRequired.style.display = 'none'
        }
      } else if (action === eActions.reset) {
        eEmailRequired.style.display = 'none'
        eEmailEmail.style.display = 'none'
      }
      break
    case fMessage.id:
      if (action === eActions.show) {
        eMessageRequired.style.display = 'block'
      } else if (action === eActions.reset) {
        eMessageRequired.style.display = 'none'
      }
      break
  }
}

async function postData(url = '', data = {}) {
  try {
    const response = await fetch(url, {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: { 'Content-Type': 'application/json' },
      redirect: 'follow',
      referrerPolicy: 'no-referrer',
      body: JSON.stringify(data),
    })
    return response
  } catch (error) {
    console.error('There has been a problem with the fetch operation:', error)
  }
}
