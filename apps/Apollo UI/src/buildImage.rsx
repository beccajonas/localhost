<Screen
  id="buildImage"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  title="Build plan"
  urlSlug="plan"
>
  <RESTQuery
    id="updateParameterInBuildPlan"
    _additionalScope={[]}
    body={'[{"key":"value","value":"{{ parameterToUpdate.value?.value }}"}]'}
    bodyType="json"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/parameters/{{ url.hashParams?.image }}/{{ url.hashParams?.variant }}/{{ parameterToUpdate.value?.name }}"
    queryDisabled="{{ !parameterToUpdate.value }}"
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
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getBuildPlanDetails"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <RESTQuery
    id="getBuildPlanDetails"
    isMultiplayerEdited={false}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/artifacts/{{url.hashParams?.image}}/{{url.hashParams?.variant}}/{{url.hashParams?.tag}}/{{url.hashParams?.revision}}"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    runWhenPageLoadsDelay="50"
  >
    <Event
      enabled="{{ !retoolContext.inEditorMode }}"
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
  <State id="parameterToUpdate" />
  <State id="dependencyToUpdate" />
  <RESTQuery
    id="applyBuildPlan"
    bodyType="json"
    isMultiplayerEdited={false}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/build/{{url.hashParams?.image}}/{{url.hashParams?.variant}}/{{url.hashParams?.tag}}/{{url.hashParams?.revision}}"
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
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getBuildPlanDetails"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <Frame
    id="$main8"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text
      id="text24"
      value="## {{ retoolContext.pages.find(page => page.isCurrentPage).title }}"
      verticalAlign="center"
    />
    <Include src="./container7.rsx" />
    <Container
      id="tabbedContainer1"
      currentViewKey="{{ self.viewKeys[0] }}"
      enableFullBleed={true}
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      overflowType="hidden"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Tabs
          id="tabs2"
          itemMode="static"
          navigateContainer={true}
          targetContainerId="tabbedContainer1"
          value="{{ self.values[0] }}"
        >
          <Option id="6e887" value="Tab 1" />
          <Option id="14dc8" value="Tab 2" />
          <Option id="7ddbf" value="Tab 3" />
        </Tabs>
      </Header>
      <View id="56dc5" viewKey="Dependencies">
        <ListViewBeta
          id="listView1"
          data="{{ getBuildPlanDetails.data?.dependencies }}"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="12px"
        >
          <EditableText
            id="editableText31"
            label="{{item?.dependencyName}}/{{ item?.dependencyVariant }}"
            placeholder="Enter value"
            readOnly="true"
            value="{{ item?.dependencyTag }}"
          />
        </ListViewBeta>
      </View>
      <View id="f51a8" viewKey="Parameters">
        <ListViewBeta
          id="listView2"
          data="{{ getBuildPlanDetails.data?.parameters }}"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="12px"
        >
          <EditableText
            id="editableText32"
            label="{{item?.name}}"
            placeholder="Enter value"
            readOnly="true"
            value="{{ item?.value }}"
          />
        </ListViewBeta>
      </View>
    </Container>
  </Frame>
</Screen>
