<Container
  id="steppedContainer1"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  padding="12px"
  showBody={true}
  showBorder={false}
  showFooter={true}
  showHeader={true}
>
  <Header>
    <Steps
      id="steps1"
      horizontalAlign="center"
      itemMode="static"
      navigateContainer={true}
      showStepNumbers={true}
      targetContainerId="steppedContainer1"
      value="{{ self.values[0] }}"
    >
      <Option id="25e9f" value="Step 1" />
      <Option id="2a2d5" value="Step 2" />
      <Option id="7e479" value="Step 3" />
    </Steps>
  </Header>
  <View id="c0743" label="Select image" viewKey="Step 1">
    <Table
      id="selectImageTable"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ getImagesPaginatedForSelectImage.data?.data || [] }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      groupByColumns={{}}
      hasNextPage="{{ !!selectImageCursorDirectory.value.get(selectImageTable.pagination.currentPage+1) }}"
      heightType="auto"
      nextAfterCursor="{{ selectImageCursorDirectory.value.get(selectImageTable.pagination.currentPage+1) }}"
      overflowType="pagination"
      primaryKeyColumnId="15107"
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
        id="32e27"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="name"
        label="Name"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="241e2"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="variant"
        label="Variant"
        placeholder="Select option"
        position="center"
        size={100}
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="1249a"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="repositoryName"
        label="Repository name"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="46ca4"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover" }}
        groupAggregationMode="none"
        hidden="true"
        key="buildUrl"
        label="Build URL"
        position="center"
        size={100}
      />
      <Column
        id="b7da4"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover" }}
        groupAggregationMode="none"
        hidden="true"
        key="deployUrl"
        label="Deploy URL"
        position="center"
        size={100}
      />
      <Column
        id="4afed"
        alignment="left"
        format="boolean"
        groupAggregationMode="none"
        hidden="true"
        key="locked"
        label="Locked"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="72ec1"
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
        id="5a8ee"
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
        id="15107"
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
      <Event
        event="changePage"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getImagesPaginatedForSelectImage"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="selectRow"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getRepositoryDetails"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </View>
  <View id="4ccb7" label="Add tag" viewKey="Step 2">
    <Form
      id="addInternalDependencyForm"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden=""
      hoistFetching={true}
      loading=""
      padding="12px"
      requireValidation={true}
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text id="formTitle8" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <EditableText
          id="editableText10"
          formDataKey="dependencyName"
          label="Name"
          placeholder="Enter value"
          readOnly="true"
          value="{{ selectImageTable.selectedRow.name }}"
        />
        <EditableText
          id="editableText11"
          formDataKey="dependencyVariant"
          label="Variant"
          placeholder="Enter value"
          readOnly="true"
          value="{{ selectImageTable.selectedRow.variant.toLowerCase() }}"
        />
        <EditableText
          id="editableText25"
          formDataKey="repository"
          label="Repository"
          placeholder="Enter value"
          readOnly="true"
          value="{{ selectImageTable.selectedRow.repositoryName }}"
        />
        <Select
          id="selectPossibleTag"
          data="{{ getRepositoryDetails.data ?? [] }}"
          emptyMessage="No options"
          formDataKey="selectedTag"
          hidden="{{ getRepositoryDetails.data?.length === 0 }}"
          label="Select tag"
          labels="{{ item.tags.join('/') }} - {{ new Date(item.pushedAt).toDateString() }}"
          overlayMaxHeight={375}
          placeholder="Select a tag"
          showClear={true}
          showSelectionIndicator={true}
          value=""
          values="{{ item.tags.join('/') }}"
        />
        <Container
          id="container26"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          hidden="{{ getRepositoryDetails.data?.length !== 0 }}"
          padding="12px"
          showBody={true}
          style={{ ordered: [{ background: "highlight" }] }}
        >
          <Header>
            <Text
              id="containerTitle31"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="8fe58" viewKey="View 1">
            <Text
              id="text50"
              horizontalAlign="center"
              value="This image does not have versions available"
              verticalAlign="center"
            />
          </View>
        </Container>
      </Body>
      <Footer>
        <Button
          id="formButton8"
          submit={true}
          submitTargetId="addInternalDependencyForm"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addInternalDependency"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </View>
  <Footer>
    <Button
      id="prevButton1"
      disabled="{{ steppedContainer1.currentViewIndex === 0 }}"
      iconBefore="bold/interface-arrows-left-alternate"
      styleVariant="outline"
      text="Previous"
    >
      <Event
        event="click"
        method="showPreviousVisibleView"
        params={{ ordered: [{ wrap: false }] }}
        pluginId="steppedContainer1"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button30"
      disabled="{{ getRepositoryDetails.data?.length === 0 }}"
      hidden="{{ steppedContainer1.currentViewIndex === 0 }}"
      text="Add dependency"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="addInternalDependency"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="nextButton1"
      disabled="{{ !selectImageTable.selectedRow }}"
      hidden="{{ steppedContainer1.currentViewIndex + 1 === steppedContainer1.viewKeys.length }}"
      text="Next"
    >
      <Event
        event="click"
        method="showNextVisibleView"
        params={{ ordered: [{ wrap: false }] }}
        pluginId="steppedContainer1"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</Container>
