<Screen
  id="createImagePage"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  title="createImage"
  urlSlug="create-image"
>
  <Folder id="selectRepositoryForCreateImage">
    <RESTQuery
      id="listRegistryForSelect"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/registry?limit={{ selectRepositoryTable?.pagination?.pageSize ?? '5' }}&{{ !!registryCursorDirectory.value.get(selectRepositoryTable?.pagination?.currentPage ?? 0) ? 'cursor' : null }}={{ !!registryCursorDirectory.value.has(selectRepositoryTable?.pagination?.currentPage ?? 0) ? registryCursorDirectory.value.get(selectRepositoryTable?.pagination?.currentPage ?? 0) : '' }}"
      resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
      runWhenModelUpdates={false}
      runWhenPageLoads={true}
      showSuccessToaster={false}
    >
      <Event
        event="success"
        method="run"
        params={{
          ordered: [
            {
              src: "const currentValue = registryCursorDirectory.value ?? new Map().set(0, undefined)\nif (!currentValue.get(selectRepositoryTable.pagination.currentPage+1)) {\n  currentValue.set(selectRepositoryTable.pagination.currentPage+1, listRegistryForSelect.data.cursor)\n  registryCursorDirectory.setValue(currentValue)\n}\n",
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
      id="registryCursorDirectory"
      value="{{ new Map().set(0, undefined) }}"
    />
  </Folder>
  <RESTQuery
    id="getParameters2"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/parameters/{{ createImageForm.data?.name }}/{{ createImageForm.data?.variant }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="return {...data, data: data.data.map(item => ({
  ...item, 
  key: `${item.name}-${item.value}`, 
  initialValue: item.value
}))}"
  />
  <RESTQuery
    id="createParameter2"
    _additionalScope={[]}
    body={
      '[{"key":"image","value":"{{ createImageForm.data.name }}"},{"key":"variant","value":"{{ createImageForm.data.variant }}"},{"key":"name","value":"{{ form5.data.name.toLowerCase() }}"},{"key":"value","value":"{{ form5.data.value }}"}]'
    }
    bodyType="json"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/parameters"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="POST"
  >
    <Event
      event="success"
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "success" },
                { title: "Parameter Created" },
                { description: "Parameter creation successfully " },
              ],
            },
          },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getParameters2"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="getImageDependencies2"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/dependencies/{{ createImageForm.data.name }}/{{  createImageForm.data.variant }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="return {...data, data: data.data.map(item => ({...item, key: `${item.dependencyName}-${item.dependencyVariant}`, tag: item.tag ?? ''}))}"
  />
  <State id="imagesCursorDirectory" value="{{ new Map().set(0, undefined) }}" />
  <RESTQuery
    id="getImagesPaginated2"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/images?limit={{ selectInternalTable?.pagination?.pageSize ?? '2' }}&{{ !!imagesCursorDirectory.value.get(selectInternalTable?.pagination?.currentPage ?? 0) ? 'cursor' : null }}={{ !!imagesCursorDirectory.value.has(selectInternalTable?.pagination?.currentPage ?? 0) ? imagesCursorDirectory.value.get(selectInternalTable?.pagination?.currentPage ?? 0) : '' }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    runWhenPageLoads={true}
    showSuccessToaster={false}
    transformer="return {...data, data: data.data.map(item => ({...item, key: `${item.name}-${item.variant}`}))}"
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "const currentValue = imagesCursorDirectory.value ?? new Map().set(0, undefined)\nif (!currentValue.get(selectInternalTable.pagination.currentPage+1)) {\n  currentValue.set(selectInternalTable.pagination.currentPage+1, getImagesPaginated2.data.cursor)\n  imagesCursorDirectory.setValue(currentValue)\n}\n",
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
    id="createImage"
    _additionalScope={[]}
    body={
      '[{"key":"name","value":"{{ createImageForm.data.name.toLowerCase() }}"},{"key":"repositoryName","value":"{{ createImageForm.data.repositoryName }}"},{"key":"buildUrl","value":"{{ createImageForm.data.buildUrl }}"},{"key":"deployUrl","value":"{{ createImageForm.data.deployUrl }}"},{"key":"variant","value":"{{ createImageForm.data.variant.toLowerCase() ? createImageForm.data.variant.toLowerCase() : \\"default\\" }}"}]'
    }
    bodyType="json"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/images"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="POST"
  >
    <Event
      event="success"
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "success" },
                { title: "Image Created" },
                { description: "Image creation successfully " },
              ],
            },
          },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="showNextView"
      params={{ ordered: [] }}
      pluginId="steppedContainer4"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="setUrlParameters"
      params={{
        ordered: [
          {
            hashParams: [
              {
                ordered: [
                  { key: "image" },
                  { value: "{{createImageForm.data.name.toLowerCase()}}" },
                ],
              },
              {
                ordered: [
                  { key: "variant" },
                  {
                    value:
                      '{{ createImageForm.data.variant.toLowerCase() ? createImageForm.data.variant.toLowerCase() : "default" }}',
                  },
                ],
              },
            ],
          },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      enabled="{{ !textInput49.value }}"
      event="success"
      method="setValue"
      params={{ ordered: [{ value: "default" }] }}
      pluginId="textInput49"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State
    id="externalImagesCursorDirectory"
    value="{{ new Map().set(0, undefined) }}"
  />
  <RESTQuery
    id="getExternalImagesPaginated2"
    enableTransformer={true}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/image-external?limit={{ table7?.pagination?.pageSize ?? '5' }}&{{ !!externalImagesCursorDirectory.value.get(table7?.pagination?.currentPage ?? 0) ? 'cursor' : null }}={{ !!externalImagesCursorDirectory.value.has(table7?.pagination?.currentPage ?? 0) ? externalImagesCursorDirectory.value.get(table7?.pagination?.currentPage ?? 0) : '' }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    runWhenPageLoads={true}
    showSuccessToaster={false}
    transformer="return {...data, data: data.data.map(item => ({...item, key: `${item.name}-${item.variant}`}))}"
  >
    <Event
      event="success"
      method="run"
      params={{
        ordered: [
          {
            src: "const currentValue = externalImagesCursorDirectory.value ?? new Map().set(0, undefined)\nif (!currentValue.get(table7.pagination.currentPage+1)) {\n  currentValue.set(table7.pagination.currentPage+1, getExternalImagesPaginated2.data.cursor)\n  externalImagesCursorDirectory.setValue(currentValue)\n}",
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
    id="getRepositoryDetails2"
    enableTransformer={true}
    headers={'[{"key":"","value":""}]'}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/registry/{{ selectInternalTable.selectedRow.repositoryName  }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="return data.data"
  />
  <RESTQuery
    id="addInternalDependency2"
    body={
      '[{"key":"image","value":"{{ createImageForm.data.name }}"},{"key":"variant","value":"{{ createImageForm.data.variant }}"},{"key":"dependencyName","value":"{{ addInternalDependencyForm2.data.dependencyName }}"},{"key":"dependencyVariant","value":"{{ addInternalDependencyForm2.data.dependencyVariant }}"},{"key":"tag","value":"{{ !!addInternalDependencyForm2.data.selectedTag ? addInternalDependencyForm2.data.selectedTag : addInternalDependencyForm2.data.customTag ?? undefined }}"},{"key":"type","value":"internal"}]'
    }
    bodyType="json"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/dependencies"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="POST"
  >
    <Event
      event="success"
      method="hide"
      params={{ ordered: [] }}
      pluginId="addInternalDependencyDetailsModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getImageDependencies2"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="addExternalDependency2"
    body={
      '[{"key":"image","value":"{{ createImageForm.data.name }}"},{"key":"variant","value":"{{ createImageForm.data.variant }}"},{"key":"dependencyName","value":"{{ table7.selectedRow.name }}"},{"key":"dependencyVariant","value":"{{ table7.selectedRow.variant}}"},{"key":"tag","value":"{{ addExternalDependencyForm2.data.tag }}"},{"key":"type","value":"external"}]'
    }
    bodyType="json"
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/dependencies"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="POST"
  >
    <Event
      event="success"
      method="hide"
      params={{ ordered: [] }}
      pluginId="addExternalModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getImageDependencies2"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <Include src="./addExternalModal.rsx" />
  <Include src="./addInternalDependencyDetailsModal.rsx" />
  <Include src="./modalFrame2.rsx" />
  <Frame
    id="$main10"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text id="text29" value="## Create Image" verticalAlign="center" />
    <Include src="./steppedContainer4.rsx" />
  </Frame>
</Screen>
