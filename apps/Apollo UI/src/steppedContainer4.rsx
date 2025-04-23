<Container
  id="steppedContainer4"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showFooter={true}
  showHeader={true}
>
  <Header>
    <Steps
      id="steps4"
      horizontalAlign="center"
      itemMode="static"
      navigateContainer={true}
      showStepNumbers={true}
      targetContainerId="steppedContainer4"
      value="{{ self.values[0] }}"
    >
      <Option id="40913" value="Step 1" />
      <Option id="cfbcd" value="Step 2" />
      <Option id="71aae" value="Step 3" />
    </Steps>
  </Header>
  <View id="8a760" viewKey="Select repository">
    <Table
      id="selectRepositoryTable"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ listRegistryForSelect.data?.data ?? [] }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      groupByColumns={{}}
      hasNextPage="{{ registryCursorDirectory.value.get(selectRepositoryTable.pagination.currentPage+1) }}"
      heightType="auto"
      nextAfterCursor="{{ registryCursorDirectory.value.get(selectRepositoryTable.pagination.currentPage+1) }}"
      overflowType="pagination"
      primaryKeyColumnId="01d69"
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
        id="01d69"
        alignment="left"
        editable={false}
        format="string"
        groupAggregationMode="none"
        key="name"
        label="Repository name"
        placeholder="Enter value"
        position="center"
        size={291.71875}
      />
      <Column
        id="62dae"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="createdAt"
        label="Created at"
        placeholder="Enter value"
        position="center"
        size={154.078125}
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
          pluginId="selectRepositoryTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <Event
        event="changePage"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="listRegistryForSelect"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="selectRow"
        method="clear"
        params={{ ordered: [] }}
        pluginId="createImageForm"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </View>
  <View id="c1ac2" viewKey="Image details">
    <Form
      id="createImageForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="0"
      requireValidation={true}
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text id="formTitle15" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <TextInput
          id="textInput46"
          customValidation={
            '{{ textInput46.value.includes(" ") ? "Image name should not have spaces" : /[:/?#[\\]@!$&\'()*+,;= ]/.test(textInput46.value) ? "Image name should not contain special characters" : ""}}'
          }
          formDataKey="name"
          label="Image Name"
          placeholder="Ex: node"
          required={true}
        />
        <Text
          id="text30"
          style={{ ordered: [{ color: "rgba(114, 114, 114, 1)" }] }}
          value="Image name should not contain spaces and it will be lowercased."
          verticalAlign="center"
        />
        <TextInput
          id="textInput49"
          customValidation={
            '{{ textInput49.value.includes(" ") ? "Variant should not have spaces" : /[:/?#[\\]@!$&\'()*+,;= ]/.test(textInput49.value) ? "Variant should not contain special characters" : "" }}'
          }
          formDataKey="variant"
          label="Variant"
          placeholder="Ex: alpine"
        />
        <Text
          id="text31"
          style={{ ordered: [{ color: "#727272" }] }}
          value="Variant should not contain spaces and it will be lowercased. If this field is empty, `default` will be used as default."
          verticalAlign="center"
        />
        <TextInput
          id="textInput47"
          formDataKey="repositoryName"
          label="Select ERC Repository"
          patternType="url"
          placeholder="Ex: test.com"
          readOnly="true"
          required={true}
          value="{{ selectRepositoryTable.selectedRow.name }}"
        />
        <TextInput
          id="textInput50"
          formDataKey="buildUrl"
          label="Build Trigger URL"
          patternType="url"
          placeholder="Ex: test.com"
          required={true}
        />
        <TextInput
          id="textInput48"
          formDataKey="deployUrl"
          label="Deploy URL"
          patternType="url"
          placeholder="Ex: test.com"
          required={true}
        />
      </Body>
      <Footer>
        <Button
          id="formButton15"
          submit={true}
          submitTargetId="createImageForm"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="createImage"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="invalid"
        method="setDisabled"
        params={{ ordered: [] }}
        pluginId="button45"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </View>
  <View
    id="23d59"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="Add depenencies"
  >
    <Text id="text32" value="### Image List" verticalAlign="center" />
    <Text id="text33" value="### Dependencies" verticalAlign="center" />
    <Container
      id="tabbedContainer4"
      currentViewKey="{{ self.viewKeys[0] }}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Tabs
          id="tabs5"
          itemMode="static"
          navigateContainer={true}
          targetContainerId="tabbedContainer4"
          value="{{ self.values[0] }}"
        >
          <Option id="2dcd2" value="Tab 1" />
          <Option id="25a6a" value="Tab 2" />
          <Option id="843fb" value="Tab 3" />
        </Tabs>
      </Header>
      <View id="4df9e" viewKey="Internal images">
        <Table
          id="selectInternalTable"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ getImagesPaginated2.data?.data }}"
          defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          groupByColumns={{}}
          hasNextPage="{{ !!imagesCursorDirectory.value.get(selectInternalTable?.pagination?.currentPage + 1) }}"
          nextAfterCursor="{{ imagesCursorDirectory.value.get(selectInternalTable?.pagination?.currentPage + 1) }}"
          overflowType="pagination"
          primaryKeyColumnId="18176"
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
            id="59505"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="name"
            label="Name"
            placeholder="Enter value"
            position="center"
            size={74.53125}
          />
          <Column
            id="e4626"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            hidden="true"
            key="createdAt"
            label="Created at"
            placeholder="Enter value"
            position="center"
            size={133.046875}
            summaryAggregationMode="none"
          />
          <Column
            id="7b97e"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="variant"
            label="Variant"
            placeholder="Select option"
            position="center"
            size={96}
            summaryAggregationMode="none"
            valueOverride="{{ item }}"
          />
          <Column
            id="315da"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="repositoryName"
            label="Repository name"
            placeholder="Enter value"
            position="center"
            size={135}
            summaryAggregationMode="none"
          />
          <Column
            id="f396c"
            alignment="left"
            format="link"
            formatOptions={{ showUnderline: "hover" }}
            groupAggregationMode="none"
            hidden="true"
            key="buildUrl"
            label="Build URL"
            position="center"
            size={100}
            summaryAggregationMode="none"
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
            id="5fa3a"
            alignment="left"
            format="link"
            formatOptions={{ showUnderline: "hover" }}
            groupAggregationMode="none"
            hidden="true"
            key="deployUrl"
            label="Deploy URL"
            position="center"
            size={100}
            summaryAggregationMode="none"
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
            id="bdf36"
            alignment="left"
            format="boolean"
            groupAggregationMode="none"
            hidden="true"
            key="locked"
            label="Locked"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="8837a"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            hidden="true"
            key="updatedAt"
            label="Updated at"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="18176"
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
            summaryAggregationMode="none"
          />
          <Column
            id="97893"
            alignment="left"
            format="button"
            formatOptions={{
              variant: "solid",
              disabled:
                "{{ currentSourceRow.name + currentSourceRow.variant === createImageForm.data?.name + createImageForm.data?.variant }}",
            }}
            groupAggregationMode="none"
            placeholder="Enter value"
            position="center"
            referenceId="addAction"
            size={100}
            summaryAggregationMode="none"
            valueOverride="Add"
          >
            <Event
              event="clickCell"
              method="show"
              pluginId="addInternalDependencyDetailsModal"
              type="widget"
              waitMs={0}
              waitType="debounce"
            />
            <Event
              event="clickCell"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="getRepositoryDetails2"
              type="datasource"
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
              pluginId="selectInternalTable"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
          <Event
            event="changePage"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="getImagesPaginated2"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Table>
      </View>
      <View id="368bf" viewKey="DockerHub images">
        <Table
          id="table7"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ getExternalImagesPaginated2.data?.data }}"
          defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          groupByColumns={{}}
          hasNextPage="{{ !!externalImagesCursorDirectory.value.get(table7?.pagination?.currentPage+1) }}"
          nextAfterCursor="{{ externalImagesCursorDirectory.value.get(table7?.pagination?.currentPage+1) }}"
          overflowType="pagination"
          primaryKeyColumnId="19292"
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
            id="0792c"
            alignment="left"
            format="date"
            groupAggregationMode="none"
            hidden="true"
            key="createdAt"
            label="Created at"
            position="center"
            size={88.1875}
          />
          <Column
            id="c92c0"
            alignment="left"
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="name"
            label="Name"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ item }}"
          />
          <Column
            id="f5bf4"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="namespace"
            label="Namespace"
            placeholder="Select option"
            position="center"
            size={100}
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="d4402"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="repository"
            label="Repository"
            placeholder="Select option"
            position="center"
            size={100}
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="09be5"
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
            id="0a930"
            alignment="left"
            format="link"
            formatOptions={{ showUnderline: "hover" }}
            groupAggregationMode="none"
            hidden="true"
            key="hubUrl"
            label="Hub URL"
            position="center"
            size={100}
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
            id="acbc2"
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
            id="19292"
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
            id="2e4d5"
            alignment="left"
            format="button"
            formatOptions={{ variant: "solid" }}
            groupAggregationMode="none"
            placeholder="Enter value"
            position="center"
            referenceId="addAction"
            size={100}
            valueOverride="Add"
          >
            <Event
              event="clickCell"
              method="show"
              pluginId="addExternalModal"
              type="widget"
              waitMs={0}
              waitType="debounce"
            />
          </Column>
          <Column
            id="cdbfd"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            placeholder="Enter value"
            position="center"
            referenceId="empty"
            size={100}
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
              pluginId="table7"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
          <Event
            event="changePage"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="getExternalImagesPaginated2"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Table>
      </View>
    </Container>
    <ListViewBeta
      id="listView3"
      _primaryKeys=""
      data="{{ getImageDependencies2.data?.data }}"
      itemWidth="200px"
      margin="0"
      numColumns={3}
      padding="0"
    >
      <Container
        id="container11"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        padding="12px"
        showBody={true}
      >
        <Header>
          <Text
            id="containerTitle16"
            value="#### {{ item }}"
            verticalAlign="center"
          />
        </Header>
        <View id="b685e" viewKey="View 1">
          <Text
            id="text34"
            value="###### {{ item.dependencyName }}/{{ item.dependencyVariant }}"
            verticalAlign="center"
          />
          <TagsWidget2
            id="tags2"
            allowWrap={true}
            data="{{ item.tag ? [item.tag] : []}}"
            horizontalAlign="right"
          />
        </View>
      </Container>
    </ListViewBeta>
  </View>
  <View id="56a0a" viewKey="Add parameters">
    <Form
      id="form5"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle18"
          value="#### New Parameter"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <TextInput
          id="textInput53"
          formDataKey="name"
          label="Name"
          labelCaption="Alphanumeric and underscore characters allowed; the first character must be a letter or an underscore"
          labelPosition="top"
          labelWrap={true}
          pattern="^[a-zA-Z_][a-zA-Z0-9_]*$"
          patternType="regex"
          placeholder="Enter value"
          required={true}
        />
        <TextInput
          id="textInput54"
          formDataKey="value"
          label="Value"
          labelPosition="top"
          placeholder="Enter value"
          required={true}
        />
      </Body>
      <Footer>
        <Button
          id="formButton18"
          submit={true}
          submitTargetId="form5"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="createParameter2"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
    <Text id="text35" value="#### Parameters" verticalAlign="center" />
    <ListViewBeta
      id="listView4"
      _primaryKeys=""
      data="{{ getParameters2.data?.data }}"
      itemWidth="200px"
      margin="0"
      numColumns={3}
      padding="0"
    >
      <Container
        id="container12"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        padding="12px"
        showBody={true}
      >
        <Header>
          <Text
            id="containerTitle17"
            value="#### {{ item }}"
            verticalAlign="center"
          />
        </Header>
        <View id="b685e" viewKey="View 1">
          <Text
            id="text36"
            value="**{{ item.name }}** "
            verticalAlign="center"
          />
          <Text
            id="text37"
            horizontalAlign="right"
            value="{{ item.value }}"
            verticalAlign="center"
          />
        </View>
      </Container>
    </ListViewBeta>
  </View>
  <Footer>
    <Button
      id="prevButton4"
      disabled="{{ steppedContainer4.currentViewIndex === 0 }}"
      hidden="{{ [2, 3].includes(steppedContainer4.currentViewIndex) }}"
      iconBefore="bold/interface-arrows-left-alternate"
      styleVariant="outline"
      text="Previous"
    >
      <Event
        event="click"
        method="showPreviousVisibleView"
        params={{ ordered: [{ wrap: false }] }}
        pluginId="steppedContainer4"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button45"
      disabled="{{ createImageForm.invalid }}"
      hidden="{{ steppedContainer4.currentViewIndex !== 1 }}"
      loading="{{ createImage.isFetching }}"
      submitTargetId=""
      text="Create Image"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="createImage"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="prevButton6"
      disabled="{{ steppedContainer4.currentViewIndex === 0 }}"
      hidden="{{ [0, 1, 2].includes(steppedContainer4.currentViewIndex) }}"
      iconBefore="bold/interface-arrows-left-alternate"
      styleVariant="outline"
      text="Previous"
    >
      <Event
        event="click"
        method="showPreviousVisibleView"
        params={{ ordered: [{ wrap: false }] }}
        pluginId="steppedContainer4"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="nextButton4"
      disabled="{{ (steppedContainer4.currentViewIndex === 0 && !selectRepositoryTable?.selectedRow) }}"
      hidden="{{ (steppedContainer4.currentViewIndex === 1) }}"
      iconAfter="bold/interface-arrows-right-alternate"
      text="{{ steppedContainer4.currentViewIndex !== 3 ? 'Continue' : 'Finish and go to image'}}"
    >
      <Event
        enabled="{{ steppedContainer4.currentViewIndex !== 3 }}"
        event="click"
        method="showNextVisibleView"
        params={{ ordered: [{ wrap: false }] }}
        pluginId="steppedContainer4"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ steppedContainer4.currentViewIndex === 3 }}"
        event="click"
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
                          { value: "{{ createImageForm.data?.name }}" },
                        ],
                      },
                      {
                        ordered: [
                          { key: "variant" },
                          { value: "{{ createImageForm.data?.variant }}" },
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
        event="click"
        method="setValue"
        params={{
          ordered: [{ value: "{{ selectRepositoryTable.selectedRow?.name }}" }],
        }}
        pluginId="textInput47"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</Container>
