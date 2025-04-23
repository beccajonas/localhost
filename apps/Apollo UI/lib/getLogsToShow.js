const filter = logsFilters.value
switch (filter) {
  case 'agent':
    return getLogsByAgent.data.data
  case 'resource':
    return getLogsByResourceName.data.data
  default:
    return getLogs.data.data
}