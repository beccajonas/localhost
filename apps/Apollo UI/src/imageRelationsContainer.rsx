<Container
  id="imageRelationsContainer"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
  showHeader={true}
>
  <Header>
    <Tabs
      id="tabs1"
      itemMode="static"
      navigateContainer={true}
      targetContainerId="imageRelationsContainer"
      value="{{ self.values[0] }}"
    >
      <Option id="5df4d" value="Tab 1" />
      <Option id="251fb" value="Tab 2" />
      <Option id="68511" value="Tab 3" />
    </Tabs>
  </Header>
  <View id="504b5" viewKey="Dependencies">
    <DropdownButton
      id="dropdownButton1"
      _colorByIndex={["", ""]}
      _fallbackTextByIndex={["", ""]}
      _imageByIndex={["", ""]}
      _values={["", ""]}
      hidden="{{ !imageEditMode.value || imageRelationsContainer.currentViewKey != 'Dependencies' }}"
      itemMode="static"
      overlayMaxHeight={375}
      styleVariant="outline"
      text="Add dependency"
    >
      <Option id="fc2f8" label="Internal dependency">
        <Event
          event="click"
          method="show"
          params={{ ordered: [] }}
          pluginId="addInternalDependencyModal"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="getImagesPaginatedForSelectImage"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Option id="80b48" label="External dependency">
        <Event
          event="click"
          method="show"
          params={{ ordered: [] }}
          pluginId="addExternalDependencyModal"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="getExternalImagesForSelect"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
    </DropdownButton>
    <Table
      id="dependenciesTable"
      actionsOverflowPosition={4}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ getImageDependencies.data?.data ?? [] }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No dependencies found"
      enableSaveActions={true}
      groupByColumns={{}}
      hasNextPage="{{ !!dependenciesCursorDirectory.value.get(dependenciesTable.pagination.currentPage+1) }}"
      heightType="auto"
      nextAfterCursor="{{ dependenciesCursorDirectory.value.get(dependenciesTable.pagination.currentPage+1) }}"
      overflowType="pagination"
      primaryKeyColumnId="7009e"
      rowHeight="small"
      serverPaginated={true}
      serverPaginationType="forwardCursorBased"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      templatePageSize="10"
      toolbarPosition="bottom"
    >
      <Column
        id="0ddc4"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="dependencyName"
        label="Name"
        placeholder="Enter value"
        position="center"
        size={114.375}
      />
      <Column
        id="467f6"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="dependencyVariant"
        label="Dependency variant"
        placeholder="Enter value"
        position="center"
        size={145.875}
      />
      <Column
        id="35fa9"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="type"
        label="Type"
        optionList={{
          manualData: [
            { ordered: [{ value: "internal" }, { label: "Internal" }] },
            { ordered: [{ value: "external" }, { label: "External" }] },
          ],
        }}
        placeholder="Select option"
        position="center"
        size={92.59375}
      />
      <Column
        id="e0420"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="tag"
        label="Tag"
        placeholder="Select option"
        position="center"
        size={100}
      />
      <Column
        id="ab8de"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="image"
        label="Image"
        placeholder="Enter value"
        position="center"
        size={50.671875}
      />
      <Column
        id="02735"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="variant"
        label="Variant"
        placeholder="Enter value"
        position="center"
        size={55.734375}
      />
      <Column
        id="3ec8b"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        hidden="true"
        key="createdAt"
        label="Created at"
        placeholder="Enter value"
        position="center"
        size={146.265625}
      />
      <Column
        id="b4e53"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        hidden="true"
        key="updatedAt"
        label="Updated at"
        placeholder="Enter value"
        position="center"
        size={146.265625}
      />
      <Column
        id="7009e"
        alignment="left"
        editable={false}
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="key"
        label="Key"
        placeholder="Enter value"
        position="center"
        size={116.203125}
      />
      <Action
        id="57941"
        hidden="{{ currentRow.type === 'external' }}"
        icon="bold/interface-logout-circle-alternate"
        label="Go to {{ currentRow.key }}"
      >
        <Event
          event="clickAction"
          method="setCurrentView"
          params={{ ordered: [{ viewKey: '"Dependents"' }] }}
          pluginId="imageRelationsContainer"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="openPage"
          params={{
            ordered: [
              {
                options: {
                  ordered: [
                    { passDataWith: "urlParams" },
                    {
                      queryParams: [
                        {
                          ordered: [
                            { key: "image" },
                            { value: "{{ currentRow?.dependencyName }}" },
                          ],
                        },
                        {
                          ordered: [
                            { key: "variant" },
                            { value: "{{ currentRow?.dependencyVariant }}" },
                          ],
                        },
                      ],
                    },
                  ],
                },
              },
              { pageName: "images" },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="50"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="clearSelection"
          params={{ ordered: [] }}
          pluginId="imageListTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="getImageDetails"
          type="datasource"
          waitMs="500"
          waitType="debounce"
        />
      </Action>
      <Action
        id="43dea"
        hidden="{{ currentRow.type === 'internal' }}"
        icon="bold/interface-logout-circle-alternate"
        label="Go to {{ currentRow.key }}"
      >
        <Event
          event="clickAction"
          method="openPage"
          params={{
            ordered: [
              { pageName: "externalImages" },
              {
                options: {
                  ordered: [
                    {
                      queryParams: [
                        {
                          ordered: [
                            { key: "image" },
                            { value: "{{ currentRow?.dependencyName }}" },
                          ],
                        },
                        {
                          ordered: [
                            { key: "variant" },
                            { value: "{{ currentRow?.dependencyVariant }}" },
                          ],
                        },
                      ],
                    },
                    { hashParams: [] },
                    { persistUrlParams: true },
                    { passDataWith: "urlParams" },
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
      </Action>
      <Action
        id="19527"
        hidden="{{ !actAsAdmin.value }}"
        icon="bold/interface-delete-bin-2"
        label="Delete dependency"
      >
        <Event
          event="clickAction"
          method="show"
          params={{ ordered: [] }}
          pluginId="deleteDependencyFromInternalAlert"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Action>
      <Action
        id="c5928"
        icon="bold/interface-bookmark-tag"
        label="Update tag"
      />
    </Table>
  </View>
  <View id="89263" viewKey="Dependents">
    <Table
      id="table4"
      actionsOverflowPosition={1}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ getDependentImagesForInternalImages.data?.data ?? [] }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No dependent images found"
      enableSaveActions={true}
      groupByColumns={{}}
      hasNextPage="{{ !!dependentsCursorDirectory.value.get(table4.pagination.currentPage+1) }}"
      heightType="auto"
      nextAfterCursor="{{ dependentsCursorDirectory.value.get(table4.pagination.currentPage+1) }}"
      overflowType="pagination"
      primaryKeyColumnId="5fed9"
      rowHeight="small"
      serverPaginated={true}
      serverPaginationType="forwardCursorBased"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      templatePageSize="10"
      toolbarPosition="bottom"
    >
      <Column
        id="2b167"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="image"
        label="Image"
        placeholder="Enter value"
        position="center"
        size={100}
        valueOverride="{{ item }}"
      />
      <Column
        id="88c5e"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="variant"
        label="Variant"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="98f91"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        hidden="true"
        key="dependencyName"
        label="Dependency name"
        placeholder="Select option"
        position="center"
        size={100}
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="bd9e0"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        hidden="true"
        key="dependencyVariant"
        label="Dependency variant"
        placeholder="Select option"
        position="center"
        size={100}
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="dac89"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="tag"
        label="Tag"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="5b2c4"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="type"
        label="Type"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="282e1"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        hidden="true"
        key="createdAt"
        label="Created at"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="ad848"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        hidden="true"
        key="updatedAt"
        label="Updated at"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="5fed9"
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
      <Action
        id="2ef06"
        icon="bold/interface-logout-circle-alternate"
        label="Go to {{ currentRow.key }}"
      >
        <Event
          event="clickAction"
          method="openPage"
          params={{
            ordered: [
              {
                options: {
                  ordered: [
                    { passDataWith: "urlParams" },
                    {
                      queryParams: [
                        {
                          ordered: [
                            { key: "image" },
                            { value: "{{ currentRow?.image }}" },
                          ],
                        },
                        {
                          ordered: [
                            { key: "variant" },
                            { value: "{{ currentRow?.variant }}" },
                          ],
                        },
                      ],
                    },
                    { hashParams: [] },
                    { persistUrlParams: false },
                  ],
                },
              },
              { pageName: "images" },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="setCurrentView"
          params={{ ordered: [{ viewKey: '"Dependencies"' }] }}
          pluginId="imageRelationsContainer"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickAction"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="getImageDetails"
          type="datasource"
          waitMs="50"
          waitType="debounce"
        />
      </Action>
    </Table>
  </View>
  <View id="6fce4" viewKey="Parameters">
    <Button
      id="button25"
      hidden="{{ !actAsAdmin.value }}"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Add parameter"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="createParameterModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Table
      id="parameterListTable"
      actionsOverflowPosition={2}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ getParameters.data?.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      groupByColumns={{}}
      hasNextPage="{{ !!parametersCursorDirectory.value.get(parameterListTable.pagination.currentPage+1) }}"
      heightType="auto"
      nextAfterCursor="{{ parametersCursorDirectory.value.get(parameterListTable.pagination.currentPage+1) }}"
      overflowType="pagination"
      primaryKeyColumnId="3b058"
      rowHeight="small"
      serverPaginated={true}
      serverPaginationType="forwardCursorBased"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      templatePageSize="10"
      toolbarPosition="bottom"
    >
      <Column
        id="8f965"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="name"
        label="Name"
        placeholder="Enter value"
        position="center"
        size={202.625}
      />
      <Column
        id="89370"
        alignment="left"
        editable={false}
        format="string"
        groupAggregationMode="none"
        key="value"
        label="Value"
        position="center"
        size={105.4375}
      />
      <Column
        id="4b1a7"
        alignment="left"
        format="date"
        groupAggregationMode="none"
        hidden="true"
        key="createdAt"
        label="Created at"
        position="center"
        size={94.59375}
      />
      <Column
        id="865eb"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="image"
        label="Image"
        placeholder="Enter value"
        position="center"
        size={50.671875}
      />
      <Column
        id="eefda"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="variant"
        label="Variant"
        placeholder="Enter value"
        position="center"
        size={55.734375}
      />
      <Column
        id="a8f32"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        hidden="true"
        key="updatedAt"
        label="Updated at"
        placeholder="Enter value"
        position="center"
        size={146.75}
      />
      <Column
        id="3b058"
        alignment="left"
        editable={false}
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="key"
        label="Key"
        placeholder="Enter value"
        position="center"
        size={170.578125}
      />
      <Column
        id="433a9"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="initialValue"
        label="Initial value"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Action
        id="12396"
        hidden="{{ !actAsAdmin.value }}"
        icon="bold/interface-edit-pencil"
        label="Edit value"
      >
        <Event
          event="clickAction"
          method="show"
          params={{ ordered: [] }}
          pluginId="updateParameterModal"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Action>
      <Action
        id="cbfd9"
        hidden="{{ !actAsAdmin.value }}"
        icon="bold/interface-delete-bin-2"
        label="Delete parameter"
      >
        <Event
          event="clickAction"
          method="show"
          params={{ ordered: [] }}
          pluginId="deleteParameterAlert"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Action>
    </Table>
  </View>
  <View
    id="ff42a"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="Artifacts"
  >
    <Button id="button31" text="Create build plan">
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="createPlanForImageModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Table
      id="artifactsTable"
      actionsOverflowPosition={1}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ getArtifactList.data?.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      groupByColumns={{}}
      hasNextPage="{{ !!artifactListCursorDirectory.value.get(artifactsTable.pagination.currentPage+1) }}"
      heightType="auto"
      nextAfterCursor="{{ artifactListCursorDirectory.value.get(artifactsTable.pagination.currentPage+1) }}"
      overflowType="pagination"
      primaryKeyColumnId="f5375"
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
        id="1c3cb"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="image"
        label="Image"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="50d7a"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="variant"
        label="Variant"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="81382"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="tag"
        label="Tag"
        placeholder="Enter value"
        position="center"
        size={56}
      />
      <Column
        id="44d3c"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="revision"
        label="Revision"
        placeholder="Enter value"
        position="center"
        size={69}
      />
      <Column
        id="92b52"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="status"
        label="Status"
        optionList={{
          manualData: [
            { ordered: [{ value: "planned" }, { label: "Planned" }] },
          ],
        }}
        placeholder="Select option"
        position="center"
        size={100}
      />
      <Column
        id="093cc"
        alignment="left"
        format="boolean"
        groupAggregationMode="none"
        key="latest"
        label="Latest"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="11f1a"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="updatedAt"
        label="Updated at"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="57dab"
        alignment="left"
        format="date"
        groupAggregationMode="none"
        key="createdAt"
        label="Created at"
        position="center"
        size={96}
      />
      <Column
        id="f5375"
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
      <Action id="27e10" icon="bold/interface-edit-pencil" label="Go to plan">
        <Event
          event="clickAction"
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
                            { value: "{{ currentRow?.image }}" },
                          ],
                        },
                        {
                          ordered: [
                            { key: "variant" },
                            { value: "{{ currentRow?.variant }}" },
                          ],
                        },
                        {
                          ordered: [
                            { key: "tag" },
                            { value: "{{ currentRow?.tag }}" },
                          ],
                        },
                        {
                          ordered: [
                            { key: "revision" },
                            { value: "{{ currentRow?.revision }}" },
                          ],
                        },
                      ],
                    },
                    { persistUrlParams: true },
                  ],
                },
              },
              { pageName: "buildImage" },
            ],
          }}
          pluginId=""
          type="util"
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
          pluginId="artifactsTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </View>
</Container>
