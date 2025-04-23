let hasChanges = false

// Check if parameter values has changed
listView6.instanceValues?.forEach((item, index) => {
  const newValue = item.parameterInput
  let current = getParameters3.data?.data[index]
  if (current.name !== item.primaryKey) {
    current = getParameters3.data.data.find(i => i.name === item.primaryKey)
  }
  if (current.value !== newValue) {
    hasChanges = true
  }
})

// Check if dependencies versions has changed
listView5.instanceValues?.forEach((item, index) => {
  const itemKey = item.primaryKey.replace('/', '-')

  const newValue = item.textInput56
  let current = getImageDependencies3.data?.data[index]
  if (current.key !== itemKey) {
    current = getImageDependencies3.data.data.find(i => i.key === item.primaryKey.replace('/', '-'))
  }
  
  if (current.tag !== newValue) {
    hasChanges = true
  }
})

if (hasChanges) {
  await modifyPlan.trigger()
} else {
  await getCreatedPlanDetails.trigger()
  steppedContainer5.showNextView()
}
