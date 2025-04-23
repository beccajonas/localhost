<Container
  id="steppedContainer3"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  heightType="fixed"
  margin="0"
  padding="12px"
  showBody={true}
  showBorder={false}
  showFooter={true}
  showHeader={true}
>
  <Header>
    <Steps
      id="steps3"
      horizontalAlign="center"
      itemMode="static"
      navigateContainer={true}
      showStepNumbers={true}
      targetContainerId="steppedContainer3"
      value="{{ self.values[0] }}"
    >
      <Option id="5ce5d" value="Step 1" />
      <Option id="9dd3f" value="Step 2" />
      <Option id="5a153" value="Step 3" />
    </Steps>
  </Header>
  <View id="dd5e1" label="Select External Image">
    <Table
      id="selectExternalDependencyImageTable"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ getExternalImagesForSelect.data?.data }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      groupByColumns={{}}
      hasNextPage="{{ !!externalImageDependencyCursorDirectory.value.get(selectExternalDependencyImageTable.pagination.currentPage+1) }}"
      heightType="auto"
      nextAfterCursor="{{ externalImageDependencyCursorDirectory.value.get(selectExternalDependencyImageTable.pagination.currentPage+1) }}"
      overflowType="pagination"
      primaryKeyColumnId="44169"
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
        id="7a96c"
        alignment="left"
        format="date"
        groupAggregationMode="none"
        hidden="true"
        key="createdAt"
        label="Created at"
        position="center"
        size={82.6875}
      />
      <Column
        id="56fa7"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="name"
        label="Name"
        placeholder="Enter value"
        position="center"
        size={97.640625}
        valueOverride="{{ item }}"
      />
      <Column
        id="b45c1"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="variant"
        label="Variant"
        placeholder="Enter value"
        position="center"
        size={88.890625}
      />
      <Column
        id="1c1fc"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="namespace"
        label="Namespace"
        placeholder="Enter value"
        position="center"
        size={98.265625}
        valueOverride="{{ item }}"
      />
      <Column
        id="fefe1"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="repository"
        label="Repository"
        placeholder="Enter value"
        position="center"
        size={98}
        valueOverride="{{ item }}"
      />
      <Column
        id="4cd6d"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover" }}
        groupAggregationMode="none"
        key="hubUrl"
        label="Hub URL"
        position="center"
        size={190.546875}
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
        id="114ee"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        hidden="true"
        key="updatedAt"
        label="Updated at"
        placeholder="Enter value"
        position="center"
        size={132.78125}
      />
      <Column
        id="44169"
        alignment="left"
        editable="false"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="key"
        label="Key"
        placeholder="Enter value"
        position="center"
        size={110.03125}
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
          pluginId="selectExternalDependencyImageTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <Event
        event="changePage"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getExternalImagesForSelect"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </View>
  <View id="06079" label="Dependency details" viewKey="Step 2">
    <Form
      id="addExternalDependencyForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden=""
      padding="12px"
      requireValidation={true}
      showBody={true}
    >
      <Header>
        <Text id="formTitle9" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <EditableText
          id="editableText12"
          formDataKey="dependencyName"
          label="Name"
          placeholder="Enter value"
          value="{{ selectExternalDependencyImageTable.selectedRow.name }}"
        />
        <EditableText
          id="editableText13"
          formDataKey="dependencyVariant"
          label="Variant"
          placeholder="Enter value"
          value="{{ selectExternalDependencyImageTable.selectedRow.variant }}"
        />
        <TextInput
          id="textInput33"
          formDataKey="tag"
          hidden="false"
          label="Tag"
          placeholder="Enter value"
        />
      </Body>
      <Footer>
        <Button
          id="formButton9"
          submit={true}
          submitTargetId="addExternalDependencyForm"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addExternalDependency"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </View>
  <Footer>
    <Button
      id="prevButton3"
      disabled="{{ steppedContainer3.currentViewIndex === 0 }}"
      iconBefore="bold/interface-arrows-left-alternate"
      styleVariant="outline"
      text="Previous"
    >
      <Event
        event="click"
        method="showPreviousVisibleView"
        params={{ ordered: [{ wrap: false }] }}
        pluginId="steppedContainer3"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button17"
      hidden="{{ steppedContainer3.currentViewIndex + 1 !== steppedContainer3.viewKeys.length }}"
      submit={true}
      submitTargetId="addExternalDependencyForm"
      text="Add dependency"
    />
    <Button
      id="nextButton3"
      disabled="{{ !selectExternalDependencyImageTable.selectedRow }}"
      hidden="{{ steppedContainer3.currentViewIndex + 1 === steppedContainer3.viewKeys.length }}"
      iconAfter="bold/interface-arrows-right-alternate"
      text="Next"
    >
      <Event
        event="click"
        method="showNextVisibleView"
        params={{ ordered: [{ wrap: false }] }}
        pluginId="steppedContainer3"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</Container>
