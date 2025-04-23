<Screen
  id="images"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  title="Images"
  urlSlug=""
>
  <Folder id="imagesTableLogic">
    <State
      id="getImagesCursorDirectory"
      value="{{ new Map().set(0, undefined) }}"
    />
    <RESTQuery
      id="getImagesPaginated"
      enableTransformer={true}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/images?limit={{ imageListTable?.pagination?.pageSize ?? '2' }}&{{ !!getImagesCursorDirectory.value.get(imageListTable?.pagination?.currentPage ?? 0) ? 'cursor' : null }}={{ !!getImagesCursorDirectory.value.has(imageListTable?.pagination?.currentPage ?? 0) ? getImagesCursorDirectory.value.get(imageListTable?.pagination?.currentPage ?? 0) : '' }}"
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
              src: "const currentValue = getImagesCursorDirectory.value ?? new Map().set(0, undefined)\nif (!currentValue.get(imageListTable.pagination.currentPage+1)) {\n  currentValue.set(imageListTable.pagination.currentPage+1, getImagesPaginated.data.cursor)\n  getImagesCursorDirectory.setValue(currentValue)\n}\n",
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
  <RESTQuery
    id="deleteImage"
    bodyType="json"
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/images/{{ imageNameToDelete.value }}/{{ imageVariantToDelete.value }}"
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
    id="getImages"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ retoolContext.environment !== 'production' ?apolloApiBaseUrl.value ?? '' : '' }}api/images"
    resourceName="a2116cf5-6600-4f9f-9512-320c55653be3"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="return {...data, data: data.data.map(item => ({...item, key: `${item.name}-${item.variant}`}))}"
  />
  <JavascriptQuery
    id="goToImage"
    notificationDuration={4.5}
    query={include("../lib/goToImage.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showSuccessToaster={false}
  />
  <Include src="./deleteImageAlert.rsx" />
  <Include src="./imageDetailsDrawer.rsx" />
  <Frame
    id="$main2"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text
      id="text1"
      value="## {{ retoolContext.pages.find(page => page.isCurrentPage).title }}"
      verticalAlign="center"
    />
    <Container
      id="container1"
      _gap="0px"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hidden="{{ (!!apolloApiBaseUrl.value && retoolContext.environment === 'staging') || retoolContext.environment === 'production'}}"
      overflowType="hidden"
      padding="12px"
      showBody={true}
      showHeader={true}
      style={{ ordered: [{ background: "highlight" }] }}
    >
      <Header>
        <Text
          id="containerTitle1"
          value="#### Connect api"
          verticalAlign="center"
        />
      </Header>
      <View id="74e95" viewKey="View 1">
        <Text
          id="text6"
          disableMarkdown={true}
          horizontalAlign="center"
          value="Connect API in settings to test all Apollo views"
          verticalAlign="center"
        />
        <Button
          id="button8"
          horizontalAlign="center"
          style={{ ordered: [{ background: "warning" }] }}
          text="Go to Settings"
        >
          <Event
            enabled="{{ retoolContext.environment === 'staging'}}"
            event="click"
            method="openPage"
            params={{ ordered: [{ pageName: "settings" }] }}
            pluginId=""
            type="util"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </View>
    </Container>
    <TextInput
      id="searchImageInput"
      iconBefore="bold/interface-search"
      label=""
      labelPosition="top"
      placeholder="Search image"
    />
    <Button
      id="createImageButton"
      hidden="{{ !actAsAdmin.value }}"
      text="Create Image"
    >
      <Event
        event="click"
        method="openPage"
        params={{
          ordered: [
            { options: { ordered: [{ passDataWith: "urlParams" }] } },
            { pageName: "createImagePage" },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Table
      id="imageListTable"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ getImagesPaginated.data?.data }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      groupByColumns={{}}
      hasNextPage="{{ !!getImagesCursorDirectory.value.get(imageListTable.pagination.currentPage+1) }}"
      heightType="auto"
      nextAfterCursor="{{ getImagesCursorDirectory.value.get(imageListTable.pagination.currentPage+1) }}"
      overflowType="pagination"
      primaryKeyColumnId="4bc5b"
      rowHeight="medium"
      searchTerm="{{ searchImageInput.value }}"
      serverPaginated={true}
      serverPaginationType="forwardCursorBased"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      templatePageSize="10"
      toolbarPosition="bottom"
    >
      <Column
        id="54b46"
        alignment="left"
        editable={false}
        format="string"
        groupAggregationMode="none"
        key="name"
        label="Name"
        placeholder="Enter value"
        position="center"
        size={66.359375}
      />
      <Column
        id="64284"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="variant"
        label="Variant"
        placeholder="Enter value"
        position="center"
        size={80.046875}
      />
      <Column
        id="8f24a"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="repositoryName"
        label="Repository name"
        placeholder="Enter value"
        position="center"
        size={173.234375}
      />
      <Column
        id="d6f4a"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover" }}
        groupAggregationMode="none"
        key="buildUrl"
        label="Build URL"
        position="center"
        size={83.390625}
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
        id="bb643"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover" }}
        groupAggregationMode="none"
        key="deployUrl"
        label="Deploy URL"
        position="center"
        size={82.078125}
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
        id="04bbd"
        alignment="center"
        format="boolean"
        formatOptions={{
          falseIcon: "bold/interface-unlock",
          trueIcon: "bold/interface-lock",
          trueColor: "{{ theme.info }}",
        }}
        groupAggregationMode="none"
        key="locked"
        label="Locked"
        placeholder="Enter value"
        position="center"
        size={57.3125}
        summaryAggregationMode="none"
      />
      <Column
        id="de22d"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="createdAt"
        label="Created at"
        placeholder="Enter value"
        position="center"
        size={154.046875}
      />
      <Column
        id="0abc0"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="updatedAt"
        label="Updated at"
        placeholder="Enter value"
        position="center"
        size={154.046875}
      />
      <Column
        id="4bc5b"
        alignment="left"
        editable="false"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="key"
        label="Key"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="ecb89"
        alignment="left"
        format="button"
        formatOptions={{ variant: "solid" }}
        groupAggregationMode="none"
        placeholder="Enter value"
        position="center"
        referenceId="actions"
        size={100}
        summaryAggregationMode="none"
        valueOverride="Go to details"
      >
        <Event
          event="clickCell"
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
                            { value: "{{ currentRow.name }}" },
                          ],
                        },
                        {
                          ordered: [
                            { key: "variant" },
                            { value: "{{ currentRow.variant }}" },
                          ],
                        },
                      ],
                    },
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
      </Column>
      <Column
        id="e9970"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        placeholder="Enter value"
        position="center"
        referenceId="empty"
        size={76}
        summaryAggregationMode="none"
      />
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="refresh"
          pluginId="imageListTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <Event
        event="changePage"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getImagesPaginated"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </Frame>
</Screen>
