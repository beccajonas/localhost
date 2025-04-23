await getExternalImagesPaginated.trigger()
const {image = null, variant = null} = url.searchParams
if (!!image && !!variant) {
  getExternalImageDetails.trigger()
  externalImageDrawer.setHidden(false)
}