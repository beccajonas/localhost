<Screen
  id="imageDetails"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  title={null}
  urlSlug="image-details"
>
  <Folder id="dependencies">
    <RESTQuery
      id="getImageDependencies"
      enableTransformer={true}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/dependencies/{{ url.hashParams.image   }}/{{  url.hashParams.variant }}?limit={{ dependenciesListTable?.pagination?.pageSize ?? '5' }}&{{ !!dependenciesCursorDirectory.value.get(dependenciesListTable?.pagination?.currentPage ?? 0) ? 'cursor' : null }}={{ !!dependenciesCursorDirectory.value.has(dependenciesListTable?.pagination?.currentPage ?? 0) ? dependenciesCursorDirectory.value.get(dependenciesListTable?.pagination?.currentPage ?? 0) : '' }}"
      resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      transformer="return {...data, data: data.data.map(item => ({...item, key: `${item.dependencyName}-${item.dependencyVariant}`, tag: item.tag ?? ''}))}"
    >
      <Event
        event="success"
        method="run"
        params={{
          ordered: [
            {
              src: "const currentValue = dependenciesCursorDirectory.value ?? new Map().set(0, undefined)\nif (!currentValue.get(dependenciesListTable.pagination.currentPage+1)) {\n  currentValue.set(dependenciesListTable.pagination.currentPage+1, getImageDependencies.data.cursor)\n  dependenciesCursorDirectory.setValue(currentValue)\n}",
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
      id="dependenciesCursorDirectory"
      value="{{ new Map().set(0, undefined) }}"
    />
    <RESTQuery
      id="deleteDependencyInternalImage"
      body={
        '[{"key":"image","value":"{{ deleteDependecyFormInternal.data.imageName }}"},{"key":"variant","value":"{{ deleteDependecyFormInternal.data.imageVariant }}"},{"key":"dependencyName","value":"{{ deleteDependecyFormInternal.data.dependencyName }}"},{"key":"dependencyVariant","value":"{{ deleteDependecyFormInternal.data.dependencyVariant }}"}]'
      }
      bodyType="json"
      confirmationMessage="## Are you sure you want to delete this dependency?"
      notificationDuration={4.5}
      query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/dependencies"
      requireConfirmation={true}
      resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      type="DELETE"
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getImageDependencies"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="hide"
        params={{ ordered: [] }}
        pluginId="deleteDependencyFromInternalAlert"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="updateDependency"
      body={
        '[{"key":"image","value":"{{ url.hashParams.image }}"},{"key":"variant","value":"{{ url.hashParams.variant }}"},{"key":"dependencyName","value":"{{ dependenciesListTable.selectedRow.dependencyName }}"},{"key":"dependencyVariant","value":"{{ dependenciesListTable.selectedRow.dependencyVariant }}"},{"key":"tag","value":"{{ dependenciesListTable.selectedRow.type === \'internal\' ? select1.value : textInput43.value }}"}]'
      }
      bodyType="json"
      notificationDuration={4.5}
      query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/dependencies"
      resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      type="PUT"
    >
      <Event
        event="success"
        method="hide"
        params={{ ordered: [] }}
        pluginId="updateDependencyTagModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getImageDependencies"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
  </Folder>
  <Folder id="artifacts">
    <RESTQuery
      id="createPlan"
      _additionalScope={[]}
      body={
        '[{"key":"tag","value":"{{ createPlanForm.data?.tag?.trim().toLowerCase() }}"},{"key":"latest","value":"{{ createPlanForm.data?.latest ?? false }}"}]'
      }
      bodyType="json"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/build/{{ url.hashParams.image }}/{{ url.hashParams.variant }}"
      resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      type="POST"
    >
      <Event
        event="success"
        method="hide"
        params={{ ordered: [] }}
        pluginId="createPlanForImageModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="clear"
        params={{ ordered: [] }}
        pluginId="createPlanForm"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getArtifactList"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="openPage"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { passDataWith: "urlParams" },
                  {
                    hashParams: [
                      {
                        ordered: [
                          { key: "image" },
                          { value: "{{ createPlan.data?.image }}" },
                        ],
                      },
                      {
                        ordered: [
                          { key: "variant" },
                          { value: "{{ createPlan.data?.variant }}" },
                        ],
                      },
                      {
                        ordered: [
                          { key: "tag" },
                          { value: "{{ createPlan.data?.tag }}" },
                        ],
                      },
                      {
                        ordered: [
                          { key: "revision" },
                          { value: "{{ createPlan.data?.revision }}" },
                        ],
                      },
                    ],
                  },
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
    </RESTQuery>
    <RESTQuery
      id="getArtifactList"
      enableTransformer={true}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/artifacts/{{ url.hashParams.image }}/{{ url.hashParams.variant }}"
      resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      transformer="return {...data, data: data.data.map(item => ({...item, key: `${item.image}/${item.variant}:${item.tag}-${item.revision}`}))}"
    />
    <RESTQuery
      id="discardBuildPlan"
      bodyType="json"
      isMultiplayerEdited={false}
      query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/build/{{url.hashParams?.image}}/{{url.hashParams?.variant}}/{{table6.selectedRow?.tag}}/{{table6.selectedRow?.revision}}"
      resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
      runWhenModelUpdates={false}
      runWhenPageLoadsDelay="50"
      type="DELETE"
    >
      <Event
        event="success"
        method="showNotification"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { notificationType: "info" },
                  { title: "Plan discarded" },
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
        pluginId="getArtifactList"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State
      id="artifactListCursorDirectory"
      value="{{ new Map().set(0, undefined) }}"
    />
  </Folder>
  <Folder id="parameters">
    <State
      id="parametersCursorDirectory"
      value="{{ new Map().set(0, undefined) }}"
    />
    <RESTQuery
      id="deleteParameter"
      _additionalScope={[]}
      body="[]"
      bodyType="json"
      confirmationMessage="## Are you sure you want to delete parameter `{{ parametersListTable.selectedRow?.name }}`?"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/parameters/{{ url.hashParams.image }}/{{ url.hashParams.variant }}/{{ parametersListTable.selectedRow?.name }}"
      requireConfirmation={true}
      resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      type="DELETE"
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
                  { title: "Parameter Deleted" },
                  { description: "Parameter deleted successfully " },
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
        pluginId="getParameters"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="updateParameter"
      _additionalScope={[]}
      body={'[{"key":"value","value":"{{ updateParameterForm.data.value }}"}]'}
      bodyType="json"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/parameters/{{ url.hashParams.image }}/{{ url.hashParams.variant }}/{{ updateParameterForm.data.name }}"
      resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      type="PATCH"
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
                  { title: "Parameter Updated" },
                  { description: "Parameter updated successfully " },
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
        method="hide"
        params={{ ordered: [] }}
        pluginId="updateParameterModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getParameters"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="getParameters"
      enableTransformer={true}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/parameters/{{ url.hashParams.image }}/{{ url.hashParams.variant }}?limit={{ parametersListTable?.pagination?.pageSize ?? '5' }}&{{ !!parametersCursorDirectory.value.get(parametersListTable?.pagination?.currentPage ?? 0) ? 'cursor' : null }}={{ !!parametersCursorDirectory.value.has(parametersListTable?.pagination?.currentPage ?? 0) ? parametersCursorDirectory.value.get(parametersListTable?.pagination?.currentPage ?? 0) : '' }}"
      resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      transformer="return {...data, data: data.data.map(item => ({
  ...item, 
  key: `${item.name}-${item.value}`, 
  initialValue: item.value
}))}"
    >
      <Event
        event="success"
        method="run"
        params={{
          ordered: [
            {
              src: "const currentValue = parametersCursorDirectory.value ?? new Map().set(0, undefined)\nif (!currentValue.get(parametersListTable.pagination.currentPage+1)) {\n  currentValue.set(parametersListTable.pagination.currentPage+1, getParameters.data.cursor)\n  parametersCursorDirectory.setValue(currentValue)\n}",
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
      id="createParameter"
      _additionalScope={[]}
      body={
        '[{"key":"image","value":"{{ url.hashParams.image }}"},{"key":"variant","value":"{{ url.hashParams.variant }}"},{"key":"name","value":"{{ createParameterForm.data.name.toLowerCase() }}"},{"key":"value","value":"{{ createParameterForm.data.value }}"}]'
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
        method="hide"
        params={{ ordered: [] }}
        pluginId="createParameterModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="clear"
        params={{ ordered: [] }}
        pluginId="createParameterForm"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getParameters"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
  </Folder>
  <Folder id="dependents">
    <State
      id="dependentsCursorDirectory"
      value="{{ new Map().set(0, undefined) }}"
    />
    <RESTQuery
      id="getDependentImagesForInternalImages"
      enableTransformer={true}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/dependencies/by-dependency/{{ url.hashParams.image  }}/{{  url.hashParams.variant }}/internal?limit={{ dependentsListTable?.pagination?.pageSize ?? '10' }}&{{ !!dependentsCursorDirectory.value.get(dependentsListTable?.pagination?.currentPage ?? 0) ? 'cursor' : null }}={{ !!dependentsCursorDirectory.value.has(dependentsListTable?.pagination?.currentPage ?? 0) ? dependentsCursorDirectory.value.get(dependentsListTable?.pagination?.currentPage ?? 0) : '' }}"
      resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      transformer="return {...data, data: data.data.map(item => ({...item, key: `${item.image}-${item.variant}`}))}"
    >
      <Event
        event="success"
        method="run"
        params={{
          ordered: [
            {
              src: "const currentValue = dependentsCursorDirectory.value ?? new Map().set(0, undefined)\nif (!currentValue.get(dependentsListTable.pagination.currentPage+1)) {\n  currentValue.set(dependentsListTable.pagination.currentPage+1, getDependentImagesForInternalImages.data.cursor)\n  dependentsCursorDirectory.setValue(currentValue)\n}\n",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
  </Folder>
  <Folder id="selectExternalImageDependency">
    <RESTQuery
      id="getExternalImagesForSelect"
      enableTransformer={true}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/image-external?limit={{ selectExternalDependencyImageTable?.pagination?.pageSize ?? '10' }}&{{ !!externalImageDependencyCursorDirectory.value.get(selectExternalDependencyImageTable?.pagination?.currentPage ?? 0) ? 'cursor' : null }}={{ !!externalImageDependencyCursorDirectory.value.has(selectExternalDependencyImageTable?.pagination?.currentPage ?? 0) ? externalImageDependencyCursorDirectory.value.get(selectExternalDependencyImageTable?.pagination?.currentPage ?? 0) : '' }}"
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
              src: "const currentValue = externalImageDependencyCursorDirectory.value ?? new Map().set(0, undefined)\nif (!currentValue.get(selectExternalDependencyImageTable.pagination.currentPage+1)) {\n  currentValue.set(selectExternalDependencyImageTable.pagination.currentPage+1, getExternalImagesForSelect.data?.cursor)\n  externalImageDependencyCursorDirectory.setValue(currentValue)\n}",
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
      id="externalImageDependencyCursorDirectory"
      value="{{ new Map().set(0, undefined) }}"
    />
  </Folder>
  <Folder id="selectImageForDependency">
    <RESTQuery
      id="getImagesPaginatedForSelectImage"
      enableTransformer={true}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/images?limit={{ selectImageTable?.pagination?.pageSize ?? '5' }}&{{ !!selectImageCursorDirectory.value.get(selectImageTable?.pagination?.currentPage ?? 0) ? 'cursor' : null }}={{ !!selectImageCursorDirectory.value.has(selectImageTable?.pagination?.currentPage ?? 0) ? selectImageCursorDirectory.value.get(selectImageTable?.pagination?.currentPage ?? 0) : '' }}"
      resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
      resourceTypeOverride=""
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
              src: "const currentValue = selectImageCursorDirectory.value ?? new Map().set(0, undefined)\nif (!currentValue.get(selectImageTable.pagination.currentPage+1)) {\n  currentValue.set(selectImageTable.pagination.currentPage+1, getImagesPaginatedForSelectImage.data.cursor)\n  selectImageCursorDirectory.setValue(currentValue)\n}\n",
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
      id="selectImageCursorDirectory"
      value="{{ new Map().set(0, undefined) }}"
    />
  </Folder>
  <State
    id="registryCursorDirectory2"
    value="{{ new Map().set(0, undefined) }}"
  />
  <RESTQuery
    id="listRegistryForSelect2"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/registry?limit={{ editRegistryTable?.pagination?.pageSize ?? '5' }}&{{ !!registryCursorDirectory2.value.get(editRegistryTable?.pagination?.currentPage ?? 0) ? 'cursor' : null }}={{ !!registryCursorDirectory2.value.has(editRegistryTable?.pagination?.currentPage ?? 0) ? registryCursorDirectory2.value.get(editRegistryTable?.pagination?.currentPage ?? 0) : '' }}"
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
            src: "const currentValue = registryCursorDirectory2.value ?? new Map().set(0, undefined)\nif (!currentValue.get(editRegistryTable.pagination.currentPage+1)) {\n  currentValue.set(editRegistryTable.pagination.currentPage+1, listRegistryForSelect2.data.cursor)\n  registryCursorDirectory2.setValue(currentValue)\n}\n",
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
    id="updateImage"
    body={
      '[{"key":"repositoryName","value":"{{ editableText35.value }}"},{"key":"buildUrl","value":"{{ textInput45.value }}"},{"key":"deployUrl","value":"{{ textInput44.value }}"}]'
    }
    bodyType="json"
    cookies={'[{"key":"","value":""}]'}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/images/{{ url.hashParams.image }}/{{ url.hashParams.variant }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="PATCH"
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
                { title: "Image Updated" },
                { description: "Image Updated" },
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
      pluginId="getImageDetails"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="deleteImage2"
    bodyType="json"
    confirmationMessage="## Are you sure you want to delete {{ url.hashParams.image }}/{{ url.hashParams.variant }} image?"
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/images/{{ url.hashParams.image }}/{{ url.hashParams.variant }}"
    requireConfirmation={true}
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="DELETE"
  >
    <Event
      event="success"
      method="hide"
      params={{ ordered: [] }}
      pluginId="deleteImageAlert"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="hide"
      params={{ ordered: [] }}
      pluginId="imageDetailsDrawer"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "info" },
                { title: "Image Deleted" },
                { description: "Image deleted" },
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
      pluginId="getImagesPaginated"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      enabled="{{ deleteImage.data?.statusCode === 422 }}"
      event="failure"
      method="showNotification"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { notificationType: "warning" },
                { title: "ECR Repository for the Image Exists" },
                {
                  description:
                    "ECR Repository for the Image Exists. Remove it first.",
                },
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
  </RESTQuery>
  <RESTQuery
    id="addInternalDependency"
    body={
      '[{"key":"image","value":"{{ url.hashParams.image }}"},{"key":"variant","value":"{{ url.hashParams.variant }}"},{"key":"dependencyName","value":"{{ addInternalDependencyForm.data.dependencyName }}"},{"key":"dependencyVariant","value":"{{ addInternalDependencyForm.data.dependencyVariant }}"},{"key":"tag","value":"{{ addInternalDependencyForm.data.selectedTag ?? addInternalDependencyForm.data.customTag ?? undefined }}"},{"key":"type","value":"internal"}]'
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
      pluginId="addInternalDependencyModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getImageDependencies"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="setCurrentViewIndex"
      params={{ ordered: [{ viewIndex: "0" }] }}
      pluginId="steppedContainer1"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="clearSelection"
      params={{ ordered: [] }}
      pluginId="selectImageTable"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="addExternalDependency"
    body={
      '[{"key":"image","value":"{{ url.hashParams.image }}"},{"key":"variant","value":"{{ url.hashParams.variant }}"},{"key":"dependencyName","value":"{{ addExternalDependencyForm.data.dependencyName }}"},{"key":"dependencyVariant","value":"{{ addExternalDependencyForm.data.dependencyVariant }}"},{"key":"tag","value":"{{ addExternalDependencyForm.data.tag }}"},{"key":"type","value":"external"}]'
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
      pluginId="addExternalDependencyModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getImageDependencies"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="setCurrentViewIndex"
      params={{ ordered: [{ viewIndex: "0" }] }}
      pluginId="steppedContainer3"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="clear"
      params={{ ordered: [] }}
      pluginId="addExternalDependencyForm"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="getRepositoryDetails"
    enableTransformer={true}
    headers={'[{"key":"","value":""}]'}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/registry/{{ selectImageTable.selectedRow.repositoryName  }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="return data.data"
  />
  <RESTQuery
    id="getImageDetails"
    headers={'[{"key":"","value":""}]'}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/images/{{ url.hashParams?.image }}/{{ url.hashParams?.variant   }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    runWhenPageLoads={true}
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getImageDependencies"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getDependentImagesForInternalImages"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getParameters"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getArtifactList"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <JavascriptQuery
    id="clearDetailsDirectories"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/clearDetailsDirectories.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <RESTQuery
    id="getRepositoryDetails4"
    enableTransformer={true}
    headers={'[{"key":"","value":""}]'}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/registry/{{ getImageDetails2.data?.repositoryName  }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="return data.data"
  />
  <RESTQuery
    id="getImageDetails2"
    headers={'[{"key":"","value":""}]'}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/images/{{ dependenciesListTable.selectedRow?.dependencyName }}/{{ dependenciesListTable.selectedRow?.dependencyVariant }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getRepositoryDetails4"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <Include src="./addExternalDependencyModal.rsx" />
  <Include src="./addInternalDependencyModal.rsx" />
  <Include src="./changeSelectedRepository.rsx" />
  <Include src="./createParameterModal.rsx" />
  <Include src="./createPlanForImageModal.rsx" />
  <Include src="./deleteDependencyFromInternalAlert.rsx" />
  <Include src="./deleteParameterAlert.rsx" />
  <Include src="./updateDependencyTagModal.rsx" />
  <Include src="./updateParameterModal.rsx" />
  <Frame
    id="$main9"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text
      id="text27"
      value="## {{ url.hashParams.image }}/{{ url.hashParams.variant }}"
      verticalAlign="center"
    />
    <ButtonGroup2 id="buttonGroup1" alignment="right" overflowPosition={3}>
      <ButtonGroup2-Button id="93076" styleVariant="danger" text="Delete">
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="deleteImage2"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
      <ButtonGroup2-Button
        id="8366f"
        styleVariant="outline"
        text="{{ tabbedContainer3.currentViewKey !== 'artifacts' ? 'Artifacts' : 'Details'}}"
      >
        <Event
          event="click"
          method="setCurrentView"
          params={{
            ordered: [
              {
                viewKey:
                  "{{ tabbedContainer3.currentViewKey !== 'artifacts' ? 'artifacts' : 'details'}}",
              },
            ],
          }}
          pluginId="tabbedContainer3"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
      <ButtonGroup2-Button id="cd895" styleVariant="solid" text="Build">
        <Event
          event="click"
          method="openPage"
          params={{
            ordered: [
              {
                options: {
                  ordered: [
                    { passDataWith: "urlParams" },
                    { persistUrlParams: true },
                  ],
                },
              },
              { pageName: "createPlanPage" },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
    </ButtonGroup2>
    <Include src="./tabbedContainer3.rsx" />
  </Frame>
</Screen>
