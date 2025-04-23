const token = url.searchParams?.token

if (retoolContext.inEditorMode) {
  console.log(token)
}

if (token) {
  await localStorage.setValue('token', token)
  isAuthenticatedUser.setValue(true)
}

// redirects only outside editor to avoid inaccessible pages
if (!retoolContext.inEditorMode) {
  if (token) {
    utils.openPage('images')
  } else {
    utils.openPage('login')
  }
}