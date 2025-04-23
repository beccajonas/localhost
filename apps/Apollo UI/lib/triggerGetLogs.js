const filter = logsFilters.value


switch (filter) {
  case 'agent':
    const isAgentValid = !!agentName.value
    if (isAgentValid) {
      console.log('should show agents')
      await getLogsByAgent.trigger() 
      break;
    }
  case 'resource':
    const isResourceValid = !!selectResource.value && !!resourceName.value
    if (isResourceValid) {   
      console.log('should show resource')
      await getLogsByResourceName.trigger()
      break;
    }
  default:
    console.log('should show all')
    await getLogs.trigger()
    break;
}

await getLogsToShow.trigger()