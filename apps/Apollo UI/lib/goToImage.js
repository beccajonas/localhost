await getImagesPaginated.trigger()
const {image = null, variant = null} = url.searchParams
if (!!image && !!variant) {
  getImageDetails.trigger()
  imageDetailsDrawer.setHidden(false)
}