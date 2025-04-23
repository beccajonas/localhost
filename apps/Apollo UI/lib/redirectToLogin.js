const token = localStorage.values?.token

if (token) {
  await isAuthenticatedUser.setValue(true)
}

if (!retoolContext.inEditorMode) {
  if (isAuthenticatedUser.value === false) {
    utils.openPage('login')
  } else if (retoolContext.currentPage === 'login') {
    utils.openPage('images')
  }
}
