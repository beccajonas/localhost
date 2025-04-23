<Screen
  id="createPlanPage"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  title="Create Plan"
  urlSlug="create-plan"
>
  <RESTQuery
    id="createPlan2"
    _additionalScope={[]}
    body={
      '[{"key":"tag","value":"{{ tagInput.value }}"},{"key":"latest","value":"{{ buildType.value }}\\n"}]'
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
      method="showNextView"
      params={{ ordered: [] }}
      pluginId="steppedContainer5"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="getImageDependencies3"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/dependencies/{{ url.hashParams.image   }}/{{  url.hashParams.variant }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    runWhenPageLoads={true}
    showSuccessToaster={false}
    transformer="return {...data, data: data.data.map(item => ({...item, key: `${item.dependencyName}-${item.dependencyVariant}`, tag: item.tag ?? ''}))}"
  />
  <RESTQuery
    id="getParameters3"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/parameters/{{ url.hashParams.image }}/{{ url.hashParams.variant }}?"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    runWhenPageLoads={true}
    showSuccessToaster={false}
    transformer="return {...data, data: data.data.map(item => ({
  ...item, 
  key: `${item.name}-${item.value}`, 
  initialValue: item.value
}))}"
  />
  <RESTQuery
    id="getRepositoryDetails3"
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
    id="discardBuildPlan2"
    bodyType="json"
    isMultiplayerEdited={false}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/build/{{url.hashParams?.image}}/{{url.hashParams?.variant}}/{{ createPlan2.data?.tag }}/{{createPlan2.data?.revision}}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    runWhenPageLoadsDelay="50"
    type="DELETE"
  >
    <Event
      event="success"
      method="openPage"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { passDataWith: "urlParams" },
                { queryParams: [] },
                { persistUrlParams: true },
              ],
            },
          },
          { pageName: "imageDetails" },
        ],
      }}
      pluginId=""
      type="util"
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
      event="failure"
      method="openPage"
      params={{
        ordered: [
          { options: { ordered: [{ passDataWith: "urlParams" }] } },
          { pageName: "images" },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="applyBuildPlan2"
    bodyType="json"
    isMultiplayerEdited={false}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/build/{{url.hashParams?.image}}/{{url.hashParams?.variant}}/{{createPlan2.data?.tag}}/{{createPlan2.data?.revision}}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    runWhenPageLoadsDelay="50"
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
                { notificationType: "info" },
                { title: "Plan applied" },
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
          { pageName: "imageDetails" },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="modifyPlan"
    _additionalScope={[]}
    body={
      '[{"key":"{{ listView6.instanceValues.length > 0 ? \'parameters\' : undefined }}","value":"{{ listView6.instanceValues?.map(item => {\\n  return {\\n    name: item.primaryKey,\\n    value: item.parameterInput\\n}\\n}) }}"},{"key":"{{ listView5.instanceValues.length > 0 ? \'dependencies\' : undefined }}","value":"{{ listView5.instanceValues?.map(item => {\\n  const [dependencyName, dependencyVariant] = item.primaryKey.split(\'/\')\\n  return {\\n    dependencyName,\\n    dependencyVariant,\\n    dependencyTag: item.textInput56\\n}\\n}) }}"}]'
    }
    bodyType="json"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/build/{{ url.hashParams.image }}/{{ url.hashParams.variant }}/{{ createPlan2.data?.tag }}/{{ createPlan2.data?.revision }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="PUT"
  >
    <Event
      event="success"
      method="showNextView"
      params={{ ordered: [] }}
      pluginId="steppedContainer5"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getCreatedPlanDetails"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="getCreatedPlanDetails"
    _additionalScope={[]}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/artifacts/{{ url.hashParams.image }}/{{ url.hashParams.variant }}/{{ createPlan2.data?.tag }}/{{ createPlan2.data?.revision }}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
  >
    <Event
      event="success"
      method="showNextView"
      params={{ ordered: [] }}
      pluginId="steppedContainer5"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <JavascriptQuery
    id="modifyIfNeeded"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/modifyIfNeeded.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Frame
    id="$main11"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text
      id="text38"
      value="## {{ retoolContext.pages.find(page => page.isCurrentPage).title }}"
      verticalAlign="center"
    />
    <Include src="./steppedContainer5.rsx" />
  </Frame>
</Screen>
