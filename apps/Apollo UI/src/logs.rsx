<Screen
  id="logs"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  title="Logs"
  urlSlug="logs"
>
  <RESTQuery
    id="getLogs"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/audit?limit={{ logList.pagination.pageSize }}&{{ !!getLogsCursorDirectory.value.get(logList.pagination.currentPage) ? 'cursor' : null }}={{ !!getLogsCursorDirectory.value.has(logList.pagination.currentPage) ? getLogsCursorDirectory.value.get(logList.pagination.currentPage) : '' }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "const currentPage = logList.pagination.currentPage\nconst currentDirectory = getLogsCursorDirectory.value\nconst cursor = getLogs.data?.cursor\nif (!currentDirectory.has(currentPage+1) && cursor) {\n  currentDirectory.set(currentPage+1, cursor)\n  getLogsCursorDirectory.setValue(currentDirectory)\n}",
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="getLogsByAgent"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/audit/{{ agentName.value }}?limit={{ logList.pagination.pageSize }}&{{ !!getLogsCursorDirectory.value.get(logList.pagination.currentPage) ? 'cursor' : null }}={{ !!getLogsCursorDirectory.value.has(logList.pagination.currentPage) ? getLogsCursorDirectory.value.get(logList.pagination.currentPage) : '' }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "const currentPage = logList.pagination.currentPage\nconst currentDirectory = getLogsCursorDirectory.value\nconst cursor = getLogsByAgent.data?.cursor\nif (!currentDirectory.has(currentPage+1) && cursor) {\n  currentDirectory.set(currentPage+1, cursor)\n  getLogsCursorDirectory.setValue(currentDirectory)\n}",
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="getLogDetails"
    enableTransformer={true}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/audit/{{ `${logList.selectedRow?.resource?.toLowerCase().replace(' ', '-')}/${logList.selectedRow?.name?.toLowerCase()}` }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="return data.data"
  />
  <State
    id="getLogsCursorDirectory"
    value="{{ new Map().set(0, undefined) }}"
  />
  <JavascriptQuery
    id="getLogsToShow"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getLogsToShow.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="triggerGetLogs"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/triggerGetLogs.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="updateSearchParams"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/updateSearchParams.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="getLogsByResourceName"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/audit/{{ selectResource.value }}/{{ resourceName.value }}?limit={{ logList.pagination.pageSize }}&{{ !!getLogsCursorDirectory.value.get(logList.pagination.currentPage) ? 'cursor' : null }}={{ !!getLogsCursorDirectory.value.has(logList.pagination.currentPage) ? getLogsCursorDirectory.value.get(logList.pagination.currentPage) : '' }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "const currentPage = logList.pagination.currentPage\nconst currentDirectory = getLogsCursorDirectory.value\nconst cursor = getLogsByResourceName.data?.cursor\nif (!currentDirectory.has(currentPage+1) && cursor) {\n  currentDirectory.set(currentPage+1, cursor)\n  getLogsCursorDirectory.setValue(currentDirectory)\n}",
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <Frame
    id="$main6"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text
      id="text7"
      value="## {{ retoolContext.pages.find(page => page.isCurrentPage).title }}"
      verticalAlign="center"
    />
    <Include src="./filtersContainer.rsx" />
    <Table
      id="logList"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ getLogsToShow.data }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No logs found"
      enableSaveActions={true}
      groupByColumns={{}}
      hasNextPage="{{ getLogsCursorDirectory.value.has(logList.pagination.currentPage + 1) }}"
      heightType="auto"
      hidden="false"
      nextAfterCursor="{{ getLogsCursorDirectory.value.get(logList.pagination.currentPage + 1) }}"
      overflowType="pagination"
      rowHeight="medium"
      serverPaginated={true}
      serverPaginationType="forwardCursorBased"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      templatePageSize="10"
      toolbarPosition="bottom"
    >
      <Column
        id="efbc8"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="message"
        label="Message"
        placeholder="Enter value"
        position="center"
        size={291}
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="cbbaa"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="agent"
        label="Agent"
        placeholder="Select option"
        position="center"
        size={100}
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="6b8f4"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="resource"
        label="Resource"
        placeholder="Select option"
        position="center"
        size={147}
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="71021"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="name"
        label="Name"
        placeholder="Enter value"
        position="center"
        size={232}
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="1fd5f"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="time"
        label="Time"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Event
        event="changePage"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                object: {
                  onSuccess: null,
                  onFailure: null,
                  additionalScope: null,
                },
              },
            },
          ],
        }}
        pluginId="triggerGetLogs"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </Frame>
</Screen>
