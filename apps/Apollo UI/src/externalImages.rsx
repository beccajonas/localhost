<Screen
  id="externalImages"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  title="DockerHub Repositories"
  urlSlug="external-images"
>
  <RESTQuery
    id="createExternalImage"
    body={
      '[{"key":"name","value":"{{ createExternalImageForm.data.name }}"},{"key":"namespace","value":"{{ createExternalImageForm.data.namespace ? createExternalImageForm.data.namespace : \\"library\\" }}"},{"key":"repository","value":"{{ createExternalImageForm.data.repository }}"},{"key":"hubUrl","value":"{{ createExternalImageForm.data.hubUrl }}"},{"key":"variant","value":"{{ createExternalImageForm.data.variant ? createExternalImageForm.data.variant : \\"default\\" }}"}]'
    }
    bodyType="json"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/image-external"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="POST"
  >
    <Event
      event="success"
      method="hide"
      params={{ ordered: [] }}
      pluginId="createExternalImageModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getExternalImagesPaginated"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="deleteExternalImage"
    body="[]"
    bodyType="json"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/image-external/{{ externalImageNameToDelete.value }}/{{ externalImageVariantToDelete.value }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="DELETE"
  >
    <Event
      event="success"
      method="hide"
      params={{ ordered: [] }}
      pluginId="deleteExternalImageAlert"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getExternalImagesPaginated"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="hide"
      params={{ ordered: [] }}
      pluginId="externalImageDrawer"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="getDependentImages"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/dependencies/by-dependency/{{ url.searchParams.image ?? externalImageTable.selectedRow.name }}/{{ url.searchParams.variant ?? externalImageTable.selectedRow.variant }}/external?limit={{ dependentImagesTable?.pagination?.pageSize ?? '5' }}&{{ !!dependentsCursorDirectory2.value.get(dependentImagesTable?.pagination?.currentPage ?? 0) ? 'cursor' : null }}={{ !!dependentsCursorDirectory2.value.has(dependentImagesTable?.pagination?.currentPage ?? 0) ? dependentsCursorDirectory2.value.get(dependentImagesTable?.pagination?.currentPage ?? 0) : '' }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="return {...data, data: data.data?.map(item => ({...item, key: `${item?.image}-${item?.variant}`}))}"
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "const currentValue = dependentsCursorDirectory2.value ?? new Map().set(0, undefined)\nif (!currentValue.get(dependentImagesTable.pagination.currentPage+1)) {\n  currentValue.set(dependentImagesTable.pagination.currentPage+1, getDependentImages.data.cursor)\n  dependentsCursorDirectory2.setValue(currentValue)\n}",
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
    id="deleteDependency"
    body={
      '[{"key":"image","value":"{{ deleteDependencyForm.data?.image }}"},{"key":"variant","value":"{{ deleteDependencyForm.data?.variant }}"},{"key":"dependencyName","value":"{{ deleteDependencyForm.data?.dependencyName }}"},{"key":"dependencyVariant","value":"{{ deleteDependencyForm.data?.dependencyVariant }}"}]'
    }
    bodyType="json"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/dependencies"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="DELETE"
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getDependentImages"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="hide"
      params={{ ordered: [] }}
      pluginId="deleteDependencyAlert"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="deleteDependencyInDeleteImageModal"
    body={
      '[{"key":"image","value":"{{ editableText5.value }}"},{"key":"variant","value":"{{ editableText6.value }}"},{"key":"dependencyName","value":"{{ externalImageNameToDelete.value }}"},{"key":"dependencyVariant","value":"{{ externalImageVariantToDelete.value }}"}]'
    }
    bodyType="json"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/dependencies"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="DELETE"
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getDependentImages"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <JavascriptQuery
    id="goToExternalImage"
    notificationDuration={4.5}
    query={include("../lib/goToExternalImage.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showSuccessToaster={false}
  />
  <RESTQuery
    id="getExternalImagesPaginated"
    enableTransformer={true}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/image-external?limit={{ externalImageTable?.pagination?.pageSize ?? '5' }}&{{ !!externalImageCursorDirectory.value.get(externalImageTable?.pagination?.currentPage ?? 0) ? 'cursor' : null }}={{ !!externalImageCursorDirectory.value.has(externalImageTable?.pagination?.currentPage ?? 0) ? externalImageCursorDirectory.value.get(externalImageTable?.pagination?.currentPage ?? 0) : '' }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="return {...data, data: data.data.map(item => ({...item, key: `${item.name}-${item.variant}`}))}"
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "const currentValue = externalImageCursorDirectory.value ?? new Map().set(0, undefined)\nif (!currentValue.get(externalImageTable.pagination.currentPage+1)) {\n  currentValue.set(externalImageTable.pagination.currentPage+1, getExternalImagesPaginated.data.cursor)\n  externalImageCursorDirectory.setValue(currentValue)\n}",
          },
        ],
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="externalImageCursorDirectory"
    value="{{ new Map().set(0, undefined) }}"
  />
  <RESTQuery
    id="getExternalImageDetails"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/image-external/{{ url.searchParams.image ?? externalImageTable.selectedRow.name }}/{{ url.searchParams.variant ?? externalImageTable.selectedRow.variant }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="setPage"
      params={{ ordered: [{ page: "0" }] }}
      pluginId="dependentImagesTable"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "{{ new Map().set(0, undefined) }}" }] }}
      pluginId="dependentsCursorDirectory2"
      type="state"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="dependentsCursorDirectory2"
    value="{{ new Map().set(0, undefined) }}"
  />
  <Include src="./createExternalImageModal.rsx" />
  <Include src="./deleteDependencyAlert.rsx" />
  <Include src="./deleteExternalImageAlert.rsx" />
  <Include src="./externalImageDrawer.rsx" />
  <Frame
    id="$main4"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text
      id="text4"
      value="## {{ retoolContext.pages.find(page => page.isCurrentPage).title }}"
      verticalAlign="center"
    />
    <TextInput
      id="searchExternalImageInput"
      iconBefore="bold/interface-search"
      label=""
      labelPosition="top"
      placeholder="Search image"
    />
    <Button
      id="addExternalImageButton"
      hidden="{{ !actAsAdmin.value }}"
      text="Add Repository"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="createExternalImageModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Table
      id="externalImageTable"
      actionsOverflowPosition={2}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ getExternalImagesPaginated.data?.data }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      groupByColumns={{}}
      hasNextPage="{{ !!externalImageCursorDirectory.value.get(externalImageTable.pagination.currentPage+1) }}"
      heightType="auto"
      nextAfterCursor="{{ externalImageCursorDirectory.value.get(externalImageTable.pagination.currentPage+1) }}"
      overflowType="pagination"
      primaryKeyColumnId="857fd"
      rowHeight="medium"
      searchTerm="{{ searchExternalImageInput.value }}"
      serverPaginated={true}
      serverPaginationType="forwardCursorBased"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      templatePageSize="10"
      toolbarPosition="bottom"
    >
      <Column
        id="d634a"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="name"
        label="Name"
        placeholder="Enter value"
        position="center"
        size={49.21875}
      />
      <Column
        id="afca5"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="variant"
        label="Variant"
        placeholder="Enter value"
        position="center"
        size={75.875}
      />
      <Column
        id="4c5c5"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="namespace"
        label="Namespace"
        placeholder="Select option"
        position="center"
        size={83.265625}
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="bf7d6"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="repository"
        label="Repository"
        placeholder="Select option"
        position="center"
        size={76.984375}
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="8e776"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover" }}
        groupAggregationMode="none"
        key="hubUrl"
        label="Hub URL"
        position="center"
        size={191.296875}
      >
        <Event
          event="clickCell"
          method="openUrl"
          params={{ ordered: [{ url: "{{ item }}" }] }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="419c9"
        alignment="left"
        format="date"
        groupAggregationMode="none"
        key="createdAt"
        label="Created at"
        position="center"
        size={94.59375}
      />
      <Column
        id="586f9"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="updatedAt"
        label="Updated at"
        placeholder="Enter value"
        position="center"
        size={154.53125}
      />
      <Column
        id="857fd"
        alignment="left"
        editable={false}
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="key"
        label="Key"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Action id="7cdb5" icon="bold/interface-edit-view" label="Details">
        <Event
          event="clickAction"
          method="show"
          params={{ ordered: [] }}
          pluginId="externalImageDrawer"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="getExternalImageDetails"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Action>
      <Action
        id="abdd8"
        hidden="{{ !actAsAdmin.value }}"
        icon="bold/interface-delete-bin-2"
        label="Delete"
      >
        <Event
          event="clickAction"
          method="show"
          params={{ ordered: [] }}
          pluginId="deleteExternalImageAlert"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Action>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="refresh"
          pluginId="externalImageTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <Event
        event="changePage"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getExternalImagesPaginated"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="selectRow"
        method="run"
        params={{
          ordered: [
            {
              src: 'utils.openPage(\'external-images\', {\n      "passDataWith": \'urlParams\', \n      "queryParams": {\n        "image": currentRow.name,\n        "variant": currentRow.variant\n      }\n    });',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </Frame>
</Screen>
