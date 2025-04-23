<Container
  id="tabbedContainer3"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="0"
  showBody={true}
  showBorder={false}
  style={{ ordered: [{ background: "canvas" }] }}
>
  <Header>
    <Tabs
      id="tabs4"
      itemMode="static"
      navigateContainer={true}
      targetContainerId="tabbedContainer3"
      value="{{ self.values[0] }}"
    >
      <Option id="e92f9" value="Tab 1" />
      <Option id="800f1" value="Tab 2" />
      <Option id="c7989" value="Tab 3" />
    </Tabs>
  </Header>
  <View id="9dabc" viewKey="details">
    <Include src="./container8.rsx" />
    <Container
      id="tabbedContainer2"
      currentViewKey="{{ self.viewKeys[0] }}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Tabs
          id="tabs3"
          itemMode="static"
          navigateContainer={true}
          style={{
            ordered: [
              { fontSize: "h4Font" },
              { fontWeight: "h4Font" },
              { fontFamily: "h4Font" },
            ],
          }}
          targetContainerId="tabbedContainer2"
          value="{{ self.values[0] }}"
        >
          <Option id="cc0a0" value="Tab 1" />
          <Option id="ec476" value="Tab 2" />
          <Option id="149ac" value="Tab 3" />
        </Tabs>
        <DropdownButton
          id="dropdownButton2"
          _colorByIndex={["", ""]}
          _fallbackTextByIndex={["", ""]}
          _imageByIndex={["", ""]}
          _values={["", ""]}
          itemMode="static"
          overlayMaxHeight={375}
          styleVariant="outline"
          text="Add dependency"
        >
          <Option id="0b538" label="Internal dependency">
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
          <Option id="c9d39" label="DockerHub dependency">
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
      </Header>
      <View id="7e794" label="Dependencies" viewKey="Dependencies">
        <Table
          id="dependenciesListTable"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ getImageDependencies.data?.data }}"
          defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
          emptyMessage="No parameters found"
          enableSaveActions={true}
          groupByColumns={{}}
          hasNextPage="{{ !!dependenciesCursorDirectory.value.get(dependenciesListTable.pagination.currentPage+1) }}"
          heightType="auto"
          nextAfterCursor="{{ dependenciesCursorDirectory.value.get(dependenciesListTable.pagination.currentPage+1) }}"
          overflowType="pagination"
          primaryKeyColumnId="fb8b8"
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
            id="3dcb0"
            alignment="left"
            format="date"
            groupAggregationMode="none"
            hidden="true"
            key="createdAt"
            label="Created at"
            position="center"
            size={96}
          />
          <Column
            id="58142"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="image"
            label="Image"
            placeholder="Enter value"
            position="center"
            size={100}
          />
          <Column
            id="099e7"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="variant"
            label="Variant"
            placeholder="Enter value"
            position="center"
            size={100}
          />
          <Column
            id="0b51d"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="dependencyName"
            label="Dependency name"
            placeholder="Enter value"
            position="center"
            size={134}
          />
          <Column
            id="df744"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="dependencyVariant"
            label="Dependency variant"
            placeholder="Enter value"
            position="center"
            size={148}
          />
          <Column
            id="6cb9f"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="tag"
            label="Tag"
            placeholder="Enter value"
            position="center"
            size={100}
          />
          <Column
            id="0d56c"
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
            id="48d40"
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
            id="fb8b8"
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
          <Column
            id="a9230"
            alignment="left"
            format="button"
            formatOptions={{ variant: "solid" }}
            groupAggregationMode="none"
            placeholder="Enter value"
            position="center"
            referenceId="actionGo"
            size={122}
            summaryAggregationMode="none"
            valueOverride="Go to details"
          >
            <Event
              enabled="{{ currentRow.type === 'external' }}"
              event="clickCell"
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
                                { value: "{{ currentRow.dependencyName }}" },
                              ],
                            },
                            {
                              ordered: [
                                { key: "variant" },
                                { value: "{{ currentRow.dependencyVariant }}" },
                              ],
                            },
                          ],
                        },
                      ],
                    },
                  },
                  { pageName: "externalImages" },
                ],
              }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              enabled="{{ currentRow.type === 'internal' }}"
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
                                { value: "{{ currentRow.dependencyName }}" },
                              ],
                            },
                            {
                              ordered: [
                                { key: "variant" },
                                { value: "{{ currentRow.dependencyVariant }}" },
                              ],
                            },
                          ],
                        },
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
              enabled="{{ currentRow.type === 'internal' }}"
              event="clickCell"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="getImageDetails"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <Column
            id="5cc95"
            alignment="center"
            format="button"
            formatOptions={{ variant: "outline" }}
            groupAggregationMode="none"
            placeholder="Enter value"
            position="center"
            referenceId="patchAction"
            size={100}
            summaryAggregationMode="none"
            valueOverride="Patch"
          >
            <Event
              event="clickCell"
              method="show"
              params={{ ordered: [] }}
              pluginId="updateDependencyTagModal"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
            <Event
              enabled="{{ currentRow.type === 'internal'}}"
              event="clickCell"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="getImageDetails2"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <Column
            id="5b4d3"
            alignment="left"
            format="button"
            formatOptions={{
              variant: "solid",
              buttonColor: "{{ theme.danger }}",
            }}
            groupAggregationMode="none"
            placeholder="Enter value"
            position="center"
            referenceId="deleteAction"
            size={117}
            summaryAggregationMode="none"
            valueOverride="Delete"
          >
            <Event
              event="clickCell"
              method="show"
              params={{ ordered: [] }}
              pluginId="deleteDependencyFromInternalAlert"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <Column
            id="ba3f8"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            placeholder="Enter value"
            position="center"
            referenceId="empty"
            size={30}
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
              pluginId="dependenciesListTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
          <Event
            event="changePage"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="getImageDependencies"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Table>
      </View>
      <View id="1f644" viewKey="Dependents">
        <Table
          id="dependentsListTable"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ getDependentImagesForInternalImages.data?.data }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          groupByColumns={{}}
          hasNextPage="{{ !!dependentsCursorDirectory.value.get(dependentsListTable.pagination.currentPage+1) }}"
          heightType="auto"
          nextAfterCursor="{{ dependentsCursorDirectory.value.get(dependentsListTable.pagination.currentPage+1) }}"
          overflowType="pagination"
          primaryKeyColumnId="efdc6"
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
            id="2c80c"
            alignment="left"
            format="date"
            groupAggregationMode="none"
            hidden="true"
            key="createdAt"
            label="Created at"
            position="center"
            size={85.96875}
            summaryAggregationMode="none"
          />
          <Column
            id="6edee"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="image"
            label="Image"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="67757"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="variant"
            label="Variant"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="9880e"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="dependencyName"
            label="Dependency name"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="e6883"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="dependencyVariant"
            label="Dependency variant"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="13a62"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="tag"
            label="Tag"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="1a078"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="type"
            label="Type"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="73e3b"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            key="updatedAt"
            label="Updated at"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="efdc6"
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
              pluginId="dependentsListTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
          <Event
            event="changePage"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="getDependentImagesForInternalImages"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Table>
      </View>
    </Container>
    <Container
      id="container10"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle15"
          style={{ ordered: [] }}
          value="#### Parameters"
          verticalAlign="center"
        />
        <Button
          id="button38"
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
      </Header>
      <View id="06993" viewKey="View 1">
        <Table
          id="parametersListTable"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ getParameters.data?.data }}"
          defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          groupByColumns={{}}
          hasNextPage="{{ !!parametersCursorDirectory.value.get(parametersListTable.pagination.currentPage+1) }}"
          heightType="auto"
          nextAfterCursor="{{ parametersCursorDirectory.value.get(parametersListTable.pagination.currentPage+1) }}"
          overflowType="pagination"
          primaryKeyColumnId="1ef17"
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
            id="ca7c9"
            alignment="left"
            format="date"
            groupAggregationMode="none"
            hidden="true"
            key="createdAt"
            label="Created at"
            position="center"
            size={88.09375}
            summaryAggregationMode="none"
          />
          <Column
            id="12fd4"
            alignment="left"
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="image"
            label="Image"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ item }}"
          />
          <Column
            id="3229e"
            alignment="left"
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="variant"
            label="Variant"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ item }}"
          />
          <Column
            id="5eef7"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="name"
            label="Name"
            placeholder="Enter value"
            position="center"
            size={167}
            summaryAggregationMode="none"
          />
          <Column
            id="26a00"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="value"
            label="Value"
            placeholder="Enter value"
            position="center"
            size={150}
            summaryAggregationMode="none"
          />
          <Column
            id="40535"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            key="updatedAt"
            label="Updated at"
            placeholder="Enter value"
            position="center"
            size={168}
            summaryAggregationMode="none"
          />
          <Column
            id="1ef17"
            alignment="left"
            editable="false"
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="key"
            label="Key"
            placeholder="Enter value"
            position="center"
            size={145}
            summaryAggregationMode="none"
          />
          <Column
            id="7dd04"
            alignment="left"
            format="button"
            formatOptions={{ variant: "outline" }}
            groupAggregationMode="none"
            placeholder="Enter value"
            position="center"
            referenceId="updateAction"
            size={124}
            summaryAggregationMode="none"
            valueOverride="Update value"
          >
            <Event
              event="clickCell"
              method="show"
              params={{ ordered: [] }}
              pluginId="updateParameterModal"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <Column
            id="938f8"
            alignment="left"
            format="button"
            formatOptions={{
              variant: "solid",
              buttonColor: "{{ theme.danger }}",
            }}
            groupAggregationMode="none"
            placeholder="Enter value"
            position="center"
            referenceId="deleteAction"
            size={100}
            summaryAggregationMode="none"
            valueOverride="Delete"
          >
            <Event
              event="clickCell"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="deleteParameter"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <Column
            id="76700"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            placeholder="Enter value"
            position="center"
            referenceId="empty"
            size={44}
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
              pluginId="parametersListTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
          <Event
            event="changePage"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="getParameters"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Table>
      </View>
    </Container>
  </View>
  <View id="22999" viewKey="artifacts">
    <Table
      id="table6"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ getArtifactList.data?.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="bd0ef"
      rowHeight="medium"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="c664d"
        alignment="left"
        format="date"
        groupAggregationMode="none"
        hidden="true"
        key="createdAt"
        label="Created at"
        position="center"
        size={88.09375}
        summaryAggregationMode="none"
      />
      <Column
        id="172b2"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="image"
        label="Image"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="104cb"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="variant"
        label="Variant"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="b2de4"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="tag"
        label="Tag"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="1aadc"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="revision"
        label="Revision"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="80e2a"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="status"
        label="Status"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="0c956"
        alignment="left"
        format="boolean"
        groupAggregationMode="none"
        key="latest"
        label="Latest"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="595a6"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="updatedAt"
        label="Updated at"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="bd0ef"
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
        summaryAggregationMode="none"
      />
      <Column
        id="dd4da"
        alignment="left"
        format="button"
        formatOptions={{ variant: "solid", buttonColor: "{{ theme.danger }}" }}
        groupAggregationMode="none"
        placeholder="Enter value"
        position="center"
        referenceId="goToAction"
        size={117}
        summaryAggregationMode="none"
        valueOverride="Discard"
      >
        <Event
          event="clickCell"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="discardBuildPlan"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="ad1db"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        placeholder="Enter value"
        position="center"
        referenceId="empty"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="7eafd"
        alignment="left"
        format="button"
        formatOptions={{ variant: "solid" }}
        groupAggregationMode="none"
        label="Column 12"
        placeholder="Enter value"
        position="center"
        referenceId="column12"
        size={100}
        summaryAggregationMode="none"
        valueOverride="asdas"
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
                            { value: "{{ currentRow.image }}" },
                          ],
                        },
                        {
                          ordered: [
                            { key: "variant" },
                            { value: "{{ currentRow.variant }}" },
                          ],
                        },
                        {
                          ordered: [
                            { key: "tag" },
                            { value: "{{ currentRow.tag }}" },
                          ],
                        },
                        {
                          ordered: [
                            { key: "revision" },
                            { value: "{{ currentRow.revision }}" },
                          ],
                        },
                      ],
                    },
                    {
                      queryParams: [
                        {
                          ordered: [
                            { key: "image" },
                            { value: "{{ currentRow.image }}" },
                          ],
                        },
                        {
                          ordered: [
                            { key: "variant" },
                            { value: "{{ currentRow.variant }}" },
                          ],
                        },
                        {
                          ordered: [
                            { key: "tag" },
                            { value: "{{ currentRow.tag }}" },
                          ],
                        },
                        {
                          ordered: [
                            { key: "revision" },
                            { value: "{{ currentRow.revision }}" },
                          ],
                        },
                      ],
                    },
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
      </Column>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="refresh"
          pluginId="table6"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </View>
</Container>
